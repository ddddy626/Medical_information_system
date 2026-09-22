package com.dyh.doctor.domain;

import java.io.Serializable;
import java.util.*;
import lombok.Data;

@Data
public class PatientInfoEntity{
    private Integer patientId;// primary key 
    private String idCard;
    private String gender;
    private Integer age;
    private String address;
    private String history;
    private String createTime;
    private Integer userId;
    private String patientName;
    private String phone;
    private String marriage;
    private String allergy;
    private Double height;
    private Double weight;
    private Double bloodPressure;
    private Double bloodSugar;
}