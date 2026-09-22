package com.dyh.doctor.controller;

import com.dyh.doctor.domain.AnnouncementEntity;
import com.dyh.doctor.service.AnnouncementService;
import com.dyh.doctor.util.ReturnVO;
import com.dyh.doctor.util.WeatherUtil;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/announcementInfo")
public class AnnouncementController {
    @Resource
    private AnnouncementService service;

    @Resource
    private WeatherUtil weatherUtil;

    @RequestMapping("/queryByPage")
    public ReturnVO queryByPage(AnnouncementEntity entity, Integer page, Integer size) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        if (page == null || page <= 0) {
            page = 1;
        }
        if (size == null || size <= 0) {
            size = 10;
        }
        List<AnnouncementEntity> list = service.queryByPage(page, size);
        int total = service.count();
        Map<String, Object> content = new HashMap<>();
        content.put("content", list);
        content.put("totalElements", total);
        content.put("totalPages", size == 0 ? 0 : (total + size - 1) / size);
        returnVO.setCode(1);
        returnVO.setMsg("success");
        returnVO.setContent(content);
        return returnVO;
    }

    /** 天气健康提醒（兼容挂在公告控制器下的路径） */
    @RequestMapping("/weather/health-tips")
    public ReturnVO weatherHealthTips(@RequestParam(required = false) String locationId) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        Map<String, Object> data = weatherUtil.getWeatherHealthTips(locationId);
        returnVO.setCode(1);
        returnVO.setMsg("success");
        returnVO.setContent(data);
        return returnVO;
    }

    @RequestMapping("/add")
    public ReturnVO add(@RequestBody AnnouncementEntity entity) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        int id = service.add(entity);
        if (id > 0) {
            returnVO.setCode(1);
            returnVO.setMsg("添加成功");
            returnVO.setContent(id);
        }
        return returnVO;
    }

    @RequestMapping("/edit")
    public ReturnVO edit(@RequestBody AnnouncementEntity entity) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        if (service.edit(entity) > 0) {
            returnVO.setCode(1);
            returnVO.setMsg("更新成功");
        }
        return returnVO;
    }

    @RequestMapping("/delete")
    public ReturnVO delete(@RequestParam Integer announcementId) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        if (service.deleteById(announcementId) > 0) {
            returnVO.setCode(1);
            returnVO.setMsg("删除成功");
        }
        return returnVO;
    }
}
