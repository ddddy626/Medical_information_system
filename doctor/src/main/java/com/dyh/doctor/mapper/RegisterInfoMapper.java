package com.dyh.doctor.mapper;

import com.dyh.doctor.domain.RegisterInfoEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.*;

public interface RegisterInfoMapper{

    RegisterInfoEntity queryById(Integer registerId);

    public List<RegisterInfoEntity> queryAllByLimit(@Param("registerInfo") RegisterInfoEntity registerInfo, @Param("pageable") Pageable pageable);

    long count(@Param("registerInfo") RegisterInfoEntity registerInfo);

    int insert(RegisterInfoEntity registerInfo);

    int update(RegisterInfoEntity registerInfo);

    int deleteById(Integer registerId);

}