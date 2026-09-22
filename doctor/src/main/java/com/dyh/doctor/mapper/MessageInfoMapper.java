package com.dyh.doctor.mapper;

import com.dyh.doctor.domain.MessageInfoEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.*;

public interface MessageInfoMapper{

    MessageInfoEntity queryById(Integer msgId);

    public List<MessageInfoEntity> queryAllByLimit(@Param("messageInfo") MessageInfoEntity messageInfo, @Param("pageable") Pageable pageable);

    long count(@Param("messageInfo") MessageInfoEntity messageInfo);

    int insert(MessageInfoEntity messageInfo);

    int update(MessageInfoEntity messageInfo);

    int deleteById(Integer msgId);

}