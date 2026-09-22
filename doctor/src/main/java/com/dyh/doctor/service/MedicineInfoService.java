package com.dyh.doctor.service;

import com.dyh.doctor.domain.MedicineInfoEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.*;

public interface MedicineInfoService {
    MedicineInfoEntity queryById(Integer medicineId);

    Page<MedicineInfoEntity> queryByPage(MedicineInfoEntity medicineInfo, Integer page, Integer size, String orderCol, String orderDirect);

    boolean insert(MedicineInfoEntity medicineInfo);

    boolean update(MedicineInfoEntity medicineInfo);

    boolean deleteById(Integer medicineId);

}