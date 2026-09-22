package com.dyh.doctor.service;

import com.dyh.doctor.domain.RegisterInfoEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.*;

public interface RegisterInfoService {
    RegisterInfoEntity queryById(Integer registerId);

    Page<RegisterInfoEntity> queryByPage(RegisterInfoEntity registerInfo, Integer page, Integer size, String orderCol, String orderDirect);

    /** 统计某医生某日（visit_time 前缀 yyyy-MM-dd）已挂号数量 */
    long countByDoctorAndDate(Integer doctorId, String date);

    /** 每日号源上限 */
    int getDailyLimit();

    boolean insert(RegisterInfoEntity registerInfo);

    boolean update(RegisterInfoEntity registerInfo);

    boolean deleteById(Integer registerId);

}