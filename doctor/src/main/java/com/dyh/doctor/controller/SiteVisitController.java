package com.dyh.doctor.controller;

import com.dyh.doctor.config.SiteVisitSyncJob;
import com.dyh.doctor.domain.SiteVisitEntity;
import com.dyh.doctor.service.SiteVisitService;
import com.dyh.doctor.util.ReturnVO;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.*;
import org.springframework.data.domain.Page;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@RestController
@RequestMapping("siteVisit")
public class SiteVisitController {

    private static final DateTimeFormatter DAY = DateTimeFormatter.ofPattern("yyyyMMdd");

    @Resource
    private SiteVisitService siteVisitService;

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    private final ObjectMapper objectMapper = new ObjectMapper();

    @RequestMapping("queryByPage")
    public ReturnVO queryByPage(SiteVisitEntity siteVisit, Integer page, Integer size) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        Page<SiteVisitEntity> pageVO = siteVisitService.queryByPage(siteVisit, page, size);
        if (pageVO.getContent().isEmpty()) {
            return returnVO;
        }
        returnVO = ReturnVO.getSuccessDataReturnVO(pageVO);
        return returnVO;
    }

    @RequestMapping("record")
    public ReturnVO record(HttpServletRequest request) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        SiteVisitEntity visit = new SiteVisitEntity();
        visit.setVisitTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        visit.setVisitUrl(request.getHeader("Referer"));
        visit.setVisitorIp(request.getRemoteAddr());

        // 保持原有即时入库，保证 queryByPage 行为不变
        if (!siteVisitService.insert(visit)) {
            return returnVO;
        }

        // 额外写入 Redis UV/PV（失败不影响主流程）
        try {
            String day = LocalDate.now().format(DAY);
            HttpSession session = request.getSession(true);
            stringRedisTemplate.opsForHyperLogLog().add("site:uv:" + day, session.getId());
            stringRedisTemplate.opsForValue().increment("site:pv:" + day);
            stringRedisTemplate.opsForList().rightPush(SiteVisitSyncJob.VISIT_BUFFER_KEY,
                    objectMapper.writeValueAsString(visit));
        } catch (Exception ignored) {
        }

        returnVO.setCode(1);
        returnVO.setMsg("ok");
        return returnVO;
    }
}
