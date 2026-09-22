package com.dyh.doctor.controller;

import com.dyh.doctor.domain.RecordInfoEntity;
import com.dyh.doctor.service.RecordInfoService;
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
@RequestMapping("recordInfo")
public class RecordInfoController {
    @Resource
    private RecordInfoService recordInfoService;

    @RequestMapping("queryById/{id}")
    public ReturnVO queryById(@PathVariable("id") Integer id) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        RecordInfoEntity recordInfo = this.recordInfoService.queryById(id);

        if(recordInfo == null) {
            return returnVO;
        }

        returnVO = ReturnVO.getSuccessDataReturnVO(recordInfo);

        return returnVO;
    }

    @RequestMapping("queryByPage")
    public ReturnVO queryByPage(RecordInfoEntity recordInfo, Integer page, Integer size, String orderCol, String orderDirect) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        Page<RecordInfoEntity> pageVO = 
            this.recordInfoService.queryByPage(
                recordInfo, 
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
    public ReturnVO add(@RequestBody RecordInfoEntity recordInfo) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        if (recordInfo == null || recordInfo.getPatientId() == null) {
            returnVO.setMsg("缺少患者信息，无法保存病历");
            return returnVO;
        }
        // 表字段 register_id / doctor_id 为 NOT NULL；OCR 自助上传无挂号时用 0
        if (recordInfo.getRegisterId() == null) {
            recordInfo.setRegisterId(0);
        }
        if (recordInfo.getDoctorId() == null) {
            recordInfo.setDoctorId(0);
        }
        if (recordInfo.getMedStatus() == null) {
            recordInfo.setMedStatus(0);
        }
        if (recordInfo.getRecordNo() == null || recordInfo.getRecordNo().trim().isEmpty()) {
            recordInfo.setRecordNo("IMG-" + System.currentTimeMillis());
        }

        try {
            if (!this.recordInfoService.insert(recordInfo)) {
                returnVO.setMsg("病历写入失败，请检查患者信息后重试");
                return returnVO;
            }
        } catch (Exception e) {
            String msg = e.getMessage() == null ? "保存失败" : e.getMessage();
            if (msg.contains("register_id")) {
                returnVO.setMsg("挂号编号不能为空");
            } else if (msg.contains("doctor_id")) {
                returnVO.setMsg("医生编号不能为空");
            } else if (msg.contains("Duplicate") || msg.contains("duplicate")) {
                returnVO.setMsg("病历编号重复，请刷新后重试");
            } else {
                returnVO.setMsg("保存失败：" + msg);
            }
            return returnVO;
        }

        //入库成功
        returnVO.setCode(1);
        returnVO.setMsg("添加成功");
        returnVO.setContent(recordInfo.getRecordId());

        return returnVO;
    }

    @RequestMapping("edit")
    public ReturnVO edit(@RequestBody RecordInfoEntity recordInfo) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        //修改
        if(!this.recordInfoService.update(recordInfo)){
            //修改失败
            return returnVO;
        }

        //修改成功
        returnVO.setCode(1);
        returnVO.setMsg("修改成功");

        return returnVO;
    }

    @RequestMapping("deleteById/{id}")
    public ReturnVO deleteById(@PathVariable("id") Integer id) {        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        if(!this.recordInfoService.deleteById(id)){
            //删除失败
            return returnVO;
        }

        returnVO.setCode(1);
        returnVO.setMsg("删除成功");

        return returnVO;
    }

}