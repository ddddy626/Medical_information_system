package com.dyh.doctor.service.serviceImpl;

import com.dyh.doctor.domain.RecordInfoEntity;
import com.dyh.doctor.mapper.RecordInfoMapper;
import com.dyh.doctor.service.RecordInfoService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import java.util.*;

@Service
public class RecordInfoServiceImpl implements RecordInfoService {
    private static int PAGE_DEFAULT = 1;
    private static int SIZE_DEFAULT = 10;

    @Resource
    private RecordInfoMapper recordInfoMapper;

    public RecordInfoEntity queryById(Integer recordId){
        return this.recordInfoMapper.queryById(recordId);
    }

    public Page<RecordInfoEntity> queryByPage(RecordInfoEntity recordInfo, Integer page, Integer size, String orderCol, String orderDirect){

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

        long total = this.recordInfoMapper.count(recordInfo);

        return new PageImpl<>(this.recordInfoMapper.queryAllByLimit(recordInfo, pageRequest), pageRequest, total);
    }

    public boolean insert(RecordInfoEntity recordInfo){
        return this.recordInfoMapper.insert(recordInfo) > 0;
    }

    public boolean update(RecordInfoEntity recordInfo){
        return this.recordInfoMapper.update(recordInfo) > 0;
    }

    public boolean deleteById(Integer recordId){
        return this.recordInfoMapper.deleteById(recordId) > 0;
    }

}