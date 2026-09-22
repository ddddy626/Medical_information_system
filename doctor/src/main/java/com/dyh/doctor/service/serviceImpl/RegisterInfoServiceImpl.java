package com.dyh.doctor.service.serviceImpl;

import com.dyh.doctor.domain.RegisterInfoEntity;
import com.dyh.doctor.mapper.RegisterInfoMapper;
import com.dyh.doctor.service.RegisterInfoService;
import com.dyh.doctor.util.DistributedLockUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.apache.log4j.Logger;
import javax.annotation.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import java.util.*;

@Service
public class RegisterInfoServiceImpl implements RegisterInfoService {
    private static final Logger log = Logger.getLogger(RegisterInfoServiceImpl.class);
    private static int PAGE_DEFAULT = 1;
    private static int SIZE_DEFAULT = 10;
    private static final long LOCK_SECONDS = 30L;

    @Resource
    private RegisterInfoMapper registerInfoMapper;

    @Resource
    private DistributedLockUtil distributedLockUtil;

    @Value("${register.daily-limit:50}")
    private int dailyLimit;

    /** 锁竞争失败 / 号源已满时由 insert 返回 false，Controller 可区分提示 */
    public static final ThreadLocal<String> LOCK_FAIL_MSG = new ThreadLocal<>();

    public RegisterInfoEntity queryById(Integer registerId){
        return this.registerInfoMapper.queryById(registerId);
    }

    public Page<RegisterInfoEntity> queryByPage(RegisterInfoEntity registerInfo, Integer page, Integer size, String orderCol, String orderDirect){

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

        long total = this.registerInfoMapper.count(registerInfo);

        return new PageImpl<>(this.registerInfoMapper.queryAllByLimit(registerInfo, pageRequest), pageRequest, total);
    }

    @Override
    public long countByDoctorAndDate(Integer doctorId, String date) {
        if (doctorId == null || date == null || date.trim().isEmpty()) {
            return 0L;
        }
        RegisterInfoEntity probe = new RegisterInfoEntity();
        probe.setDoctorId(doctorId);
        probe.setVisitTime(date.trim());
        return this.registerInfoMapper.count(probe);
    }

    @Override
    public int getDailyLimit() {
        return dailyLimit > 0 ? dailyLimit : 50;
    }

    public boolean insert(RegisterInfoEntity registerInfo){
        LOCK_FAIL_MSG.remove();
        String date = extractDate(registerInfo.getVisitTime());
        Integer doctorId = registerInfo.getDoctorId() != null ? registerInfo.getDoctorId() : 0;
        // 按医生+日期锁号源，避免超卖
        String lockKey = "reg:lock:" + doctorId + ":" + date;
        String token = distributedLockUtil.tryLock(lockKey, LOCK_SECONDS);
        if (token == null) {
            LOCK_FAIL_MSG.set("当前号源繁忙，请稍后重试");
            log.warn("Register lock fail: " + lockKey);
            return false;
        }
        try {
            long used = countByDoctorAndDate(doctorId, date);
            int limit = getDailyLimit();
            if (used >= limit) {
                LOCK_FAIL_MSG.set("该医生当日号源已满（上限 " + limit + " 号）");
                log.warn("Register full: doctorId=" + doctorId + ", date=" + date + ", used=" + used);
                return false;
            }
            log.info("执行插入操作, entity=" + registerInfo + ", remaining=" + (limit - used));
            int result = this.registerInfoMapper.insert(registerInfo);
            log.info("插入结果: affectedRows=" + result + ", generatedId=" + registerInfo.getRegisterId());
            return result > 0;
        } finally {
            distributedLockUtil.unlock(lockKey, token);
        }
    }

    private static String extractDate(String visitTime) {
        if (visitTime != null && visitTime.length() >= 10) {
            return visitTime.substring(0, 10);
        }
        return new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
    }

    private static String extractTimeSlot(String visitTime) {
        if (visitTime != null && visitTime.length() >= 16) {
            // 按小时时段分片，降低同号源并发冲突粒度
            return visitTime.substring(11, 13);
        }
        return "all";
    }

    public boolean update(RegisterInfoEntity registerInfo){
        return this.registerInfoMapper.update(registerInfo) > 0;
    }

    public boolean deleteById(Integer registerId){
        return this.registerInfoMapper.deleteById(registerId) > 0;
    }

}
