package com.dyh.doctor.mapper;

import com.dyh.doctor.domain.PatientInfoEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.*;

public interface PatientInfoMapper{

    PatientInfoEntity queryById(Integer patientId);

    public List<PatientInfoEntity> queryAllByLimit(@Param("patientInfo") PatientInfoEntity patientInfo, @Param("pageable") Pageable pageable);

    long count(@Param("patientInfo") PatientInfoEntity patientInfo);

    int insert(PatientInfoEntity patientInfo);

    int update(PatientInfoEntity patientInfo);

    int deleteById(Integer patientId);

}