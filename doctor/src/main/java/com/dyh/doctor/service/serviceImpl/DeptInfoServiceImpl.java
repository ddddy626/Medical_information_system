package com.dyh.doctor.service.serviceImpl;

import com.dyh.doctor.domain.DeptInfoEntity;
import com.dyh.doctor.mapper.DeptInfoMapper;
import com.dyh.doctor.service.DeptInfoService;
import com.dyh.doctor.util.CacheUtil;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import java.util.*;

@Service
public class DeptInfoServiceImpl implements DeptInfoService {
    private static int PAGE_DEFAULT = 1;
    private static int SIZE_DEFAULT = 10;
    private static final long TTL_SECONDS = 3600L;
    private static final String KEY_LIST = "dept:list";

    @Resource
    private DeptInfoMapper deptInfoMapper;

    @Resource
    private CacheUtil cacheUtil;

    public DeptInfoEntity queryById(Integer deptId){
        return this.deptInfoMapper.queryById(deptId);
    }

    public Page<DeptInfoEntity> queryByPage(DeptInfoEntity deptInfo, Integer page, Integer size, String orderCol, String orderDirect){

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

        // 无筛选条件时缓存整表列表，再内存分页，保证 page/size 行为不变
        if (isBlankFilter(deptInfo) && orderCol == null) {
            List<DeptInfoEntity> all = loadCachedAll();
            long total = all.size();
            int from = (int) pageRequest.getOffset();
            int to = Math.min(from + pageRequest.getPageSize(), all.size());
            List<DeptInfoEntity> slice = from >= all.size() ? Collections.emptyList() : all.subList(from, to);
            return new PageImpl<>(slice, pageRequest, total);
        }

        long total = this.deptInfoMapper.count(deptInfo);
        return new PageImpl<>(this.deptInfoMapper.queryAllByLimit(deptInfo, pageRequest), pageRequest, total);
    }

    @SuppressWarnings("unchecked")
    private List<DeptInfoEntity> loadCachedAll() {
        if (cacheUtil.isEmptyCached(KEY_LIST)) {
            return Collections.emptyList();
        }
        Object cached = cacheUtil.get(KEY_LIST);
        if (cached instanceof List) {
            return (List<DeptInfoEntity>) cached;
        }
        DeptInfoEntity empty = new DeptInfoEntity();
        PageRequest allReq = PageRequest.of(0, 10000);
        List<DeptInfoEntity> all = this.deptInfoMapper.queryAllByLimit(empty, allReq);
        cacheUtil.set(KEY_LIST, all, TTL_SECONDS);
        return all == null ? Collections.emptyList() : all;
    }

    private boolean isBlankFilter(DeptInfoEntity deptInfo) {
        if (deptInfo == null) {
            return true;
        }
        return deptInfo.getDeptId() == null
                && (deptInfo.getDeptName() == null || deptInfo.getDeptName().isEmpty());
    }

    public boolean insert(DeptInfoEntity deptInfo){
        boolean ok = this.deptInfoMapper.insert(deptInfo) > 0;
        if (ok) {
            cacheUtil.delete(KEY_LIST);
        }
        return ok;
    }

    public boolean update(DeptInfoEntity deptInfo){
        boolean ok = this.deptInfoMapper.update(deptInfo) > 0;
        if (ok) {
            cacheUtil.delete(KEY_LIST);
        }
        return ok;
    }

    public boolean deleteById(Integer deptId){
        boolean ok = this.deptInfoMapper.deleteById(deptId) > 0;
        if (ok) {
            cacheUtil.delete(KEY_LIST);
        }
        return ok;
    }

}
