package com.dyh.doctor.service;

import com.dyh.doctor.domain.RecordInfoEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.*;

public interface RecordInfoService {
    RecordInfoEntity queryById(Integer recordId);

    Page<RecordInfoEntity> queryByPage(RecordInfoEntity recordInfo, Integer page, Integer size, String orderCol, String orderDirect);

    boolean insert(RecordInfoEntity recordInfo);

    boolean update(RecordInfoEntity recordInfo);

    boolean deleteById(Integer recordId);

}