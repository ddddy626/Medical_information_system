package com.dyh.doctor.mapper;

import com.dyh.doctor.domain.SiteVisitEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.*;

public interface SiteVisitMapper {

    List<SiteVisitEntity> queryAllByLimit(@Param("siteVisit") SiteVisitEntity siteVisit, @Param("pageable") Pageable pageable);

    long count(@Param("siteVisit") SiteVisitEntity siteVisit);

    int insert(SiteVisitEntity siteVisit);

}
