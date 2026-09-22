package com.dyh.doctor.domain;

import java.io.Serializable;
import java.util.*;
import lombok.Data;

@Data
public class ConsultInfoEntity{
    private Integer consultId;// primary key
    private String content;
    private String reply;
    private String consultTime;
    private String replyTime;
    private Integer consultStatus;
    private Integer patientId;
    private Integer doctorId;
    private Integer consultType;
    private Integer senderRole; // 0=患者发送，1=医生发送
}