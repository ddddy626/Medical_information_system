package com.dyh.doctor.mapper;

import com.dyh.doctor.domain.ConsultInfoEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.*;

public interface ConsultInfoMapper{

    ConsultInfoEntity queryById(Integer consultId);

    public List<ConsultInfoEntity> queryAllByLimit(@Param("consultInfo") ConsultInfoEntity consultInfo, @Param("pageable") Pageable pageable);

    long count(@Param("consultInfo") ConsultInfoEntity consultInfo);

    int insert(ConsultInfoEntity consultInfo);

    int update(ConsultInfoEntity consultInfo);

    int deleteById(Integer consultId);

}