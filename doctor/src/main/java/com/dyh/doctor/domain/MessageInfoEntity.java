package com.dyh.doctor.domain;

import java.io.Serializable;
import java.util.*;
import lombok.Data;

@Data
public class MessageInfoEntity{
    private Integer msgId;// primary key 
    private String msgContent;
    private String msgTime;
    private Integer senderId;
    private Integer receiverId;
    private String replyContent;
    private Integer msgType;
}