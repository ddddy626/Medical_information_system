package com.dyh.doctor.domain;

import java.io.Serializable;
import java.util.*;
import lombok.Data;

@Data
public class DeptInfoEntity{
    private Integer deptId;// primary key 
    private String deptName;
    private String deptDesc;
    private String location;
    private String deptPhone;
}