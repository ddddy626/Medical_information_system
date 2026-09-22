package com.dyh.doctor.mapper;

import com.dyh.doctor.domain.MedicineInfoEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.*;

public interface MedicineInfoMapper{

    MedicineInfoEntity queryById(Integer medicineId);

    public List<MedicineInfoEntity> queryAllByLimit(@Param("medicineInfo") MedicineInfoEntity medicineInfo, @Param("pageable") Pageable pageable);

    long count(@Param("medicineInfo") MedicineInfoEntity medicineInfo);

    int insert(MedicineInfoEntity medicineInfo);

    int update(MedicineInfoEntity medicineInfo);

    int deleteById(Integer medicineId);

}