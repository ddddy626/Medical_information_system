package com.dyh.doctor.domain;

import java.io.Serializable;
import java.util.*;
import lombok.Data;

@Data
public class CheckInfoEntity{
    private Integer checkId;// primary key 
    private String checkName;
    private String checkTime;
    private String result;
    private Integer checkStatus;
    private Double checkFee;
    private Integer recordId;
}