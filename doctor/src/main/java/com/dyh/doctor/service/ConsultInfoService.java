package com.dyh.doctor.service;

import com.dyh.doctor.domain.ConsultInfoEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.*;

public interface ConsultInfoService {
    ConsultInfoEntity queryById(Integer consultId);

    Page<ConsultInfoEntity> queryByPage(ConsultInfoEntity consultInfo, Integer page, Integer size, String orderCol, String orderDirect);

    boolean insert(ConsultInfoEntity consultInfo);

    boolean update(ConsultInfoEntity consultInfo);

    boolean deleteById(Integer consultId);

}