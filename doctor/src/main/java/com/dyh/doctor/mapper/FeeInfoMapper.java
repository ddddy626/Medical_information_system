package com.dyh.doctor.mapper;

import com.dyh.doctor.domain.FeeInfoEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.*;

public interface FeeInfoMapper{

    FeeInfoEntity queryById(Integer feeId);

    public List<FeeInfoEntity> queryAllByLimit(@Param("feeInfo") FeeInfoEntity feeInfo, @Param("pageable") Pageable pageable);

    long count(@Param("feeInfo") FeeInfoEntity feeInfo);

    int insert(FeeInfoEntity feeInfo);

    int update(FeeInfoEntity feeInfo);

    int deleteById(Integer feeId);

int updatePayStatus(@Param("feeId") Integer feeId, @Param("payStatus") Integer payStatus);

    int updatePendingByPatient(@Param("patientId") Integer patientId, @Param("payMethod") String payMethod, @Param("payTime") String payTime);

}