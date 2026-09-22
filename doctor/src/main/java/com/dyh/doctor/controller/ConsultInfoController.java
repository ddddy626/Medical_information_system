package com.dyh.doctor.controller;

import com.dyh.doctor.domain.ConsultInfoEntity;
import com.dyh.doctor.service.ConsultInfoService;
import com.dyh.doctor.util.*;

import javax.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import java.util.*;

@RestController
@RequestMapping("consultInfo")
public class ConsultInfoController {
    @Resource
    private ConsultInfoService consultInfoService;

    @RequestMapping("queryById/{id}")
    public ReturnVO queryById(@PathVariable("id") Integer id) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        ConsultInfoEntity consultInfo = this.consultInfoService.queryById(id);

        if(consultInfo == null) {
            return returnVO;
        }

        returnVO = ReturnVO.getSuccessDataReturnVO(consultInfo);

        return returnVO;
    }

    @RequestMapping("queryByPage")
    public ReturnVO queryByPage(ConsultInfoEntity consultInfo, Integer page, Integer size, String orderCol, String orderDirect) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        Page<ConsultInfoEntity> pageVO = 
            this.consultInfoService.queryByPage(
                consultInfo, 
                page, size,
                orderCol, orderDirect);

        //没有数据
        if(pageVO.getContent().isEmpty()){
            return returnVO;
        }

        //查询成功
        returnVO = ReturnVO.getSuccessDataReturnVO(pageVO);

        return returnVO;
    }

    @RequestMapping("add")
    public ReturnVO add(@RequestBody ConsultInfoEntity consultInfo) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        //入库
        if(!this.consultInfoService.insert(consultInfo)){
            //入库失败
            return returnVO;
        }

        //入库成功
        returnVO.setCode(1);
        returnVO.setMsg("添加成功");

        return returnVO;
    }

    @RequestMapping("edit")
    public ReturnVO edit(@RequestBody ConsultInfoEntity consultInfo) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        //修改
        if(!this.consultInfoService.update(consultInfo)){
            //修改失败
            return returnVO;
        }

        //修改成功
        returnVO.setCode(1);
        returnVO.setMsg("修改成功");

        return returnVO;
    }

    @RequestMapping("reply")
    public ReturnVO reply(@RequestBody ConsultInfoEntity consultInfo) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        if (consultInfo.getConsultId() == null || consultInfo.getReply() == null || consultInfo.getReply().trim().isEmpty()) {
            returnVO.setMsg("参数不完整");
            return returnVO;
        }

        ConsultInfoEntity existing = this.consultInfoService.queryById(consultInfo.getConsultId());
        if (existing == null) {
            returnVO.setMsg("咨询记录不存在");
            return returnVO;
        }

        existing.setReply(consultInfo.getReply().trim());
        existing.setReplyTime(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));
        existing.setConsultStatus(1);
        if (consultInfo.getDoctorId() != null) {
            existing.setDoctorId(consultInfo.getDoctorId());
        }

        if (this.consultInfoService.update(existing)) {
            returnVO.setCode(1);
            returnVO.setMsg("回复成功");
        } else {
            returnVO.setMsg("回复失败");
        }

        return returnVO;
    }

    @RequestMapping("queryByPatientId")
    public ReturnVO queryByPatientId(@RequestParam Integer patientId) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        ConsultInfoEntity queryCondition = new ConsultInfoEntity();
        queryCondition.setPatientId(patientId);
        Page<ConsultInfoEntity> pageVO = this.consultInfoService.queryByPage(queryCondition, 1, 50, null, null);

        if (!pageVO.getContent().isEmpty()) {
            returnVO = ReturnVO.getSuccessDataReturnVO(pageVO.getContent());
        }

        return returnVO;
    }

    @RequestMapping("queryByDoctorId")
    public ReturnVO queryByDoctorId(@RequestParam Integer doctorId) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        ConsultInfoEntity queryCondition = new ConsultInfoEntity();
        queryCondition.setDoctorId(doctorId);
        Page<ConsultInfoEntity> pageVO = this.consultInfoService.queryByPage(queryCondition, 1, 50, null, null);

        if (!pageVO.getContent().isEmpty()) {
            returnVO = ReturnVO.getSuccessDataReturnVO(pageVO.getContent());
        }

        return returnVO;
    }

    @RequestMapping("queryChatMessages")
    public ReturnVO queryChatMessages(@RequestParam Integer patientId, @RequestParam Integer doctorId) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        ConsultInfoEntity queryCondition = new ConsultInfoEntity();
        queryCondition.setPatientId(patientId);
        queryCondition.setDoctorId(doctorId);
        Page<ConsultInfoEntity> pageVO = this.consultInfoService.queryByPage(queryCondition, 1, 200, null, null);

        if (!pageVO.getContent().isEmpty()) {
            returnVO = ReturnVO.getSuccessDataReturnVO(pageVO.getContent());
        }

        return returnVO;
    }

    /**
     * 患者结束与医生的人工会话：将该医患间进行中的咨询标记为已结束，
     * 下次进入咨询页默认回到 AI 模式。
     */
    @RequestMapping("closeChat")
    public ReturnVO closeChat(@RequestBody Map<String, Integer> body) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        Integer patientId = body == null ? null : body.get("patientId");
        Integer doctorId = body == null ? null : body.get("doctorId");
        if (patientId == null || doctorId == null) {
            returnVO.setMsg("参数不完整");
            return returnVO;
        }

        ConsultInfoEntity queryCondition = new ConsultInfoEntity();
        queryCondition.setPatientId(patientId);
        queryCondition.setDoctorId(doctorId);
        Page<ConsultInfoEntity> pageVO = this.consultInfoService.queryByPage(queryCondition, 1, 500, null, null);
        int closed = 0;
        for (ConsultInfoEntity row : pageVO.getContent()) {
            if (row.getConsultType() != null && row.getConsultType() == 1
                    && (row.getConsultStatus() == null || row.getConsultStatus() == 0)) {
                ConsultInfoEntity patch = new ConsultInfoEntity();
                patch.setConsultId(row.getConsultId());
                patch.setConsultStatus(1);
                if (this.consultInfoService.update(patch)) {
                    closed++;
                }
            }
        }

        returnVO.setCode(1);
        returnVO.setMsg("会话已结束");
        returnVO.setContent(closed);
        return returnVO;
    }

    @RequestMapping("deleteById/{id}")
    public ReturnVO deleteById(@PathVariable("id") Integer id) {        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        if(!this.consultInfoService.deleteById(id)){
            //删除失败
            return returnVO;
        }

        returnVO.setCode(1);
        returnVO.setMsg("删除成功");

        return returnVO;
    }

}