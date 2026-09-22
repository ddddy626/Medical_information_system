package com.dyh.doctor.controller;

import com.dyh.doctor.util.ReturnVO;
import com.dyh.doctor.util.WeatherUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 实时天气组件接口。
 */
@RestController
@RequestMapping("weather")
public class WeatherController {

    @Resource
    private WeatherUtil weatherUtil;

    /**
     * 按 LocationID / 城市名 / 经纬度 获取当日实时天气与健康提醒。
     * 优先：locationId > lon+lat（浏览器定位）> city > 默认城市
     */
    @RequestMapping("health-tips")
    public ReturnVO healthTips(@RequestParam(required = false) String locationId,
                               @RequestParam(required = false) String city,
                               @RequestParam(required = false) String lon,
                               @RequestParam(required = false) String lat) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        Map<String, Object> data = weatherUtil.getWeatherHealthTips(locationId, city, lon, lat);
        returnVO.setCode(1);
        returnVO.setMsg("success");
        returnVO.setContent(data);
        return returnVO;
    }
}
