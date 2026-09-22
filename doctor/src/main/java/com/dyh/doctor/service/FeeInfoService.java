package com.dyh.doctor.service;

import com.dyh.doctor.domain.FeeInfoEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.*;

public interface FeeInfoService {
    FeeInfoEntity queryById(Integer feeId);

    Page<FeeInfoEntity> queryByPage(FeeInfoEntity feeInfo, Integer page, Integer size, String orderCol, String orderDirect);

    boolean insert(FeeInfoEntity feeInfo);

    boolean update(FeeInfoEntity feeInfo);

    boolean deleteById(Integer feeId);

boolean updatePayStatus(Integer feeId, Integer payStatus);

    /** 扫码支付：指定订单或该患者全部待缴费订单 pay_status 0→1 */
    int scanPayComplete(Integer feeId, Integer patientId, String payMethod, String payTime);

}