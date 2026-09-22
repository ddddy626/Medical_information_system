package com.dyh.doctor.util;

import org.apache.log4j.Logger;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;

/**
 * 患者登录邮箱验证码：优先 Redis，不可用时回退到进程内缓存。
 */
@Service
public class EmailCodeService {
    private static final Logger log = Logger.getLogger(EmailCodeService.class);

    public static final int CODE_TTL_SECONDS = 300;
    public static final int SEND_INTERVAL_SECONDS = 60;
    public static final int MAX_FAIL_COUNT = 5;
    public static final int DAILY_SEND_LIMIT = 10;

    public static final Pattern EMAIL_PATTERN =
            Pattern.compile("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$");

    private static final String KEY_CODE = "doctor:login:email:code:";
    private static final String KEY_CD = "doctor:login:email:cd:";
    private static final String KEY_FAIL = "doctor:login:email:fail:";
    private static final String KEY_DAY = "doctor:login:email:day:";

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    private final Map<String, MemSlot> memory = new ConcurrentHashMap<>();

    private static class MemSlot {
        String code;
        long codeExpireAt;
        long cdUntil;
        int fails;
        int dayCount;
        String day;
    }

    public static boolean isValidEmail(String email) {
        if (email == null) {
            return false;
        }
        String v = email.trim();
        return !v.isEmpty() && v.length() <= 100 && EMAIL_PATTERN.matcher(v).matches();
    }

    public static String normalizeEmail(String email) {
        return email == null ? null : email.trim().toLowerCase();
    }

    public static boolean isPatientRole(Integer roleType) {
        return roleType != null && (roleType == 2 || roleType == 3);
    }

    public String generateCode() {
        return String.format("%06d", new Random().nextInt(1_000_000));
    }

    /** @return error message, or null if allowed */
    public String checkSendAllowed(String username) {
        try {
            Boolean cd = stringRedisTemplate.hasKey(KEY_CD + username);
            if (Boolean.TRUE.equals(cd)) {
                return "发送过于频繁，请稍后重试";
            }
            String dayKey = KEY_DAY + username;
            String dayCount = stringRedisTemplate.opsForValue().get(dayKey);
            if (dayCount != null && Integer.parseInt(dayCount) >= DAILY_SEND_LIMIT) {
                return "今日验证码发送次数已达上限，请明天再试";
            }
            return null;
        } catch (Exception e) {
            log.warn("Redis unavailable, use memory for email code cooldown: " + e.getMessage());
            return checkSendAllowedMem(username);
        }
    }

    public String saveCode(String username, String code) {
        try {
            stringRedisTemplate.opsForValue().set(KEY_CODE + username, code, CODE_TTL_SECONDS, TimeUnit.SECONDS);
            stringRedisTemplate.opsForValue().set(KEY_CD + username, "1", SEND_INTERVAL_SECONDS, TimeUnit.SECONDS);
            stringRedisTemplate.delete(KEY_FAIL + username);
            String dayKey = KEY_DAY + username;
            Long n = stringRedisTemplate.opsForValue().increment(dayKey);
            if (n != null && n == 1L) {
                stringRedisTemplate.expire(dayKey, 1, TimeUnit.DAYS);
            }
            return null;
        } catch (Exception e) {
            log.warn("Redis save email code failed, use memory: " + e.getMessage());
            return saveCodeMem(username, code);
        }
    }

    public String validateAndConsume(String username, String emailCode) {
        if (emailCode == null || emailCode.trim().isEmpty()) {
            return "请输入邮箱验证码";
        }
        String input = emailCode.trim();
        try {
            String cached = stringRedisTemplate.opsForValue().get(KEY_CODE + username);
            if (cached == null || cached.isEmpty()) {
                return validateAndConsumeMem(username, input);
            }
            if (!cached.equals(input)) {
                Long fails = stringRedisTemplate.opsForValue().increment(KEY_FAIL + username);
                if (fails != null && fails == 1L) {
                    stringRedisTemplate.expire(KEY_FAIL + username, CODE_TTL_SECONDS, TimeUnit.SECONDS);
                }
                if (fails != null && fails >= MAX_FAIL_COUNT) {
                    stringRedisTemplate.delete(KEY_CODE + username);
                    stringRedisTemplate.delete(KEY_FAIL + username);
                    return "验证码错误次数过多，请重新发送";
                }
                return "验证码错误";
            }
            stringRedisTemplate.delete(KEY_CODE + username);
            stringRedisTemplate.delete(KEY_FAIL + username);
            return null;
        } catch (Exception e) {
            log.warn("Redis validate email code failed, use memory: " + e.getMessage());
            return validateAndConsumeMem(username, input);
        }
    }

    public void rollbackUnsentCode(String username) {
        if (username == null || username.trim().isEmpty()) {
            return;
        }
        try {
            stringRedisTemplate.delete(KEY_CODE + username);
            stringRedisTemplate.delete(KEY_CD + username);
            stringRedisTemplate.delete(KEY_FAIL + username);
            String dayKey = KEY_DAY + username;
            String dayCount = stringRedisTemplate.opsForValue().get(dayKey);
            if (dayCount != null) {
                long n = Long.parseLong(dayCount);
                if (n <= 1) {
                    stringRedisTemplate.delete(dayKey);
                } else {
                    stringRedisTemplate.opsForValue().decrement(dayKey);
                }
            }
        } catch (Exception e) {
            log.warn("Redis rollback email code failed, use memory: " + e.getMessage());
        }
        rollbackUnsentCodeMem(username);
    }

    private String checkSendAllowedMem(String username) {
        MemSlot slot = memory.get(username);
        long now = System.currentTimeMillis();
        if (slot != null && slot.cdUntil > now) {
            return "发送过于频繁，请稍后重试";
        }
        String today = LocalDate.now().toString();
        if (slot != null && today.equals(slot.day) && slot.dayCount >= DAILY_SEND_LIMIT) {
            return "今日验证码发送次数已达上限，请明天再试";
        }
        return null;
    }

    private String saveCodeMem(String username, String code) {
        long now = System.currentTimeMillis();
        MemSlot slot = memory.computeIfAbsent(username, k -> new MemSlot());
        String today = LocalDate.now().toString();
        if (!today.equals(slot.day)) {
            slot.day = today;
            slot.dayCount = 0;
        }
        slot.code = code;
        slot.codeExpireAt = now + CODE_TTL_SECONDS * 1000L;
        slot.cdUntil = now + SEND_INTERVAL_SECONDS * 1000L;
        slot.fails = 0;
        slot.dayCount += 1;
        return null;
    }

    private String validateAndConsumeMem(String username, String input) {
        MemSlot slot = memory.get(username);
        long now = System.currentTimeMillis();
        if (slot == null || slot.code == null || slot.codeExpireAt < now) {
            return "验证码已过期，请重新发送";
        }
        if (!slot.code.equals(input)) {
            slot.fails += 1;
            if (slot.fails >= MAX_FAIL_COUNT) {
                slot.code = null;
                slot.fails = 0;
                return "验证码错误次数过多，请重新发送";
            }
            return "验证码错误";
        }
        slot.code = null;
        slot.fails = 0;
        return null;
    }

    private void rollbackUnsentCodeMem(String username) {
        MemSlot slot = memory.get(username);
        if (slot == null) {
            return;
        }
        slot.code = null;
        slot.cdUntil = 0;
        slot.fails = 0;
        if (slot.dayCount > 0) {
            slot.dayCount -= 1;
        }
    }
}
