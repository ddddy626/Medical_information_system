package com.dyh.doctor.service;

import com.dyh.doctor.domain.PatientInfoEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.*;

public interface PatientInfoService {
    PatientInfoEntity queryById(Integer patientId);

    Page<PatientInfoEntity> queryByPage(PatientInfoEntity patientInfo, Integer page, Integer size, String orderCol, String orderDirect);

    boolean insert(PatientInfoEntity patientInfo);

    boolean update(PatientInfoEntity patientInfo);

    boolean deleteById(Integer patientId);

}