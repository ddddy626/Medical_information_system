package com.dyh.doctor.mapper;

import com.dyh.doctor.domain.DeptInfoEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.*;

public interface DeptInfoMapper{

    DeptInfoEntity queryById(Integer deptId);

    public List<DeptInfoEntity> queryAllByLimit(@Param("deptInfo") DeptInfoEntity deptInfo, @Param("pageable") Pageable pageable);

    long count(@Param("deptInfo") DeptInfoEntity deptInfo);

    int insert(DeptInfoEntity deptInfo);

    int update(DeptInfoEntity deptInfo);

    int deleteById(Integer deptId);

}