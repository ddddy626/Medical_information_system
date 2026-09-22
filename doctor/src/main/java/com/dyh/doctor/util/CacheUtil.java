package com.dyh.doctor.util;

import org.apache.log4j.Logger;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.Random;
import java.util.concurrent.TimeUnit;

/**
 * Redis 缓存读写封装：命中返回；未命中由调用方查库后写入。
 * Redis 异常时静默降级，不影响主流程。
 */
@Component
public class CacheUtil {
    private static final Logger log = Logger.getLogger(CacheUtil.class);
    private static final String EMPTY_MARKER = "__EMPTY__";
    private static final long EMPTY_TTL_SECONDS = 30L;
    private static final Random RANDOM = new Random();

    @Resource
    private RedisTemplate<String, Object> redisTemplate;

    public Object get(String key) {
        try {
            Object val = redisTemplate.opsForValue().get(key);
            if (EMPTY_MARKER.equals(val)) {
                return null;
            }
            return val;
        } catch (Exception e) {
            log.warn("Redis get failed, key=" + key + ", " + e.getMessage());
            return null;
        }
    }

    public boolean hasKey(String key) {
        try {
            Boolean exists = redisTemplate.hasKey(key);
            return Boolean.TRUE.equals(exists);
        } catch (Exception e) {
            return false;
        }
    }

    /** 是否为空结果缓存命中（防穿透） */
    public boolean isEmptyCached(String key) {
        try {
            Object val = redisTemplate.opsForValue().get(key);
            return EMPTY_MARKER.equals(val);
        } catch (Exception e) {
            return false;
        }
    }

    public void set(String key, Object value, long baseTtlSeconds) {
        try {
            if (value == null) {
                redisTemplate.opsForValue().set(key, EMPTY_MARKER, EMPTY_TTL_SECONDS, TimeUnit.SECONDS);
                return;
            }
            if (value instanceof Collection && ((Collection<?>) value).isEmpty()) {
                redisTemplate.opsForValue().set(key, EMPTY_MARKER, EMPTY_TTL_SECONDS, TimeUnit.SECONDS);
                return;
            }
            redisTemplate.opsForValue().set(key, value, jitterTtl(baseTtlSeconds), TimeUnit.SECONDS);
        } catch (Exception e) {
            log.warn("Redis set failed, key=" + key + ", " + e.getMessage());
        }
    }

    public void delete(String key) {
        try {
            redisTemplate.delete(key);
        } catch (Exception e) {
            log.warn("Redis delete failed, key=" + key + ", " + e.getMessage());
        }
    }

    public void deleteByPattern(String pattern) {
        try {
            java.util.Set<String> keys = redisTemplate.keys(pattern);
            if (keys != null && !keys.isEmpty()) {
                redisTemplate.delete(keys);
            }
        } catch (Exception e) {
            log.warn("Redis deleteByPattern failed, pattern=" + pattern + ", " + e.getMessage());
        }
    }

    /** TTL 随机偏移 ±20%，防雪崩 */
    public static long jitterTtl(long baseSeconds) {
        double factor = 0.8 + RANDOM.nextDouble() * 0.4;
        return Math.max(1L, Math.round(baseSeconds * factor));
    }
}
