package com.dyh.doctor.util;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.zip.GZIPInputStream;

/**
 * 和风天气：HttpURLConnection + UTF-8/GZIP，避免 RestTemplate 乱码与空数据。
 */
@Component
public class WeatherUtil {
    private static final Logger log = Logger.getLogger(WeatherUtil.class);
    private static final long CACHE_SECONDS = 600L;

    @Value("${hefeng.api.key:}")
    private String apiKey;

    @Value("${hefeng.api.host:}")
    private String apiHost;

    @Value("${hefeng.location-id:101010100}")
    private String defaultLocationId;

    @Value("${hefeng.default-city:\u5317\u4eac}")
    private String defaultCityName;

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    private final ObjectMapper objectMapper = new ObjectMapper();

    public Map<String, Object> getWeatherHealthTips(String locationId, String city, String lon, String lat) {
        Map<String, Object> result = new HashMap<>();
        result.put("tips", new ArrayList<String>());

        if (apiKey == null || apiKey.trim().isEmpty()) {
            result.put("msg", "\u672a\u914d\u7f6e\u548c\u98ce\u5929\u6c14 Key");
            return result;
        }
        String host = normalizeHost(apiHost);
        if (host == null) {
            result.put("msg", "\u672a\u914d\u7f6e\u548c\u98ce API Host");
            return result;
        }

        Map<String, String> resolved = resolveLocation(host, locationId, city, lon, lat);
        String loc = resolved.get("locationId");
        result.put("locationId", loc);
        result.put("cityName", resolved.get("cityName"));
        result.put("adm1", resolved.get("adm1"));
        result.put("adm2", resolved.get("adm2"));
        result.put("placeName", resolved.get("placeName"));
        // 空气质量：当前套餐若未开通会 403，前端显示「暂未开通」
        result.put("aqiAvailable", false);

        String cacheKey = "weather:realtime:v4:" + host + ":" + loc;
        try {
            stringRedisTemplate.delete("weather:realtime:" + host + ":" + loc);
            stringRedisTemplate.delete("weather:realtime:v2:" + host + ":" + loc);
            stringRedisTemplate.delete("weather:realtime:v3:" + host + ":" + loc);
            String cached = stringRedisTemplate.opsForValue().get(cacheKey);
            if (cached != null) {
                @SuppressWarnings("unchecked")
                Map<String, Object> map = objectMapper.readValue(cached, Map.class);
                Object nowObj = map.get("now");
                if (nowObj instanceof Map && !((Map<?, ?>) nowObj).isEmpty()) {
                    return map;
                }
            }
        } catch (Exception ignored) {
        }

        try {
            JsonNode now = getJson(buildUrl(host, "/v7/weather/now", loc));
            JsonNode daily = getJson(buildUrl(host, "/v7/weather/3d", loc));
            JsonNode air = getJsonQuiet(buildUrl(host, "/v7/air/now", loc));

            Map<String, Object> nowWeather = new HashMap<>();
            if (now != null && "200".equals(now.path("code").asText())) {
                JsonNode n = now.path("now");
                nowWeather.put("temp", text(n, "temp"));
                nowWeather.put("text", text(n, "text"));
                nowWeather.put("humidity", text(n, "humidity"));
                nowWeather.put("feelsLike", text(n, "feelsLike"));
                nowWeather.put("windDir", text(n, "windDir"));
                nowWeather.put("windScale", text(n, "windScale"));
                nowWeather.put("obsTime", text(n, "obsTime"));
            } else if (now != null) {
                result.put("msg", "weather code=" + now.path("code").asText());
                log.warn("weather/now code=" + now.path("code").asText() + " body=" + now.toString());
            } else {
                result.put("msg", "weather/now empty response");
            }
            result.put("now", nowWeather);
            result.put("updateTime", nowWeather.getOrDefault("obsTime", ""));

            List<Map<String, Object>> forecast = new ArrayList<>();
            Map<String, Object> today = new HashMap<>();
            double todayTempMax = Double.NaN;
            double todayTempMin = Double.NaN;
            double tomorrowTempMax = Double.NaN;
            double tomorrowTempMin = Double.NaN;
            if (daily != null && "200".equals(daily.path("code").asText())) {
                JsonNode days = daily.path("daily");
                for (int i = 0; i < days.size() && i < 3; i++) {
                    JsonNode d = days.get(i);
                    Map<String, Object> day = new HashMap<>();
                    day.put("fxDate", text(d, "fxDate"));
                    day.put("tempMax", text(d, "tempMax"));
                    day.put("tempMin", text(d, "tempMin"));
                    day.put("textDay", text(d, "textDay"));
                    day.put("textNight", text(d, "textNight"));
                    forecast.add(day);
                    if (i == 0) {
                        today.putAll(day);
                        todayTempMax = parseDouble(text(d, "tempMax"));
                        todayTempMin = parseDouble(text(d, "tempMin"));
                    } else if (i == 1) {
                        tomorrowTempMax = parseDouble(text(d, "tempMax"));
                        tomorrowTempMin = parseDouble(text(d, "tempMin"));
                    }
                }
            }
            result.put("today", today);
            result.put("forecast", forecast);

            int aqi = -1;
            boolean aqiAvailable = false;
            if (air != null && "200".equals(air.path("code").asText())) {
                JsonNode airNow = air.path("now");
                aqi = airNow.path("aqi").asInt(-1);
                result.put("aqi", aqi);
                result.put("aqiCategory", text(airNow, "category"));
                aqiAvailable = aqi >= 0;
            }
            result.put("aqiAvailable", aqiAvailable);

            double humidity = parseDouble(String.valueOf(nowWeather.getOrDefault("humidity", "")));
            result.put("tips", buildTips(todayTempMax, todayTempMin, tomorrowTempMax, tomorrowTempMin, aqi, humidity));

            if (!nowWeather.isEmpty()) {
                try {
                    stringRedisTemplate.opsForValue().set(cacheKey, objectMapper.writeValueAsString(result),
                            CacheUtil.jitterTtl(CACHE_SECONDS), TimeUnit.SECONDS);
                } catch (Exception ignored) {
                }
            }
        } catch (Exception e) {
            log.warn("Weather API failed: " + e.getMessage(), e);
            result.put("msg", "weather error: " + e.getMessage());
        }
        return result;
    }

    public Map<String, Object> getWeatherHealthTips(String locationId) {
        return getWeatherHealthTips(locationId, null, null, null);
    }

    private static String text(JsonNode n, String field) {
        JsonNode v = n.path(field);
        if (v.isMissingNode() || v.isNull()) {
            return "";
        }
        return v.asText("");
    }

    private String normalizeHost(String raw) {
        if (raw == null || raw.trim().isEmpty()) {
            return null;
        }
        String h = raw.trim();
        if (h.startsWith("https://")) {
            h = h.substring(8);
        } else if (h.startsWith("http://")) {
            h = h.substring(7);
        }
        while (h.endsWith("/")) {
            h = h.substring(0, h.length() - 1);
        }
        String lower = h.toLowerCase();
        if (lower.equals("devapi.qweather.com") || lower.equals("api.qweather.com") || lower.equals("geoapi.qweather.com")) {
            return null;
        }
        return h;
    }

    private String buildUrl(String host, String path, String location) throws Exception {
        return "https://" + host + path
                + "?location=" + URLEncoder.encode(location, "UTF-8")
                + "&key=" + URLEncoder.encode(apiKey.trim(), "UTF-8");
    }

    private Map<String, String> resolveLocation(String host, String locationId, String city, String lon, String lat) {
        Map<String, String> out = basePlace(defaultLocationId, safeCity(defaultCityName), "", "");

        if (lon != null && lat != null && !lon.trim().isEmpty() && !lat.trim().isEmpty()) {
            Map<String, String> geo = lookupGeo(host, lon.trim() + "," + lat.trim());
            if (geo != null) {
                return geo;
            }
        }
        if (city != null && !city.trim().isEmpty()) {
            Map<String, String> geo = lookupGeo(host, city.trim());
            if (geo != null) {
                return geo;
            }
        }
        if (locationId != null && !locationId.trim().isEmpty()) {
            Map<String, String> geo = lookupGeo(host, locationId.trim());
            if (geo != null) {
                String name = geo.get("cityName");
                if (name != null && !name.isEmpty() && !looksGarbled(name)) {
                    return geo;
                }
                out = basePlace(geo.getOrDefault("locationId", locationId.trim()),
                        cityNameById(geo.getOrDefault("locationId", locationId.trim())),
                        geo.getOrDefault("adm1", ""),
                        geo.getOrDefault("adm2", ""));
                return out;
            }
            return basePlace(locationId.trim(), cityNameById(locationId.trim()), "", "");
        }

        Map<String, String> fallback = lookupGeo(host, defaultLocationId);
        if (fallback != null && !looksGarbled(fallback.get("cityName"))) {
            return fallback;
        }
        return basePlace(defaultLocationId, cityNameById(defaultLocationId), "", "");
    }

    private Map<String, String> basePlace(String id, String name, String adm1, String adm2) {
        Map<String, String> out = new HashMap<>();
        out.put("locationId", id);
        out.put("cityName", name);
        out.put("adm1", adm1 == null ? "" : adm1);
        out.put("adm2", adm2 == null ? "" : adm2);
        out.put("placeName", buildPlaceName(adm1, adm2, name));
        return out;
    }

    /** 省 · 市 · 区/县，自动去重 */
    private static String buildPlaceName(String adm1, String adm2, String name) {
        List<String> parts = new ArrayList<>();
        if (adm1 != null && !adm1.isEmpty() && !looksGarbled(adm1)) {
            parts.add(adm1);
        }
        if (adm2 != null && !adm2.isEmpty() && !looksGarbled(adm2)
                && !adm2.equals(adm1) && !adm2.equals(name)) {
            // 保证市级名称带「市」更易读
            String city = adm2.endsWith("\u5e02") || adm2.endsWith("\u5dde") || adm2.endsWith("\u76df")
                    ? adm2 : adm2 + "\u5e02";
            parts.add(city);
        }
        if (name != null && !name.isEmpty() && !looksGarbled(name)
                && (parts.isEmpty() || !name.equals(parts.get(parts.size() - 1)))) {
            parts.add(name);
        }
        if (parts.isEmpty()) {
            return "\u5f53\u524d\u57ce\u5e02";
        }
        return String.join("\u00b7", parts);
    }

    private Map<String, String> lookupGeo(String host, String location) {
        try {
            String url = "https://" + host + "/geo/v2/city/lookup"
                    + "?location=" + URLEncoder.encode(location, "UTF-8")
                    + "&key=" + URLEncoder.encode(apiKey.trim(), "UTF-8")
                    + "&number=1";
            JsonNode root = getJson(url);
            if (root == null || !"200".equals(root.path("code").asText())) {
                return null;
            }
            JsonNode loc = root.path("location");
            if (!loc.isArray() || loc.size() == 0) {
                return null;
            }
            JsonNode first = loc.get(0);
            String name = first.path("name").asText(safeCity(defaultCityName));
            String adm1 = first.path("adm1").asText("");
            String adm2 = first.path("adm2").asText("");
            String id = first.path("id").asText(defaultLocationId);
            if (looksGarbled(name)) {
                name = cityNameById(id);
            }
            if (looksGarbled(adm1)) {
                adm1 = "";
            }
            if (looksGarbled(adm2)) {
                adm2 = "";
            }
            return basePlace(id, name, adm1, adm2);
        } catch (Exception e) {
            log.warn("Geo lookup failed: " + e.getMessage());
            return null;
        }
    }

    /** 常见城市 ID → 中文名，避免编码损坏时无本地名称 */
    private String cityNameById(String id) {
        if (id == null) {
            return safeCity(defaultCityName);
        }
        switch (id) {
            case "101010100":
                return "\u5317\u4eac";
            case "101020100":
                return "\u4e0a\u6d77";
            case "101280101":
                return "\u5e7f\u5dde";
            case "101280601":
                return "\u6df1\u5733";
            case "101210101":
                return "\u676d\u5dde";
            default:
                return safeCity(defaultCityName);
        }
    }

    private static String safeCity(String name) {
        if (name == null || name.isEmpty() || looksGarbled(name)) {
            return "\u5317\u4eac";
        }
        return name;
    }

    /** 粗判：含典型 Latin-1 误读 UTF-8 的特征 */
    private static boolean looksGarbled(String s) {
        if (s == null || s.isEmpty()) {
            return true;
        }
        // å / Ã / Â 等常见 mojibake 前缀，或替换字符
        return s.indexOf('\u00e5') >= 0 || s.indexOf('\u00c3') >= 0 || s.indexOf('\ufffd') >= 0
                || s.contains("å") || s.contains("Ã");
    }

    private List<String> buildTips(double todayMax, double todayMin, double tomorrowMax, double tomorrowMin,
                                   int aqi, double humidity) {
        List<String> tips = new ArrayList<>();
        if (!Double.isNaN(todayMax) && !Double.isNaN(tomorrowMax)) {
            if (todayMax - tomorrowMax >= 10) {
                tips.add("\u6c14\u6e29\u9a9a\u964d\uff0c\u547c\u5438\u9053\u75be\u75c5\u9ad8\u53d1\uff0c\u6ce8\u610f\u4fdd\u6696");
            }
            if (tomorrowMax - todayMax >= 8) {
                tips.add("\u9ad8\u6e29\u5929\u6c14\uff0c\u6ce8\u610f\u9632\u6691\u964d\u6e29");
            }
        }
        if (!Double.isNaN(todayMin) && !Double.isNaN(tomorrowMin)) {
            if (todayMin - tomorrowMin >= 10 && tips.isEmpty()) {
                tips.add("\u6c14\u6e29\u9a9a\u964d\uff0c\u547c\u5438\u9053\u75be\u75c5\u9ad8\u53d1\uff0c\u6ce8\u610f\u4fdd\u6696");
            }
        }
        if (aqi > 150) {
            tips.add("\u7a7a\u6c14\u6c61\u67d3\uff0c\u51cf\u5c11\u5916\u51fa");
        }
        if (!Double.isNaN(humidity) && humidity > 90) {
            tips.add("\u7a7a\u6c14\u6f6e\u6e7f\uff0c\u5173\u8282\u60a3\u8005\u6ce8\u610f\u4fdd\u6696");
        }
        if (tips.isEmpty()) {
            tips.add("\u5929\u6c14\u9002\u5b9c\uff0c\u6ce8\u610f\u89c4\u5f8b\u4f5c\u606f\u4e0e\u9002\u5ea6\u8fd0\u52a8");
        }
        return tips;
    }

    private JsonNode getJson(String url) {
        try {
            byte[] body = httpGetBytes(url);
            if (body == null || body.length == 0) {
                return null;
            }
            return objectMapper.readTree(new String(body, StandardCharsets.UTF_8));
        } catch (Exception e) {
            log.warn("Weather request failed: " + e.getMessage() + " url=" + url.replaceAll("key=[^&]+", "key=***"));
            return null;
        }
    }

    private JsonNode getJsonQuiet(String url) {
        try {
            byte[] body = httpGetBytes(url);
            if (body == null || body.length == 0) {
                return null;
            }
            return objectMapper.readTree(new String(body, StandardCharsets.UTF_8));
        } catch (Exception e) {
            return null;
        }
    }

    private byte[] httpGetBytes(String url) throws Exception {
        HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
        conn.setConnectTimeout(8000);
        conn.setReadTimeout(10000);
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Accept", "application/json");
        conn.setRequestProperty("Accept-Charset", "UTF-8");
        // 主动声明可接收 gzip，并手动解压，避免乱码/解析失败
        conn.setRequestProperty("Accept-Encoding", "gzip");
        conn.connect();
        int code = conn.getResponseCode();
        InputStream raw = code >= 400 ? conn.getErrorStream() : conn.getInputStream();
        if (raw == null) {
            return null;
        }
        String encoding = conn.getContentEncoding();
        InputStream in = raw;
        if (encoding != null && encoding.toLowerCase().contains("gzip")) {
            in = new GZIPInputStream(raw);
        }
        try {
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] buf = new byte[4096];
            int n;
            while ((n = in.read(buf)) >= 0) {
                bos.write(buf, 0, n);
            }
            if (code >= 400) {
                log.warn("Weather HTTP " + code + " body=" + new String(bos.toByteArray(), StandardCharsets.UTF_8));
                return null;
            }
            return bos.toByteArray();
        } finally {
            try { in.close(); } catch (Exception ignored) {}
            conn.disconnect();
        }
    }

    private static double parseDouble(String s) {
        try {
            return Double.parseDouble(s);
        } catch (Exception e) {
            return Double.NaN;
        }
    }
}
