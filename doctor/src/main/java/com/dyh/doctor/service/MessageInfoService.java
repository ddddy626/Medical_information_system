package com.dyh.doctor.service;

import com.dyh.doctor.domain.MessageInfoEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.*;

public interface MessageInfoService {
    MessageInfoEntity queryById(Integer msgId);

    Page<MessageInfoEntity> queryByPage(MessageInfoEntity messageInfo, Integer page, Integer size, String orderCol, String orderDirect);

    boolean insert(MessageInfoEntity messageInfo);

    boolean update(MessageInfoEntity messageInfo);

    boolean deleteById(Integer msgId);

}