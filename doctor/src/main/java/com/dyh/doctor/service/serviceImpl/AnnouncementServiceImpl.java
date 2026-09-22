package com.dyh.doctor.service.serviceImpl;

import com.dyh.doctor.domain.AnnouncementEntity;
import com.dyh.doctor.mapper.AnnouncementMapper;
import com.dyh.doctor.service.AnnouncementService;
import com.dyh.doctor.util.CacheUtil;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Service
public class AnnouncementServiceImpl implements AnnouncementService {
    private static final String KEY_LATEST = "announce:latest";
    private static final long TTL_SECONDS = 600L;

    @Resource
    private AnnouncementMapper mapper;

    @Resource
    private CacheUtil cacheUtil;

    @Override
    @SuppressWarnings("unchecked")
    public List<AnnouncementEntity> queryByPage(int page, int size) {
        // 首页常用：第一页缓存为 announce:latest；其他页仍走库，分页参数不变
        if (page == 1) {
            if (cacheUtil.isEmptyCached(KEY_LATEST)) {
                return Collections.emptyList();
            }
            Object cached = cacheUtil.get(KEY_LATEST);
            if (cached instanceof List) {
                List<AnnouncementEntity> all = (List<AnnouncementEntity>) cached;
                int to = Math.min(size, all.size());
                return all.subList(0, to);
            }
            AnnouncementEntity[] arr = mapper.queryByPage(0, Math.max(size, 20));
            List<AnnouncementEntity> list = arr == null ? Collections.emptyList() : Arrays.asList(arr);
            cacheUtil.set(KEY_LATEST, list, TTL_SECONDS);
            int to = Math.min(size, list.size());
            return list.subList(0, to);
        }
        AnnouncementEntity[] arr = mapper.queryByPage((page - 1) * size, size);
        return arr == null ? Collections.emptyList() : Arrays.asList(arr);
    }

    @Override
    public int count() {
        return mapper.count();
    }

    @Override
    public int add(AnnouncementEntity entity) {
        int id = mapper.insert(entity);
        if (id > 0) {
            cacheUtil.delete(KEY_LATEST);
        }
        return id;
    }

    @Override
    public int edit(AnnouncementEntity entity) {
        int n = mapper.updateById(entity);
        if (n > 0) {
            cacheUtil.delete(KEY_LATEST);
        }
        return n;
    }

    @Override
    public int deleteById(int id) {
        int n = mapper.deleteById(id);
        if (n > 0) {
            cacheUtil.delete(KEY_LATEST);
        }
        return n;
    }
}
