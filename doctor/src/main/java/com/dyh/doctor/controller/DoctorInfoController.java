package com.dyh.doctor.controller;

import com.dyh.doctor.domain.DoctorInfoEntity;
import com.dyh.doctor.service.DoctorInfoService;
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
@RequestMapping("doctorInfo")
public class DoctorInfoController {
    @Resource
    private DoctorInfoService doctorInfoService;

    @RequestMapping("queryById/{id}")
    public ReturnVO queryById(@PathVariable("id") Integer id) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        DoctorInfoEntity doctorInfo = this.doctorInfoService.queryById(id);

        if(doctorInfo == null) {
            return returnVO;
        }

        returnVO = ReturnVO.getSuccessDataReturnVO(doctorInfo);

        return returnVO;
    }

    @RequestMapping("queryByPage")
    public ReturnVO queryByPage(DoctorInfoEntity doctorInfo, Integer page, Integer size, String orderCol, String orderDirect, @RequestParam(value = "dept_id", required = false) Integer deptId) {

        if (deptId != null) {
            doctorInfo.setDeptId(deptId);
        }

        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        Page<DoctorInfoEntity> pageVO = 
            this.doctorInfoService.queryByPage(
                doctorInfo, 
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
    public ReturnVO add(@RequestBody DoctorInfoEntity doctorInfo) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        //入库
        if(!this.doctorInfoService.insert(doctorInfo)){
            //入库失败
            return returnVO;
        }

        //入库成功
        returnVO.setCode(1);
        returnVO.setMsg("添加成功");

        return returnVO;
    }

    @RequestMapping("edit")
    public ReturnVO edit(@RequestBody DoctorInfoEntity doctorInfo) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        //修改
        if(!this.doctorInfoService.update(doctorInfo)){
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
        if(!this.doctorInfoService.deleteById(id)){
            //删除失败
            return returnVO;
        }

        returnVO.setCode(1);
        returnVO.setMsg("删除成功");

        return returnVO;
    }

}