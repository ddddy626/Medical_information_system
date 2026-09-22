package com.dyh.doctor.service.serviceImpl;

import com.dyh.doctor.domain.MessageInfoEntity;
import com.dyh.doctor.mapper.MessageInfoMapper;
import com.dyh.doctor.service.MessageInfoService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import java.util.*;

@Service
public class MessageInfoServiceImpl implements MessageInfoService {
    private static int PAGE_DEFAULT = 1;
    private static int SIZE_DEFAULT = 10;

    @Resource
    private MessageInfoMapper messageInfoMapper;

    public MessageInfoEntity queryById(Integer msgId){
        return this.messageInfoMapper.queryById(msgId);
    }

    public Page<MessageInfoEntity> queryByPage(MessageInfoEntity messageInfo, Integer page, Integer size, String orderCol, String orderDirect){

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

        long total = this.messageInfoMapper.count(messageInfo);

        return new PageImpl<>(this.messageInfoMapper.queryAllByLimit(messageInfo, pageRequest), pageRequest, total);
    }

    public boolean insert(MessageInfoEntity messageInfo){
        return this.messageInfoMapper.insert(messageInfo) > 0;
    }

    public boolean update(MessageInfoEntity messageInfo){
        return this.messageInfoMapper.update(messageInfo) > 0;
    }

    public boolean deleteById(Integer msgId){
        return this.messageInfoMapper.deleteById(msgId) > 0;
    }

}