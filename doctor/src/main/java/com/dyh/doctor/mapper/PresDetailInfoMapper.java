package com.dyh.doctor.mapper;

import com.dyh.doctor.domain.PresDetailInfoEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.*;

public interface PresDetailInfoMapper{

    PresDetailInfoEntity queryById(Integer detailId);

    public List<PresDetailInfoEntity> queryAllByLimit(@Param("presDetailInfo") PresDetailInfoEntity presDetailInfo, @Param("pageable") Pageable pageable);

    long count(@Param("presDetailInfo") PresDetailInfoEntity presDetailInfo);

    int insert(PresDetailInfoEntity presDetailInfo);

    int update(PresDetailInfoEntity presDetailInfo);

    int deleteById(Integer detailId);

}