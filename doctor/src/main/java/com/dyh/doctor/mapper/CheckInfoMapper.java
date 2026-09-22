package com.dyh.doctor.mapper;

import com.dyh.doctor.domain.CheckInfoEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.*;

public interface CheckInfoMapper{

    CheckInfoEntity queryById(Integer checkId);

    public List<CheckInfoEntity> queryAllByLimit(@Param("checkInfo") CheckInfoEntity checkInfo, @Param("pageable") Pageable pageable);

    long count(@Param("checkInfo") CheckInfoEntity checkInfo);

    int insert(CheckInfoEntity checkInfo);

    int update(CheckInfoEntity checkInfo);

    int deleteById(Integer checkId);

}