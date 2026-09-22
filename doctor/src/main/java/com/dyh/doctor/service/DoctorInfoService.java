package com.dyh.doctor.service;

import com.dyh.doctor.domain.DoctorInfoEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.*;

public interface DoctorInfoService {
    DoctorInfoEntity queryById(Integer doctorId);

    Page<DoctorInfoEntity> queryByPage(DoctorInfoEntity doctorInfo, Integer page, Integer size, String orderCol, String orderDirect);

    boolean insert(DoctorInfoEntity doctorInfo);

    boolean update(DoctorInfoEntity doctorInfo);

    boolean deleteById(Integer doctorId);

}