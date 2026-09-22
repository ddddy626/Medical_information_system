package com.dyh.doctor.service;

import com.dyh.doctor.domain.PresDetailInfoEntity;
import org.springframework.data.domain.Page;

public interface PresDetailInfoService {
    PresDetailInfoEntity queryById(Integer detailId);

    Page<PresDetailInfoEntity> queryByPage(PresDetailInfoEntity presDetailInfo, Integer page, Integer size, String orderCol, String orderDirect);

    boolean insert(PresDetailInfoEntity presDetailInfo);

    boolean update(PresDetailInfoEntity presDetailInfo);

    boolean deleteById(Integer detailId);
}