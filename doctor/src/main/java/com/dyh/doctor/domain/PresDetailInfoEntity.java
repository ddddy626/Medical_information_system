package com.dyh.doctor.domain;

import lombok.Data;

@Data
public class PresDetailInfoEntity{
    private Integer detailId;
    private Integer recordId;
    private Integer medicineId;
    private Integer quantity;

    // JOIN 关联字段
    private String medName;
    private String spec;
    private Double price;
    private String medType;
}