package com.dyh.doctor.domain;

import java.io.Serializable;
import java.util.*;
import lombok.Data;

@Data
public class FeeInfoEntity{
    private Integer feeId;
    private String feeType;
    private Double amount;
    private String payTime;
    private Integer payStatus;
    private String payMethod;
    private Integer recordId;
    private Integer patientId;
    private Integer doctorId;

    // JOIN 关联字段
    private String patientName;
    private String recordNo;
    private String doctorName;
}