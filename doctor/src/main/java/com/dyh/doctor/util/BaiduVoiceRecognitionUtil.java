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
import java.util.Base64;

/**
 * 百度短语音识别（当前账号开通的是极速版 pro_api）。
 * 仅支持 pcm / wav / amr / m4a，采样率 16000。
 */
@Component
public class BaiduVoiceRecognitionUtil {
    private static final Logger log = Logger.getLogger(BaiduVoiceRecognitionUtil.class);
    private static final String TOKEN_CACHE_KEY = "baidu:voice:access_token:v3";

    @Value("${baidu.voice.api-key:}")
    private String apiKey;

    @Value("${baidu.voice.secret-key:}")
    private String secretKey;

    @Value("${baidu.voice.asr-url:https://vop.baidu.com/pro_api}")
    private String asrUrl;

    @Value("${baidu.voice.dev-pid:80001}")
    private int devPid;

    @Resource
    private BaiduAccessTokenUtil baiduAccessTokenUtil;

    private final ObjectMapper objectMapper = new ObjectMapper();
    private final RestTemplate restTemplate;

    public BaiduVoiceRecognitionUtil() {
        this.restTemplate = BaiduAccessTokenUtil.baiduRestTemplate(8000, 25000);
    }

    public String recognize(byte[] audioBytes, String format, int rate) {
        if (audioBytes == null || audioBytes.length == 0) {
            throw new IllegalStateException("音频为空");
        }
        String fmt = (format == null || format.isEmpty()) ? "wav" : format.toLowerCase();
        if (isWav(audioBytes)) {
            fmt = "wav";
        }
        if ("webm".equals(fmt) || "ogg".equals(fmt) || "mp3".equals(fmt)) {
            throw new IllegalStateException("请强制刷新页面(Ctrl+F5)后再试，需使用新版 16k WAV 录音");
        }
        int sampleRate = rate <= 0 ? 16000 : rate;
        if (sampleRate != 16000 && sampleRate != 8000) {
            sampleRate = 16000;
        }
        try {
            String token = baiduAccessTokenUtil.getToken(apiKey, secretKey, TOKEN_CACHE_KEY);
            String json = objectMapper.createObjectNode()
                    .put("format", fmt)
                    .put("rate", sampleRate)
                    .put("channel", 1)
                    .put("cuid", "doctor-codex")
                    .put("token", token)
                    .put("dev_pid", devPid)
                    .put("speech", Base64.getEncoder().encodeToString(audioBytes))
                    .put("len", audioBytes.length)
                    .toString();

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            ResponseEntity<String> resp = restTemplate.postForEntity(asrUrl, new HttpEntity<>(json, headers), String.class);
            JsonNode root = objectMapper.readTree(resp.getBody() == null ? "{}" : resp.getBody());
            int errNo = root.path("err_no").asInt(-1);
            if (errNo != 0) {
                String errMsg = root.path("err_msg").asText("unknown");
                log.warn("Baidu ASR error: " + errNo + " " + errMsg);
                if (errNo == 3302) {
                    throw new IllegalStateException("语音识别无权限，请确认应用已开通「短语音识别极速版」");
                }
                throw new IllegalStateException("语音识别失败：" + errMsg + "（" + errNo + "）");
            }
            JsonNode result = root.path("result");
            if (result.isArray() && result.size() > 0) {
                return result.get(0).asText("").trim();
            }
            return "";
        } catch (IllegalStateException e) {
            throw e;
        } catch (Exception e) {
            log.warn("Baidu voice recognize failed: " + e.getMessage());
            throw new IllegalStateException("语音识别请求失败：" + e.getMessage());
        }
    }

    private static boolean isWav(byte[] data) {
        return data != null && data.length >= 12
                && data[0] == 'R' && data[1] == 'I' && data[2] == 'F' && data[3] == 'F'
                && data[8] == 'W' && data[9] == 'A' && data[10] == 'V' && data[11] == 'E';
    }
}
