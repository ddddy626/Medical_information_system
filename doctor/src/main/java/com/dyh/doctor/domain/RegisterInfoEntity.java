package com.dyh.doctor.domain;

import java.io.Serializable;
import java.util.*;
import lombok.Data;

@Data
public class RegisterInfoEntity{
    private Integer registerId;// primary key
    private String regNo;
    private String regTime;
    private String visitTime;
    private Integer regStatus;
    private Double fee;
    private Integer patientId;
    private Integer deptId;
    private Integer doctorId;

    // JOIN 关联字段
    private String patientName;
    private String gender;
    private Integer age;
    private String phone;
    private String deptName;
}