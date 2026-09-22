package com.dyh.doctor.config;

import com.dyh.doctor.domain.SiteVisitEntity;
import com.dyh.doctor.service.SiteVisitService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.log4j.Logger;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 * 站点 UV/PV Redis → MySQL 同步，以及访问明细缓冲落库。
 */
@Component
public class SiteVisitSyncJob {
    private static final Logger log = Logger.getLogger(SiteVisitSyncJob.class);
    private static final DateTimeFormatter DAY = DateTimeFormatter.ofPattern("yyyyMMdd");
    public static final String VISIT_BUFFER_KEY = "site:visit:buffer";

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Resource
    private SiteVisitService siteVisitService;

    private final ObjectMapper objectMapper = new ObjectMapper();

    /** 每 5 分钟将缓冲访问明细写入 MySQL */
    @Scheduled(fixedRate = 300000)
    public void syncVisitsToMysql() {
        try {
            Long size = stringRedisTemplate.opsForList().size(VISIT_BUFFER_KEY);
            if (size == null || size == 0) {
                return;
            }
            int batch = Math.min(size.intValue(), 500);
            List<String> items = stringRedisTemplate.opsForList().range(VISIT_BUFFER_KEY, 0, batch - 1);
            if (items == null || items.isEmpty()) {
                return;
            }
            int ok = 0;
            for (String json : items) {
                try {
                    SiteVisitEntity visit = objectMapper.readValue(json, SiteVisitEntity.class);
                    if (siteVisitService.insert(visit)) {
                        ok++;
                    }
                } catch (Exception e) {
                    log.warn("Sync visit parse/insert failed: " + e.getMessage());
                }
            }
            stringRedisTemplate.opsForList().trim(VISIT_BUFFER_KEY, batch, -1);
            String day = LocalDate.now().format(DAY);
            String uvKey = "site:uv:" + day;
            String pvKey = "site:pv:" + day;
            Long uv = stringRedisTemplate.opsForHyperLogLog().size(uvKey);
            String pv = stringRedisTemplate.opsForValue().get(pvKey);
            log.info("SiteVisit sync done, inserted=" + ok + ", uv=" + uv + ", pv=" + pv);
        } catch (Exception e) {
            log.warn("SiteVisit sync failed: " + e.getMessage());
        }
    }

    /** 每日 00:01 清理前一天 Redis key */
    @Scheduled(cron = "0 1 0 * * ?")
    public void cleanupYesterdayKeys() {
        try {
            String yesterday = LocalDate.now().minusDays(1).format(DAY);
            stringRedisTemplate.delete("site:uv:" + yesterday);
            stringRedisTemplate.delete("site:pv:" + yesterday);
            log.info("Cleaned site visit redis keys for " + yesterday);
        } catch (Exception e) {
            log.warn("Cleanup site visit keys failed: " + e.getMessage());
        }
    }
}
