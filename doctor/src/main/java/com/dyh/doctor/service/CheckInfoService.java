package com.dyh.doctor.service;

import com.dyh.doctor.domain.CheckInfoEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.*;

public interface CheckInfoService {
    CheckInfoEntity queryById(Integer checkId);

    Page<CheckInfoEntity> queryByPage(CheckInfoEntity checkInfo, Integer page, Integer size, String orderCol, String orderDirect);

    boolean insert(CheckInfoEntity checkInfo);

    boolean update(CheckInfoEntity checkInfo);

    boolean deleteById(Integer checkId);

}