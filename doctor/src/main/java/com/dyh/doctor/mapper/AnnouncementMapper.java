package com.dyh.doctor.mapper;

import com.dyh.doctor.domain.AnnouncementEntity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AnnouncementMapper {
    AnnouncementEntity[] queryByPage(int offset, int limit);
    int count();
    int insert(AnnouncementEntity entity);
    int updateById(AnnouncementEntity entity);
    int deleteById(int id);
}
