package com.dyh.doctor.domain;

import java.io.Serializable;
import java.util.*;
import lombok.Data;

@Data
public class RecordInfoEntity{
    private Integer recordId;// primary key 
    private String recordNo;
    private String recordTime;
    private String chiefComplaint;
    private String diagnosis;
    private String treatment;
    private String followUp;
    private String presNo;
    private String presDate;
    private String presUsage;
    private Integer medStatus;
    private Integer registerId;
    private Integer doctorId;
    private Integer patientId;

    // JOIN 关联字段
    private String patientName;
}