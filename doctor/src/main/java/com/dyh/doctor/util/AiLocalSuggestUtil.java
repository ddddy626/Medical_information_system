package com.dyh.doctor.util;

/**
 * 仅当 deepseek.fallback-on-error=true 时使用的本地兜底（非 AI）。
 */
public final class AiLocalSuggestUtil {

    private AiLocalSuggestUtil() {
    }

    public static String suggest(String question) {
        if (question == null || question.trim().isEmpty()) {
            return "请描述您的症状或健康问题。本段为本地模板，非 AI 生成。";
        }
        String q = question.trim();

        if (containsAny(q, "头疼", "头痛") && !containsAny(q, "发热", "发烧", "咽痛", "喉咙痛")) {
            return "您提到头痛，建议先休息、保证睡眠并避免长时间用眼；若头痛剧烈、突然加重或伴呕吐、视物模糊，请尽快到神经内科或急诊就诊。本段为本地模板，非 AI 生成。";
        }
        if (containsAny(q, "发热", "发烧") && containsAny(q, "咽痛", "喉咙痛", "头痛", "头疼")) {
            return "您提到发热伴咽痛、头痛，建议居家休息、多饮水并监测体温；若高热超过三天不退或吞咽困难，请尽快到发热门诊或内科就诊。本段为本地模板，非 AI 生成。";
        }
        if (containsAny(q, "发热", "发烧")) {
            return "您提到发热，建议多饮水休息并监测体温；若持续高热或伴呼吸困难，请尽快就医。本段为本地模板，非 AI 生成。";
        }
        if (containsAny(q, "胸闷", "心慌", "胸痛", "心悸")) {
            return "胸闷心慌需重视，请先休息；若伴大汗、呼吸困难或持续胸痛，请立即急诊。本段为本地模板，非 AI 生成。";
        }
        if (containsAny(q, "血压", "偏高", "高血压")) {
            return "血压偏高时建议低盐饮食、规律作息并每日测量记录；若明显升高或伴头晕胸闷，请及时就医。本段为本地模板，非 AI 生成。";
        }
        if (containsAny(q, "咳嗽", "咳痰", "夜间咳")) {
            return "咳嗽时请注意保暖、多饮水；若伴高热、咳血或超过两周不好转，建议到呼吸内科就诊。本段为本地模板，非 AI 生成。";
        }
        if (containsAny(q, "腹痛", "腹泻", "呕吐", "恶心")) {
            return "消化道不适时建议清淡饮食、补液休息；若剧烈腹痛或反复呕吐，请尽快就医。本段为本地模板，非 AI 生成。";
        }

        return "根据您的描述，建议观察症状变化并及时就医。本段为本地模板，非 AI 生成。";
    }

    private static boolean containsAny(String text, String... keywords) {
        for (String kw : keywords) {
            if (text.contains(kw)) {
                return true;
            }
        }
        return false;
    }
}
