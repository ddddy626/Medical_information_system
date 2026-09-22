package com.dyh.doctor.controller;

import com.dyh.doctor.domain.PatientInfoEntity;
import com.dyh.doctor.service.PatientInfoService;
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
@RequestMapping("patientInfo")
public class PatientInfoController {
    @Resource
    private PatientInfoService patientInfoService;

    @RequestMapping("queryById/{id}")
    public ReturnVO queryById(@PathVariable("id") Integer id) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        PatientInfoEntity patientInfo = this.patientInfoService.queryById(id);

        if(patientInfo == null) {
            return returnVO;
        }

        returnVO = ReturnVO.getSuccessDataReturnVO(patientInfo);

        return returnVO;
    }

    @RequestMapping("queryByUserId")
    public ReturnVO queryByUserId(@RequestParam Integer userId) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        PatientInfoEntity queryCondition = new PatientInfoEntity();
        queryCondition.setUserId(userId);
        Page<PatientInfoEntity> pageVO = this.patientInfoService.queryByPage(queryCondition, 1, 1, null, null);

        if (!pageVO.getContent().isEmpty()) {
            returnVO = ReturnVO.getSuccessDataReturnVO(pageVO.getContent().get(0));
        }

        return returnVO;
    }

    @RequestMapping("queryByPage")
    public ReturnVO queryByPage(PatientInfoEntity patientInfo, Integer page, Integer size, String orderCol, String orderDirect) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        Page<PatientInfoEntity> pageVO = 
            this.patientInfoService.queryByPage(
                patientInfo, 
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
    public ReturnVO add(@RequestBody PatientInfoEntity patientInfo) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        if (patientInfo.getUserId() == null) {
            returnVO.setMsg("用户ID不能为空");
            return returnVO;
        }

        PatientInfoEntity queryCondition = new PatientInfoEntity();
        queryCondition.setUserId(patientInfo.getUserId());
        Page<PatientInfoEntity> existingPage = this.patientInfoService.queryByPage(queryCondition, 1, 1, null, null);

        if (!existingPage.getContent().isEmpty()) {
            PatientInfoEntity existing = existingPage.getContent().get(0);
            patientInfo.setPatientId(existing.getPatientId());
            if (this.patientInfoService.update(patientInfo)) {
                returnVO.setCode(1);
                returnVO.setMsg("更新成功");
            } else {
                returnVO.setMsg("更新失败");
            }
        } else {
            if (this.patientInfoService.insert(patientInfo)) {
                returnVO.setCode(1);
                returnVO.setMsg("添加成功");
            } else {
                returnVO.setMsg("添加失败");
            }
        }

        return returnVO;
    }

    @RequestMapping("edit")
    public ReturnVO edit(@RequestBody PatientInfoEntity patientInfo) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        //修改
        if(!this.patientInfoService.update(patientInfo)){
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
        if(!this.patientInfoService.deleteById(id)){
            //删除失败
            return returnVO;
        }

        returnVO.setCode(1);
        returnVO.setMsg("删除成功");

        return returnVO;
    }

}