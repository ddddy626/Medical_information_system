package com.dyh.doctor.controller;

import com.dyh.doctor.domain.FeeInfoEntity;
import com.dyh.doctor.service.FeeInfoService;
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
@RequestMapping("feeInfo")
public class FeeInfoController {
    @Resource
    private FeeInfoService feeInfoService;

    @RequestMapping("queryById/{id}")
    public ReturnVO queryById(@PathVariable("id") Integer id) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        FeeInfoEntity feeInfo = this.feeInfoService.queryById(id);

        if(feeInfo == null) {
            return returnVO;
        }

        returnVO = ReturnVO.getSuccessDataReturnVO(feeInfo);

        return returnVO;
    }

    @RequestMapping("queryByPage")
    public ReturnVO queryByPage(FeeInfoEntity feeInfo, Integer page, Integer size, String orderCol, String orderDirect) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        Page<FeeInfoEntity> pageVO = 
            this.feeInfoService.queryByPage(
                feeInfo, 
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
    public ReturnVO add(@RequestBody FeeInfoEntity feeInfo) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        //入库
        if(!this.feeInfoService.insert(feeInfo)){
            //入库失败
            return returnVO;
        }

        //入库成功
        returnVO.setCode(1);
        returnVO.setMsg("添加成功");

        return returnVO;
    }

    @RequestMapping("edit")
    public ReturnVO edit(@RequestBody FeeInfoEntity feeInfo) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        //修改
        if(!this.feeInfoService.update(feeInfo)){
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
        if(!this.feeInfoService.deleteById(id)){
            //删除失败
            return returnVO;
        }

        returnVO.setCode(1);
        returnVO.setMsg("删除成功");

        return returnVO;
    }

    @RequestMapping("updatePayStatus")
    public ReturnVO updatePayStatus(@RequestBody Map<String, Integer> params) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        Integer feeId = params.get("feeId");
        Integer payStatus = params.get("payStatus");
        
        if(feeId == null || payStatus == null){
            return returnVO;
        }

        if(!this.feeInfoService.updatePayStatus(feeId, payStatus)){
            return returnVO;
        }

        returnVO.setCode(1);
        returnVO.setMsg("支付状态更新成功");

        return returnVO;
    }

    /** 扫码打开 patient-payment.html 后调用，将 pay_status 从 0 改为 1 */
    @RequestMapping("scanPay")
    public ReturnVO scanPay(@RequestBody Map<String, Object> params) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        Integer feeId = null;
        Integer patientId = null;
        if (params.get("feeId") != null && !"".equals(String.valueOf(params.get("feeId")))) {
            feeId = Integer.valueOf(String.valueOf(params.get("feeId")));
        }
        if (params.get("patientId") != null && !"".equals(String.valueOf(params.get("patientId")))) {
            patientId = Integer.valueOf(String.valueOf(params.get("patientId")));
        }
        String payMethod = params.get("payMethod") != null ? String.valueOf(params.get("payMethod")) : "扫码支付";
        String payTime = params.get("payTime") != null ? String.valueOf(params.get("payTime")) : new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        if (feeId == null && patientId == null) {
            returnVO.setMsg("缺少 feeId 或 patientId");
            return returnVO;
        }

        int updated = this.feeInfoService.scanPayComplete(feeId, patientId, payMethod, payTime);
        if (updated <= 0) {
            returnVO.setMsg(feeId != null ? "订单不存在或已支付" : "暂无待缴费订单");
            return returnVO;
        }

        returnVO.setCode(1);
        returnVO.setMsg("支付成功，已更新 " + updated + " 条记录");
        return returnVO;
    }

}