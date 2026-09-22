package com.dyh.doctor.util;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 病历/检查报告：调用百度 OCR 抽取文字（不是物体分类）。
 */
@Component
public class BaiduImageRecognitionUtil {
    private static final Logger log = Logger.getLogger(BaiduImageRecognitionUtil.class);
    private static final String TOKEN_CACHE_KEY = "baidu:image:access_token:v3";
    private static final String OCR_BASIC =
            "https://aip.baidubce.com/rest/2.0/ocr/v1/general_basic";
    private static final String OCR_ACCURATE =
            "https://aip.baidubce.com/rest/2.0/ocr/v1/accurate_basic";

    @Value("${baidu.image.api-key:}")
    private String apiKey;

    @Value("${baidu.image.secret-key:}")
    private String secretKey;

    @Value("${baidu.ocr.url:https://aip.baidubce.com/rest/2.0/ocr/v1/general_basic}")
    private String ocrUrl;

    @Resource
    private BaiduAccessTokenUtil baiduAccessTokenUtil;

    private final ObjectMapper objectMapper = new ObjectMapper();
    private final RestTemplate restTemplate;

    public BaiduImageRecognitionUtil() {
        this.restTemplate = BaiduAccessTokenUtil.baiduRestTemplate(8000, 25000);
    }

    public List<Map<String, Object>> recognize(byte[] imageBytes) {
        List<String> lines = ocrLines(imageBytes);
        List<Map<String, Object>> results = new ArrayList<>();
        for (String line : lines) {
            Map<String, Object> item = new HashMap<>();
            item.put("keyword", line);
            item.put("score", 1.0);
            results.add(item);
        }
        return results;
    }

    public String recognizeAsText(List<Map<String, Object>> list) {
        if (list == null || list.isEmpty()) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        for (Map<String, Object> item : list) {
            Object kw = item.get("keyword");
            if (kw == null) {
                continue;
            }
            String line = String.valueOf(kw).trim();
            if (line.isEmpty()) {
                continue;
            }
            if (sb.length() > 0) {
                sb.append('\n');
            }
            sb.append(line);
        }
        return sb.toString();
    }

    private List<String> ocrLines(byte[] imageBytes) {
        if (imageBytes == null || imageBytes.length == 0) {
            throw new IllegalStateException("图片为空");
        }
        try {
            return ocrOnce(imageBytes, ocrUrl, false);
        } catch (IllegalStateException e) {
            if (e.getMessage() != null && e.getMessage().contains("token")) {
                baiduAccessTokenUtil.invalidate(TOKEN_CACHE_KEY);
                return ocrOnce(imageBytes, ocrUrl, true);
            }
            if (e.getMessage() != null && e.getMessage().contains("无权限")
                    && !OCR_ACCURATE.equals(ocrUrl)) {
                log.warn("OCR basic denied, try accurate_basic");
                return ocrOnce(imageBytes, OCR_ACCURATE, true);
            }
            throw e;
        }
    }

    private List<String> ocrOnce(byte[] imageBytes, String url, boolean retried) {
        String token = baiduAccessTokenUtil.getToken(apiKey, secretKey, TOKEN_CACHE_KEY);
        String b64 = Base64.getEncoder().encodeToString(imageBytes);
        String form = "access_token=" + URLEncoder.encode(token, StandardCharsets.UTF_8)
                + "&image=" + URLEncoder.encode(b64, StandardCharsets.UTF_8)
                + "&language_type=CHN_ENG"
                + "&detect_direction=true";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application", "x-www-form-urlencoded", StandardCharsets.UTF_8));
        ResponseEntity<String> resp = restTemplate.postForEntity(
                url + "?access_token=" + URLEncoder.encode(token, StandardCharsets.UTF_8),
                new HttpEntity<>(form, headers), String.class);
        JsonNode root;
        try {
            root = objectMapper.readTree(resp.getBody() == null || resp.getBody().isEmpty() ? "{}" : resp.getBody());
        } catch (Exception e) {
            throw new IllegalStateException("文字识别响应无法解析");
        }
        int err = root.path("error_code").asInt(0);
        if (resp.getStatusCodeValue() == 401 || err == 110 || err == 111) {
            if (!retried) {
                throw new IllegalStateException("token 失效");
            }
            throw new IllegalStateException("文字识别鉴权失败");
        }
        if (err == 6 || err == 14 || err == 17 || err == 18 || err == 19) {
            throw new IllegalStateException("文字识别无权限，请在百度控制台为该应用开通「通用文字识别」");
        }
        if (err != 0) {
            String msg = root.path("error_msg").asText("unknown");
            log.warn("Baidu OCR error: " + err + " " + msg);
            throw new IllegalStateException("文字识别失败：" + msg + "（" + err + "）");
        }
        List<String> lines = new ArrayList<>();
        JsonNode arr = root.path("words_result");
        if (arr.isArray()) {
            for (JsonNode n : arr) {
                String words = n.path("words").asText("").trim();
                if (!words.isEmpty()) {
                    lines.add(words);
                }
            }
        }
        return lines;
    }
}
