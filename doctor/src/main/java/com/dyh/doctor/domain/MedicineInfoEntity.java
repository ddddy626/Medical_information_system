package com.dyh.doctor.domain;

import java.io.Serializable;
import java.util.*;
import lombok.Data;

@Data
public class MedicineInfoEntity{
    private Integer id;
    private String medName;
    private String medType;
    private Double price;
    private Integer stock;
    private String spec;
    private String producer;
    private Integer status;
    private String medInsuranceType;
}
