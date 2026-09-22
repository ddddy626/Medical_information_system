package com.dyh.doctor.service.serviceImpl;

import com.dyh.doctor.domain.CheckInfoEntity;
import com.dyh.doctor.mapper.CheckInfoMapper;
import com.dyh.doctor.service.CheckInfoService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import java.util.*;

@Service
public class CheckInfoServiceImpl implements CheckInfoService {
    private static int PAGE_DEFAULT = 1;
    private static int SIZE_DEFAULT = 10;

    @Resource
    private CheckInfoMapper checkInfoMapper;

    public CheckInfoEntity queryById(Integer checkId){
        return this.checkInfoMapper.queryById(checkId);
    }

    public Page<CheckInfoEntity> queryByPage(CheckInfoEntity checkInfo, Integer page, Integer size, String orderCol, String orderDirect){

        if(page == null || page <= 0){
            page = PAGE_DEFAULT;
        }
        if(size == null || size <= 0){
            size = SIZE_DEFAULT;
        }

        Sort sort = null;
        if(orderCol != null) {
            Sort.Order order = new Sort.Order(("DESC".equals(orderDirect) ? Sort.Direction.DESC : Sort.Direction.ASC), orderCol);
            sort = Sort.by(order);
        }

        PageRequest pageRequest = PageRequest.of(page - 1, size);
        if(sort != null){
            pageRequest = PageRequest.of(page - 1, size, sort);
        }

        long total = this.checkInfoMapper.count(checkInfo);

        return new PageImpl<>(this.checkInfoMapper.queryAllByLimit(checkInfo, pageRequest), pageRequest, total);
    }

    public boolean insert(CheckInfoEntity checkInfo){
        return this.checkInfoMapper.insert(checkInfo) > 0;
    }

    public boolean update(CheckInfoEntity checkInfo){
        return this.checkInfoMapper.update(checkInfo) > 0;
    }

    public boolean deleteById(Integer checkId){
        return this.checkInfoMapper.deleteById(checkId) > 0;
    }

}