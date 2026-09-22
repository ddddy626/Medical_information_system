package com.dyh.doctor.service.serviceImpl;

import com.dyh.doctor.domain.ConsultInfoEntity;
import com.dyh.doctor.mapper.ConsultInfoMapper;
import com.dyh.doctor.service.ConsultInfoService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import java.util.*;

@Service
public class ConsultInfoServiceImpl implements ConsultInfoService {
    private static int PAGE_DEFAULT = 1;
    private static int SIZE_DEFAULT = 10;

    @Resource
    private ConsultInfoMapper consultInfoMapper;

    public ConsultInfoEntity queryById(Integer consultId){
        return this.consultInfoMapper.queryById(consultId);
    }

    public Page<ConsultInfoEntity> queryByPage(ConsultInfoEntity consultInfo, Integer page, Integer size, String orderCol, String orderDirect){

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

        long total = this.consultInfoMapper.count(consultInfo);

        return new PageImpl<>(this.consultInfoMapper.queryAllByLimit(consultInfo, pageRequest), pageRequest, total);
    }

    public boolean insert(ConsultInfoEntity consultInfo){
        return this.consultInfoMapper.insert(consultInfo) > 0;
    }

    public boolean update(ConsultInfoEntity consultInfo){
        return this.consultInfoMapper.update(consultInfo) > 0;
    }

    public boolean deleteById(Integer consultId){
        return this.consultInfoMapper.deleteById(consultId) > 0;
    }

}