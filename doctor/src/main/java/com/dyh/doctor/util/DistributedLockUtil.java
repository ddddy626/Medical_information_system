package com.dyh.doctor.util;

import org.apache.log4j.Logger;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * Redis 分布式锁（SET NX + 超时），用于挂号防超卖。
 */
@Component
public class DistributedLockUtil {
    private static final Logger log = Logger.getLogger(DistributedLockUtil.class);
    private static final DefaultRedisScript<Long> UNLOCK_SCRIPT = new DefaultRedisScript<>(
            "if redis.call('get', KEYS[1]) == ARGV[1] then return redis.call('del', KEYS[1]) else return 0 end",
            Long.class);

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    /**
     * @return 锁 token；获取失败返回 null
     */
    public String tryLock(String key, long timeoutSeconds) {
        String token = UUID.randomUUID().toString();
        try {
            Boolean ok = stringRedisTemplate.opsForValue()
                    .setIfAbsent(key, token, timeoutSeconds, TimeUnit.SECONDS);
            return Boolean.TRUE.equals(ok) ? token : null;
        } catch (Exception e) {
            log.warn("tryLock failed, key=" + key + ", " + e.getMessage());
            // Redis 不可用时放行，避免阻断挂号主流程
            return "fallback-" + token;
        }
    }

    public void unlock(String key, String token) {
        if (token == null || token.startsWith("fallback-")) {
            return;
        }
        try {
            stringRedisTemplate.execute(UNLOCK_SCRIPT, Collections.singletonList(key), token);
        } catch (Exception e) {
            log.warn("unlock failed, key=" + key + ", " + e.getMessage());
        }
    }
}
