package com.dyh.doctor.service;

import com.dyh.doctor.domain.DeptInfoEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.*;

public interface DeptInfoService {
    DeptInfoEntity queryById(Integer deptId);

    Page<DeptInfoEntity> queryByPage(DeptInfoEntity deptInfo, Integer page, Integer size, String orderCol, String orderDirect);

    boolean insert(DeptInfoEntity deptInfo);

    boolean update(DeptInfoEntity deptInfo);

    boolean deleteById(Integer deptId);

}