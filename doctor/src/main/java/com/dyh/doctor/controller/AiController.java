package com.dyh.doctor.controller;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.dyh.doctor.config.SentinelConfig;
import com.dyh.doctor.util.AiLocalSuggestUtil;
import com.dyh.doctor.util.BaiduImageRecognitionUtil;
import com.dyh.doctor.util.BaiduVoiceRecognitionUtil;
import com.dyh.doctor.util.ReturnVO;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Duration;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("ai")
public class AiController {
    private static final Logger log = Logger.getLogger(AiController.class);
    private static final int DAILY_AI_LIMIT = 20;
    private static final Integer ADMIN_ROLE = 0;
    private static final DateTimeFormatter DAY = DateTimeFormatter.ofPattern("yyyyMMdd");

    @Value("${deepseek.api.url:https://api.deepseek.com/v1/chat/completions}")
    private String deepseekApiUrl;

    @Value("${deepseek.model:deepseek-reasoner}")
    private String deepseekModel;

    @Value("${deepseek.api.key:}")
    private String deepseekApiKey;

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Resource
    private BaiduImageRecognitionUtil baiduImageRecognitionUtil;

    @Resource
    private BaiduVoiceRecognitionUtil baiduVoiceRecognitionUtil;

    private final ObjectMapper objectMapper = new ObjectMapper();

    @PostMapping("suggest")
    @SentinelResource(value = SentinelConfig.AI_SUGGEST_RESOURCE,
            blockHandler = "suggestBlockHandler",
            fallback = "suggestFallback")
    public ReturnVO suggest(@RequestBody Map<String, String> payload, HttpSession session) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        String question = payload == null ? null : payload.get("question");
        if (question == null || question.trim().isEmpty()) {
            returnVO.setMsg("问题不能为空");
            return returnVO;
        }

        if (!passRateLimit(session)) {
            returnVO.setMsg("今日咨询次数已用完");
            return returnVO;
        }

        String imageContext = payload.get("imageContext");
        String imageUrl = payload.get("imageUrl");

        if (deepseekApiKey == null || deepseekApiKey.trim().isEmpty()) {
            return localSuggest(returnVO, question, "未配置 DeepSeek API Key，已返回本地建议");
        }

        try {
            String suggestion = callDeepSeek(question.trim(), imageContext, imageUrl);
            if (suggestion == null || suggestion.isEmpty()) {
                returnVO.setMsg("未获取到建议，请稍后重试");
                return returnVO;
            }
            Map<String, Object> data = new HashMap<>();
            data.put("suggestion", suggestion);
            returnVO.setCode(1);
            returnVO.setMsg("获取建议成功");
            returnVO.setContent(data);
            return returnVO;
        } catch (Exception e) {
            log.warn("DeepSeek调用失败: " + e.getMessage());
            return localSuggest(returnVO, question, "DeepSeek调用失败，当前为非 AI 模式");
        }
    }

    /** 上传检查报告/咨询图片，返回百度识图结果（失败不阻断） */
    @PostMapping("recognizeImage")
    public ReturnVO recognizeImage(@RequestParam("file") MultipartFile file) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        try {
            if (file == null || file.isEmpty()) {
                returnVO.setMsg("请上传图片");
                return returnVO;
            }
            List<Map<String, Object>> results = baiduImageRecognitionUtil.recognize(file.getBytes());
            String text = baiduImageRecognitionUtil.recognizeAsText(results);
            Map<String, Object> data = new HashMap<>();
            data.put("results", results);
            data.put("imageContext", text);
            data.put("mode", "ocr");
            if (text == null || text.isEmpty()) {
                returnVO.setMsg("未识别到文字，请换一张更清晰的图片");
                return returnVO;
            }
            returnVO.setCode(1);
            returnVO.setMsg("识别成功");
            returnVO.setContent(data);
            return returnVO;
        } catch (Exception e) {
            returnVO.setMsg("文字识别失败：" + e.getMessage());
            return returnVO;
        }
    }

    /** 语音识别：返回文字，由前端确认后发送 */
    @PostMapping("voice/recognize")
    public ReturnVO voiceRecognize(@RequestParam("file") MultipartFile file,
                                   @RequestParam(value = "format", required = false, defaultValue = "wav") String format,
                                   @RequestParam(value = "rate", required = false, defaultValue = "16000") Integer rate) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        try {
            if (file == null || file.isEmpty()) {
                returnVO.setMsg("请上传音频");
                return returnVO;
            }
            String text = baiduVoiceRecognitionUtil.recognize(file.getBytes(), format, rate == null ? 16000 : rate);
            if (text == null || text.isEmpty()) {
                returnVO.setMsg("未识别到有效语音，请靠近麦克风后重试");
                return returnVO;
            }
            Map<String, Object> data = new HashMap<>();
            data.put("text", text);
            returnVO.setCode(1);
            returnVO.setMsg("识别成功");
            returnVO.setContent(data);
            return returnVO;
        } catch (Exception e) {
            returnVO.setMsg("语音识别失败：" + e.getMessage());
            return returnVO;
        }
    }

    public ReturnVO suggestBlockHandler(Map<String, String> payload, HttpSession session, BlockException ex) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        returnVO.setMsg("咨询人数较多，请稍后");
        return returnVO;
    }

    public ReturnVO suggestFallback(Map<String, String> payload, HttpSession session, Throwable ex) {
        String question = payload == null ? null : payload.get("question");
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        return localSuggest(returnVO, question, "当前为非 AI 模式");
    }

    private boolean passRateLimit(HttpSession session) {
        Object roleObj = session.getAttribute("loginRoleType");
        if (roleObj instanceof Integer && ADMIN_ROLE.equals(roleObj)) {
            return true;
        }
        Object userIdObj = session.getAttribute("loginUserId");
        String userKey = userIdObj != null ? String.valueOf(userIdObj) : session.getId();
        String day = LocalDate.now().format(DAY);
        String key = "ai:ratelimit:" + userKey + ":" + day;
        try {
            Long count = stringRedisTemplate.opsForValue().increment(key);
            if (count != null && count == 1L) {
                long seconds = secondsUntilEndOfDay();
                stringRedisTemplate.expire(key, seconds, TimeUnit.SECONDS);
            }
            return count == null || count <= DAILY_AI_LIMIT;
        } catch (Exception e) {
            log.warn("AI rate limit redis failed, allow request: " + e.getMessage());
            return true;
        }
    }

    private static long secondsUntilEndOfDay() {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime end = LocalDateTime.of(LocalDate.now(), LocalTime.of(23, 59, 59));
        long sec = Duration.between(now, end).getSeconds();
        return Math.max(1L, sec);
    }

    private String callDeepSeek(String question, String imageContext, String imageUrl) throws Exception {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(deepseekApiKey.trim());

        List<Map<String, Object>> messages = new ArrayList<>();
        Map<String, Object> systemMsg = new HashMap<>();
        systemMsg.put("role", "system");
        systemMsg.put("content", "可综合分析文字描述和医学影像识别结果，给出安全健康建议，提醒不能替代医生诊断");
        messages.add(systemMsg);

        Map<String, Object> userMsg = new HashMap<>();
        userMsg.put("role", "user");

        StringBuilder textPart = new StringBuilder("请给我一段话字数在100字左右无多余符号只要文字，");
        textPart.append(question);
        if (imageContext != null && !imageContext.trim().isEmpty()) {
            textPart.append("。").append(imageContext.trim());
        }

        if (imageUrl != null && !imageUrl.trim().isEmpty()) {
            // 多模态：content 数组含 text + image_url；无图时保持纯文本兼容
            List<Map<String, Object>> contentArr = new ArrayList<>();
            Map<String, Object> textNode = new HashMap<>();
            textNode.put("type", "text");
            textNode.put("text", textPart.toString());
            contentArr.add(textNode);
            Map<String, Object> imageNode = new HashMap<>();
            imageNode.put("type", "image_url");
            Map<String, String> imageUrlObj = new HashMap<>();
            imageUrlObj.put("url", imageUrl.trim());
            imageNode.put("image_url", imageUrlObj);
            contentArr.add(imageNode);
            userMsg.put("content", contentArr);
        } else {
            userMsg.put("content", textPart.toString());
        }
        messages.add(userMsg);

        Map<String, Object> reqBody = new HashMap<>();
        reqBody.put("model", deepseekModel);
        reqBody.put("messages", messages);
        reqBody.put("temperature", 0.6);

        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(reqBody, headers);
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.postForEntity(deepseekApiUrl, entity, String.class);

        JsonNode root = objectMapper.readTree(response.getBody());
        JsonNode contentNode = root.path("choices").path(0).path("message").path("content");
        if (contentNode.isMissingNode() || contentNode.asText().trim().isEmpty()) {
            return null;
        }
        return contentNode.asText().trim();
    }

    private ReturnVO localSuggest(ReturnVO returnVO, String question, String msg) {
        Map<String, Object> data = new HashMap<>();
        data.put("suggestion", AiLocalSuggestUtil.suggest(question) + "（当前为非 AI 模式）");
        returnVO.setCode(1);
        returnVO.setMsg(msg);
        returnVO.setContent(data);
        return returnVO;
    }
}
