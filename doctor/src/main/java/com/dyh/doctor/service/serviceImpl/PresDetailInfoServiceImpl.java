package com.dyh.doctor.service.serviceImpl;

import com.dyh.doctor.domain.PresDetailInfoEntity;
import com.dyh.doctor.mapper.PresDetailInfoMapper;
import com.dyh.doctor.service.PresDetailInfoService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

@Service
public class PresDetailInfoServiceImpl implements PresDetailInfoService {
    private static int PAGE_DEFAULT = 1;
    private static int SIZE_DEFAULT = 10;

    @Resource
    private PresDetailInfoMapper presDetailInfoMapper;

    public PresDetailInfoEntity queryById(Integer detailId){
        return this.presDetailInfoMapper.queryById(detailId);
    }

    public Page<PresDetailInfoEntity> queryByPage(PresDetailInfoEntity presDetailInfo, Integer page, Integer size, String orderCol, String orderDirect){
        if(page == null || page <= 0) page = PAGE_DEFAULT;
        if(size == null || size <= 0) size = SIZE_DEFAULT;

        Sort sort = null;
        if(orderCol != null) {
            Sort.Order order = new Sort.Order(("DESC".equals(orderDirect) ? Sort.Direction.DESC : Sort.Direction.ASC), orderCol);
            sort = Sort.by(order);
        }

        PageRequest pageRequest = PageRequest.of(page - 1, size);
        if(sort != null) pageRequest = PageRequest.of(page - 1, size, sort);

        long total = this.presDetailInfoMapper.count(presDetailInfo);
        return new PageImpl<>(this.presDetailInfoMapper.queryAllByLimit(presDetailInfo, pageRequest), pageRequest, total);
    }

    public boolean insert(PresDetailInfoEntity presDetailInfo){
        return this.presDetailInfoMapper.insert(presDetailInfo) > 0;
    }

    public boolean update(PresDetailInfoEntity presDetailInfo){
        return this.presDetailInfoMapper.update(presDetailInfo) > 0;
    }

    public boolean deleteById(Integer detailId){
        return this.presDetailInfoMapper.deleteById(detailId) > 0;
    }
}