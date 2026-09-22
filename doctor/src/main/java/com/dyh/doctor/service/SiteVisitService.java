package com.dyh.doctor.service;

import com.dyh.doctor.domain.SiteVisitEntity;
import org.springframework.data.domain.Page;

public interface SiteVisitService {
    Page<SiteVisitEntity> queryByPage(SiteVisitEntity siteVisit, Integer page, Integer size);
    boolean insert(SiteVisitEntity siteVisit);
}
