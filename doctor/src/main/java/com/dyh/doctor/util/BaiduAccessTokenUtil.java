package com.dyh.doctor.util;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.log4j.Logger;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.ResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

/**
 * 百度 OAuth token：POST 表单换票，关闭 HttpURLConnection 流式上传。
 */
@Component
public class BaiduAccessTokenUtil {
    private static final Logger log = Logger.getLogger(BaiduAccessTokenUtil.class);
    private static final String TOKEN_URL = "https://aip.baidubce.com/oauth/2.0/token";

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    private final ObjectMapper objectMapper = new ObjectMapper();
    private final RestTemplate restTemplate;
    private final Map<String, CacheItem> memory = new ConcurrentHashMap<>();

    private static class CacheItem {
        String token;
        long expireAt;
    }

    public static RestTemplate baiduRestTemplate(int connectMs, int readMs) {
        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        factory.setConnectTimeout(connectMs);
        factory.setReadTimeout(readMs);
        factory.setOutputStreaming(false);
        RestTemplate restTemplate = new RestTemplate(factory);
        restTemplate.setErrorHandler(new ResponseErrorHandler() {
            @Override
            public boolean hasError(ClientHttpResponse response) {
                return false;
            }

            @Override
            public void handleError(ClientHttpResponse response) {
            }
        });
        return restTemplate;
    }

    public BaiduAccessTokenUtil() {
        this.restTemplate = baiduRestTemplate(8000, 15000);
    }

    public RestTemplate http() {
        return restTemplate;
    }

    public String getToken(String apiKey, String secretKey, String cacheKey) {
        if (apiKey == null || apiKey.trim().isEmpty() || secretKey == null || secretKey.trim().isEmpty()) {
            throw new IllegalStateException("百度 API Key / Secret 未配置或解密失败");
        }
        apiKey = apiKey.trim();
        secretKey = secretKey.trim();
        if (apiKey.startsWith("ENC(") || secretKey.startsWith("ENC(")) {
            throw new IllegalStateException("百度密钥仍是密文，请配置 JASYPT_PWD 后重启");
        }
        String cached = readCache(cacheKey);
        if (cached != null) {
            return cached;
        }
        log.info("Baidu token request cache=" + cacheKey
                + " clientIdLen=" + apiKey.length()
                + " secretLen=" + secretKey.length()
                + " clientPrefix=" + apiKey.substring(0, Math.min(4, apiKey.length())));
        JsonNode root = fetchToken(apiKey, secretKey);
        String token = root.path("access_token").asText(null);
        if (token == null || token.isEmpty()) {
            String err = root.path("error_description").asText(
                    root.path("error_msg").asText(root.path("error").asText("unknown")));
            log.warn("Baidu token error: " + err + ", body=" + root);
            throw new IllegalStateException(humanTokenError(err));
        }
        int expires = root.path("expires_in").asInt(2592000);
        writeCache(cacheKey, token, Math.max(60, expires - 600));
        return token;
    }

    public void invalidate(String cacheKey) {
        memory.remove(cacheKey);
        try {
            stringRedisTemplate.delete(cacheKey);
        } catch (Exception ignored) {
        }
    }

    private static String humanTokenError(String err) {
        if (err == null) {
            err = "unknown";
        }
        if (err.contains("unknown client id") || err.contains("Client authentication failed")
                || err.contains("invalid_client")) {
            return "百度 API Key 已失效或与应用不匹配。请到控制台重置密钥，写入 application-local.properties 后重启";
        }
        return "获取百度 token 失败：" + err;
    }

    private JsonNode fetchToken(String apiKey, String secretKey) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        MultiValueMap<String, String> form = new LinkedMultiValueMap<>();
        form.add("grant_type", "client_credentials");
        form.add("client_id", apiKey);
        form.add("client_secret", secretKey);
        try {
            ResponseEntity<String> resp = restTemplate.postForEntity(
                    TOKEN_URL, new HttpEntity<>(form, headers), String.class);
            JsonNode root = parse(resp.getBody());
            if (root.path("access_token").asText("").isEmpty()) {
                log.warn("Baidu token POST status=" + resp.getStatusCode() + " body=" + resp.getBody());
            }
            return root;
        } catch (Exception e) {
            log.warn("Baidu token POST failed: " + e.getMessage());
            throw new IllegalStateException("获取百度 token 失败：" + e.getMessage());
        }
    }

    private JsonNode parse(String body) {
        try {
            return objectMapper.readTree(body == null || body.isEmpty() ? "{}" : body);
        } catch (Exception e) {
            throw new IllegalStateException("百度 token 响应无法解析");
        }
    }

    private String readCache(String cacheKey) {
        CacheItem mem = memory.get(cacheKey);
        if (mem != null && mem.expireAt > System.currentTimeMillis() && mem.token != null && !mem.token.isEmpty()) {
            return mem.token;
        }
        try {
            String cached = stringRedisTemplate.opsForValue().get(cacheKey);
            if (cached != null && !cached.isEmpty()) {
                return cached;
            }
        } catch (Exception ignored) {
        }
        return null;
    }

    private void writeCache(String cacheKey, String token, int ttlSeconds) {
        CacheItem item = new CacheItem();
        item.token = token;
        item.expireAt = System.currentTimeMillis() + ttlSeconds * 1000L;
        memory.put(cacheKey, item);
        try {
            stringRedisTemplate.opsForValue().set(cacheKey, token, ttlSeconds, TimeUnit.SECONDS);
        } catch (Exception ignored) {
        }
    }
}
