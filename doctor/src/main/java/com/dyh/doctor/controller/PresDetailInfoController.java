package com.dyh.doctor.controller;

import com.dyh.doctor.domain.PresDetailInfoEntity;
import com.dyh.doctor.service.PresDetailInfoService;
import com.dyh.doctor.util.ReturnVO;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import org.springframework.data.domain.Page;

@RestController
@RequestMapping("presDetailInfo")
public class PresDetailInfoController {
    @Resource
    private PresDetailInfoService presDetailInfoService;

    @RequestMapping("queryById/{id}")
    public ReturnVO queryById(@PathVariable("id") Integer id) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        PresDetailInfoEntity presDetailInfo = this.presDetailInfoService.queryById(id);
        if(presDetailInfo == null) return returnVO;
        returnVO = ReturnVO.getSuccessDataReturnVO(presDetailInfo);
        return returnVO;
    }

    @RequestMapping("queryByPage")
    public ReturnVO queryByPage(PresDetailInfoEntity presDetailInfo, Integer page, Integer size, String orderCol, String orderDirect) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        Page<PresDetailInfoEntity> pageVO = this.presDetailInfoService.queryByPage(presDetailInfo, page, size, orderCol, orderDirect);
        if(pageVO.getContent().isEmpty()) return returnVO;
        returnVO = ReturnVO.getSuccessDataReturnVO(pageVO);
        return returnVO;
    }

    @RequestMapping("add")
    public ReturnVO add(@RequestBody PresDetailInfoEntity presDetailInfo) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        if(!this.presDetailInfoService.insert(presDetailInfo)) return returnVO;
        returnVO.setCode(1);
        returnVO.setMsg("添加成功");
        return returnVO;
    }

    @RequestMapping("edit")
    public ReturnVO edit(@RequestBody PresDetailInfoEntity presDetailInfo) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        if(!this.presDetailInfoService.update(presDetailInfo)) return returnVO;
        returnVO.setCode(1);
        returnVO.setMsg("更新成功");
        return returnVO;
    }

    @RequestMapping("deleteById/{id}")
    public ReturnVO deleteById(@PathVariable("id") Integer id) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        if(!this.presDetailInfoService.deleteById(id)) return returnVO;
        returnVO.setCode(1);
        returnVO.setMsg("删除成功");
        return returnVO;
    }
}