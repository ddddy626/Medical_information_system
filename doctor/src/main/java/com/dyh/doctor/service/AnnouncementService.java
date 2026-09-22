package com.dyh.doctor.service;

import com.dyh.doctor.domain.AnnouncementEntity;
import java.util.List;

public interface AnnouncementService {
    List<AnnouncementEntity> queryByPage(int page, int size);
    int count();
    int add(AnnouncementEntity entity);
    int edit(AnnouncementEntity entity);
    int deleteById(int id);
}
