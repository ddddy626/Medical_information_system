package com.dyh.doctor.service.serviceImpl;

import com.dyh.doctor.domain.FeeInfoEntity;
import com.dyh.doctor.domain.PatientInfoEntity;
import com.dyh.doctor.domain.UserInfoEntity;
import com.dyh.doctor.mapper.FeeInfoMapper;
import com.dyh.doctor.service.FeeInfoService;
import com.dyh.doctor.service.PatientInfoService;
import com.dyh.doctor.service.UserInfoService;
import com.dyh.doctor.util.MailUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import java.util.*;

@Service
public class FeeInfoServiceImpl implements FeeInfoService {
    private static final Logger log = Logger.getLogger(FeeInfoServiceImpl.class);
    private static int PAGE_DEFAULT = 1;
    private static int SIZE_DEFAULT = 10;

    @Resource
    private FeeInfoMapper feeInfoMapper;

    @Resource
    private MailUtil mailUtil;

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private PatientInfoService patientInfoService;

    public FeeInfoEntity queryById(Integer feeId){
        return this.feeInfoMapper.queryById(feeId);
    }

    public Page<FeeInfoEntity> queryByPage(FeeInfoEntity feeInfo, Integer page, Integer size, String orderCol, String orderDirect){

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

        long total = this.feeInfoMapper.count(feeInfo);

        return new PageImpl<>(this.feeInfoMapper.queryAllByLimit(feeInfo, pageRequest), pageRequest, total);
    }

    public boolean insert(FeeInfoEntity feeInfo){
        boolean ok = this.feeInfoMapper.insert(feeInfo) > 0;
        if (ok) {
            sendFeeMail(feeInfo);
        }
        return ok;
    }

    private void sendFeeMail(FeeInfoEntity feeInfo) {
        try {
            Integer patientRef = feeInfo.getPatientId();
            if (patientRef == null) {
                return;
            }
            // fee.patient_id 在本项目中存的是 userId
            UserInfoEntity user = userInfoService.queryById(patientRef);
            String name = "患者";
            String email = null;
            if (user != null) {
                email = user.getEmail();
                name = user.getRealName() != null ? user.getRealName() : user.getUsername();
            } else {
                PatientInfoEntity patient = patientInfoService.queryById(patientRef);
                if (patient != null && patient.getUserId() != null) {
                    name = patient.getPatientName() != null ? patient.getPatientName() : name;
                    UserInfoEntity u2 = userInfoService.queryById(patient.getUserId());
                    if (u2 != null) {
                        email = u2.getEmail();
                    }
                }
            }
            if (email == null || email.trim().isEmpty()) {
                return;
            }
            Object amount = feeInfo.getAmount() != null ? feeInfo.getAmount() : 0;
            String content = "<p>" + name + "，一笔" + amount + "元费用待缴纳</p>";
            mailUtil.send(email.trim(), "待缴费通知", content);
        } catch (Exception e) {
            log.warn("缴费邮件发送失败: " + e.getMessage());
        }
    }

    public boolean update(FeeInfoEntity feeInfo){
        return this.feeInfoMapper.update(feeInfo) > 0;
    }

    public boolean deleteById(Integer feeId){
        return this.feeInfoMapper.deleteById(feeId) > 0;
    }

    public boolean updatePayStatus(Integer feeId, Integer payStatus){
        return this.feeInfoMapper.updatePayStatus(feeId, payStatus) > 0;
    }

    @Override
    public int scanPayComplete(Integer feeId, Integer patientId, String payMethod, String payTime) {
        if (feeId != null) {
            FeeInfoEntity fee = this.feeInfoMapper.queryById(feeId);
            if (fee == null || fee.getPayStatus() != null && fee.getPayStatus() == 1) {
                return 0;
            }
            FeeInfoEntity patch = new FeeInfoEntity();
            patch.setFeeId(feeId);
            patch.setPayStatus(1);
            patch.setPayMethod(payMethod);
            patch.setPayTime(payTime);
            return this.feeInfoMapper.update(patch) > 0 ? 1 : 0;
        }
        if (patientId == null) {
            return 0;
        }
        return this.feeInfoMapper.updatePendingByPatient(patientId, payMethod, payTime);
    }

}
