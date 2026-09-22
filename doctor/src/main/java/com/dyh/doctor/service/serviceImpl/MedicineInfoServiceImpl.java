package com.dyh.doctor.service.serviceImpl;

import com.dyh.doctor.domain.MedicineInfoEntity;
import com.dyh.doctor.mapper.MedicineInfoMapper;
import com.dyh.doctor.service.MedicineInfoService;
import com.dyh.doctor.util.CacheUtil;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import java.util.*;

@Service
public class MedicineInfoServiceImpl implements MedicineInfoService {
    private static int PAGE_DEFAULT = 1;
    private static int SIZE_DEFAULT = 10;
    private static final String KEY_LIST = "medicine:list";
    private static final long TTL_SECONDS = 7200L;

    @Resource
    private MedicineInfoMapper medicineInfoMapper;

    @Resource
    private CacheUtil cacheUtil;

    public MedicineInfoEntity queryById(Integer medicineId){
        return this.medicineInfoMapper.queryById(medicineId);
    }

    public Page<MedicineInfoEntity> queryByPage(MedicineInfoEntity medicineInfo, Integer page, Integer size, String orderCol, String orderDirect){

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

        if (isBlankFilter(medicineInfo) && orderCol == null) {
            List<MedicineInfoEntity> all = loadCachedAll();
            long total = all.size();
            int from = (int) pageRequest.getOffset();
            int to = Math.min(from + pageRequest.getPageSize(), all.size());
            List<MedicineInfoEntity> slice = from >= all.size() ? Collections.emptyList() : all.subList(from, to);
            return new PageImpl<>(slice, pageRequest, total);
        }

        long total = this.medicineInfoMapper.count(medicineInfo);
        return new PageImpl<>(this.medicineInfoMapper.queryAllByLimit(medicineInfo, pageRequest), pageRequest, total);
    }

    @SuppressWarnings("unchecked")
    private List<MedicineInfoEntity> loadCachedAll() {
        if (cacheUtil.isEmptyCached(KEY_LIST)) {
            return Collections.emptyList();
        }
        Object cached = cacheUtil.get(KEY_LIST);
        if (cached instanceof List) {
            return (List<MedicineInfoEntity>) cached;
        }
        MedicineInfoEntity empty = new MedicineInfoEntity();
        List<MedicineInfoEntity> all = this.medicineInfoMapper.queryAllByLimit(empty, PageRequest.of(0, 10000));
        cacheUtil.set(KEY_LIST, all, TTL_SECONDS);
        return all == null ? Collections.emptyList() : all;
    }

    private boolean isBlankFilter(MedicineInfoEntity m) {
        if (m == null) {
            return true;
        }
        return m.getId() == null
                && (m.getMedName() == null || m.getMedName().isEmpty())
                && (m.getMedType() == null || m.getMedType().isEmpty())
                && m.getStatus() == null;
    }

    public boolean insert(MedicineInfoEntity medicineInfo){
        boolean ok = this.medicineInfoMapper.insert(medicineInfo) > 0;
        if (ok) {
            cacheUtil.delete(KEY_LIST);
        }
        return ok;
    }

    public boolean update(MedicineInfoEntity medicineInfo){
        boolean ok = this.medicineInfoMapper.update(medicineInfo) > 0;
        if (ok) {
            cacheUtil.delete(KEY_LIST);
        }
        return ok;
    }

    public boolean deleteById(Integer medicineId){
        boolean ok = this.medicineInfoMapper.deleteById(medicineId) > 0;
        if (ok) {
            cacheUtil.delete(KEY_LIST);
        }
        return ok;
    }

}
