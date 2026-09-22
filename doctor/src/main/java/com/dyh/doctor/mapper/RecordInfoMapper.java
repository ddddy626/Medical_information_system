package com.dyh.doctor.mapper;

import com.dyh.doctor.domain.RecordInfoEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.*;

public interface RecordInfoMapper{

    RecordInfoEntity queryById(Integer recordId);

    public List<RecordInfoEntity> queryAllByLimit(@Param("recordInfo") RecordInfoEntity recordInfo, @Param("pageable") Pageable pageable);

    long count(@Param("recordInfo") RecordInfoEntity recordInfo);

    int insert(RecordInfoEntity recordInfo);

    int update(RecordInfoEntity recordInfo);

    int deleteById(Integer recordId);

}