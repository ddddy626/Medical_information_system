package com.dyh.doctor.domain;

import java.io.Serializable;
import java.util.*;
import lombok.Data;

@Data
public class DoctorInfoEntity{
    private Integer doctorId;// primary key 
    private String doctorName;
    private String title;
    private String specialty;
    private String workTime;
    private Integer docStatus;
    private Integer userId;
    private Integer deptId;
}