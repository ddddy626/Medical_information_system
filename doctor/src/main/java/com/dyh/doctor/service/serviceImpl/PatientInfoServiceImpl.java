package com.dyh.doctor.service.serviceImpl;

import com.dyh.doctor.domain.PatientInfoEntity;
import com.dyh.doctor.mapper.PatientInfoMapper;
import com.dyh.doctor.service.PatientInfoService;
import com.dyh.doctor.util.CacheUtil;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import java.util.*;

@Service
public class PatientInfoServiceImpl implements PatientInfoService {
    private static int PAGE_DEFAULT = 1;
    private static int SIZE_DEFAULT = 10;
    private static final long TTL_SECONDS = 1800L;

    @Resource
    private PatientInfoMapper patientInfoMapper;

    @Resource
    private CacheUtil cacheUtil;

    public PatientInfoEntity queryById(Integer patientId){
        return this.patientInfoMapper.queryById(patientId);
    }

    public Page<PatientInfoEntity> queryByPage(PatientInfoEntity patientInfo, Integer page, Integer size, String orderCol, String orderDirect){

        if(page == null || page <= 0){
            page = PAGE_DEFAULT;
        }
        if(size == null || size <= 0){
            size = SIZE_DEFAULT;
        }

        Sort sort = null;
        if(orderCol != null) {
            Sort.Order order = new Sort.Order(("DESC".equals(orderDirect) ? Sort.Direction.DESC : Sort.Direction.ASC), orderCol);
            sort = Sort.by(order);
        }

        PageRequest pageRequest = PageRequest.of(page - 1, size);
        if(sort != null){
            pageRequest = PageRequest.of(page - 1, size, sort);
        }

        // 按 userId 查患者信息（健康档案高频）走缓存，分页参数不变
        if (patientInfo != null && patientInfo.getUserId() != null
                && page == 1 && size == 1 && orderCol == null
                && isOnlyUserIdFilter(patientInfo)) {
            String key = "patient:" + patientInfo.getUserId();
            if (cacheUtil.isEmptyCached(key)) {
                return new PageImpl<>(Collections.emptyList(), pageRequest, 0);
            }
            Object cached = cacheUtil.get(key);
            if (cached instanceof PatientInfoEntity) {
                return new PageImpl<>(Collections.singletonList((PatientInfoEntity) cached), pageRequest, 1);
            }
            List<PatientInfoEntity> list = this.patientInfoMapper.queryAllByLimit(patientInfo, pageRequest);
            long total = this.patientInfoMapper.count(patientInfo);
            if (list == null || list.isEmpty()) {
                cacheUtil.set(key, null, TTL_SECONDS);
                return new PageImpl<>(Collections.emptyList(), pageRequest, 0);
            }
            cacheUtil.set(key, list.get(0), TTL_SECONDS);
            return new PageImpl<>(list, pageRequest, total);
        }

        long total = this.patientInfoMapper.count(patientInfo);
        return new PageImpl<>(this.patientInfoMapper.queryAllByLimit(patientInfo, pageRequest), pageRequest, total);
    }

    private boolean isOnlyUserIdFilter(PatientInfoEntity p) {
        return p.getPatientId() == null
                && (p.getPatientName() == null || p.getPatientName().isEmpty());
    }

    private void evictPatientCache(PatientInfoEntity patientInfo) {
        if (patientInfo != null && patientInfo.getUserId() != null) {
            cacheUtil.delete("patient:" + patientInfo.getUserId());
        }
    }

    public boolean insert(PatientInfoEntity patientInfo){
        boolean ok = this.patientInfoMapper.insert(patientInfo) > 0;
        if (ok) {
            evictPatientCache(patientInfo);
        }
        return ok;
    }

    public boolean update(PatientInfoEntity patientInfo){
        boolean ok = this.patientInfoMapper.update(patientInfo) > 0;
        if (ok) {
            PatientInfoEntity full = patientInfo;
            if (patientInfo.getUserId() == null && patientInfo.getPatientId() != null) {
                full = this.patientInfoMapper.queryById(patientInfo.getPatientId());
            }
            evictPatientCache(full != null ? full : patientInfo);
        }
        return ok;
    }

    public boolean deleteById(Integer patientId){
        PatientInfoEntity existing = this.patientInfoMapper.queryById(patientId);
        boolean ok = this.patientInfoMapper.deleteById(patientId) > 0;
        if (ok) {
            evictPatientCache(existing);
        }
        return ok;
    }

}
