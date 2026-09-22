package com.dyh.doctor.service.serviceImpl;

import com.dyh.doctor.domain.SiteVisitEntity;
import com.dyh.doctor.mapper.SiteVisitMapper;
import com.dyh.doctor.service.SiteVisitService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

@Service
public class SiteVisitServiceImpl implements SiteVisitService {

    @Resource
    private SiteVisitMapper siteVisitMapper;

    public Page<SiteVisitEntity> queryByPage(SiteVisitEntity siteVisit, Integer page, Integer size) {
        if (page == null || page <= 0) page = 1;
        if (size == null || size <= 0) size = 10;
        PageRequest pageRequest = PageRequest.of(page - 1, size);
        long total = siteVisitMapper.count(siteVisit);
        return new PageImpl<>(siteVisitMapper.queryAllByLimit(siteVisit, pageRequest), pageRequest, total);
    }

    public boolean insert(SiteVisitEntity siteVisit) {
        return siteVisitMapper.insert(siteVisit) > 0;
    }
}
