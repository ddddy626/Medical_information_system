package com.dyh.doctor.controller;

import com.dyh.doctor.domain.DeptInfoEntity;
import com.dyh.doctor.service.DeptInfoService;
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
@RequestMapping("deptInfo")
public class DeptInfoController {
    @Resource
    private DeptInfoService deptInfoService;

    @RequestMapping("queryById/{id}")
    public ReturnVO queryById(@PathVariable("id") Integer id) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        DeptInfoEntity deptInfo = this.deptInfoService.queryById(id);

        if(deptInfo == null) {
            return returnVO;
        }

        returnVO = ReturnVO.getSuccessDataReturnVO(deptInfo);

        return returnVO;
    }

    @RequestMapping("queryByPage")
    public ReturnVO queryByPage(DeptInfoEntity deptInfo, Integer page, Integer size, String orderCol, String orderDirect) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        Page<DeptInfoEntity> pageVO = 
            this.deptInfoService.queryByPage(
                deptInfo, 
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
    public ReturnVO add(@RequestBody DeptInfoEntity deptInfo) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        //入库
        if(!this.deptInfoService.insert(deptInfo)){
            //入库失败
            return returnVO;
        }

        //入库成功
        returnVO.setCode(1);
        returnVO.setMsg("添加成功");

        return returnVO;
    }

    @RequestMapping("edit")
    public ReturnVO edit(@RequestBody DeptInfoEntity deptInfo) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        //修改
        if(!this.deptInfoService.update(deptInfo)){
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
        if(!this.deptInfoService.deleteById(id)){
            //删除失败
            return returnVO;
        }

        returnVO.setCode(1);
        returnVO.setMsg("删除成功");

        return returnVO;
    }

}