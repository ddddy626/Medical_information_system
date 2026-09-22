package com.dyh.doctor.mapper;

import com.dyh.doctor.domain.DoctorInfoEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.*;

public interface DoctorInfoMapper{

    DoctorInfoEntity queryById(Integer doctorId);

    public List<DoctorInfoEntity> queryAllByLimit(@Param("doctorInfo") DoctorInfoEntity doctorInfo, @Param("pageable") Pageable pageable);

    long count(@Param("doctorInfo") DoctorInfoEntity doctorInfo);

    int insert(DoctorInfoEntity doctorInfo);

    int update(DoctorInfoEntity doctorInfo);

    int deleteById(Integer doctorId);

}