package com.dyh.doctor.service.serviceImpl;

import com.dyh.doctor.domain.DoctorInfoEntity;
import com.dyh.doctor.mapper.DoctorInfoMapper;
import com.dyh.doctor.service.DoctorInfoService;
import com.dyh.doctor.util.CacheUtil;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import java.util.*;

@Service
public class DoctorInfoServiceImpl implements DoctorInfoService {
    private static int PAGE_DEFAULT = 1;
    private static int SIZE_DEFAULT = 10;
    private static final long TTL_SECONDS = 1800L;

    @Resource
    private DoctorInfoMapper doctorInfoMapper;

    @Resource
    private CacheUtil cacheUtil;

    public DoctorInfoEntity queryById(Integer doctorId){
        return this.doctorInfoMapper.queryById(doctorId);
    }

    public Page<DoctorInfoEntity> queryByPage(DoctorInfoEntity doctorInfo, Integer page, Integer size, String orderCol, String orderDirect){

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

        // 按科室查询时缓存该科室医生列表，分页逻辑不变
        if (doctorInfo != null && doctorInfo.getDeptId() != null && isOnlyDeptFilter(doctorInfo) && orderCol == null) {
            String key = "dept:" + doctorInfo.getDeptId() + ":doctors";
            List<DoctorInfoEntity> all = loadCachedByDept(key, doctorInfo);
            long total = all.size();
            int from = (int) pageRequest.getOffset();
            int to = Math.min(from + pageRequest.getPageSize(), all.size());
            List<DoctorInfoEntity> slice = from >= all.size() ? Collections.emptyList() : all.subList(from, to);
            return new PageImpl<>(slice, pageRequest, total);
        }

        long total = this.doctorInfoMapper.count(doctorInfo);
        return new PageImpl<>(this.doctorInfoMapper.queryAllByLimit(doctorInfo, pageRequest), pageRequest, total);
    }

    @SuppressWarnings("unchecked")
    private List<DoctorInfoEntity> loadCachedByDept(String key, DoctorInfoEntity filter) {
        if (cacheUtil.isEmptyCached(key)) {
            return Collections.emptyList();
        }
        Object cached = cacheUtil.get(key);
        if (cached instanceof List) {
            return (List<DoctorInfoEntity>) cached;
        }
        PageRequest allReq = PageRequest.of(0, 10000);
        List<DoctorInfoEntity> all = this.doctorInfoMapper.queryAllByLimit(filter, allReq);
        cacheUtil.set(key, all, TTL_SECONDS);
        return all == null ? Collections.emptyList() : all;
    }

    private boolean isOnlyDeptFilter(DoctorInfoEntity d) {
        return d.getDoctorId() == null
                && (d.getDoctorName() == null || d.getDoctorName().isEmpty())
                && d.getUserId() == null
                && d.getDocStatus() == null;
    }

    private void evictDoctorCaches(DoctorInfoEntity doctorInfo) {
        cacheUtil.deleteByPattern("dept:*:doctors");
        if (doctorInfo != null && doctorInfo.getDeptId() != null) {
            cacheUtil.delete("dept:" + doctorInfo.getDeptId() + ":doctors");
        }
    }

    public boolean insert(DoctorInfoEntity doctorInfo){
        boolean ok = this.doctorInfoMapper.insert(doctorInfo) > 0;
        if (ok) {
            evictDoctorCaches(doctorInfo);
        }
        return ok;
    }

    public boolean update(DoctorInfoEntity doctorInfo){
        boolean ok = this.doctorInfoMapper.update(doctorInfo) > 0;
        if (ok) {
            evictDoctorCaches(doctorInfo);
        }
        return ok;
    }

    public boolean deleteById(Integer doctorId){
        DoctorInfoEntity existing = this.doctorInfoMapper.queryById(doctorId);
        boolean ok = this.doctorInfoMapper.deleteById(doctorId) > 0;
        if (ok) {
            evictDoctorCaches(existing);
        }
        return ok;
    }

}
