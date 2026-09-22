package com.dyh.doctor.config;

import com.dyh.doctor.domain.PatientInfoEntity;
import com.dyh.doctor.domain.RegisterInfoEntity;
import com.dyh.doctor.domain.UserInfoEntity;
import com.dyh.doctor.mapper.RegisterInfoMapper;
import com.dyh.doctor.service.PatientInfoService;
import com.dyh.doctor.service.UserInfoService;
import com.dyh.doctor.util.MailUtil;
import org.apache.log4j.Logger;
import org.springframework.data.domain.PageRequest;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 * 就诊前一天 08:00 邮件提醒。
 */
@Component
public class AppointmentRemindJob {
    private static final Logger log = Logger.getLogger(AppointmentRemindJob.class);
    private static final DateTimeFormatter DAY = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    @Resource
    private RegisterInfoMapper registerInfoMapper;

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private PatientInfoService patientInfoService;

    @Resource
    private MailUtil mailUtil;

    @Scheduled(cron = "0 0 8 * * ?")
    public void remindTomorrowAppointments() {
        try {
            String tomorrow = LocalDate.now().plusDays(1).format(DAY);
            RegisterInfoEntity filter = new RegisterInfoEntity();
            List<RegisterInfoEntity> list = registerInfoMapper.queryAllByLimit(filter, PageRequest.of(0, 500));
            int sent = 0;
            for (RegisterInfoEntity reg : list) {
                if (reg.getVisitTime() == null || !reg.getVisitTime().startsWith(tomorrow)) {
                    continue;
                }
                if (reg.getRegStatus() != null && reg.getRegStatus() != 0) {
                    continue;
                }
                UserInfoEntity user = resolveUser(reg.getPatientId());
                if (user == null || user.getEmail() == null || user.getEmail().trim().isEmpty()) {
                    continue;
                }
                String name = user.getRealName() != null ? user.getRealName() : user.getUsername();
                String dept = reg.getDeptName() != null ? reg.getDeptName() : ("科室#" + reg.getDeptId());
                String content = "<p>" + name + "，您好：</p>"
                        + "<p>提醒您明日（" + tomorrow + "）有预约就诊：" + dept
                        + "，请按时到院。如需改期请提前联系医院。</p>";
                mailUtil.send(user.getEmail(), "就诊提醒", content);
                sent++;
            }
            log.info("Appointment remind sent=" + sent + " for date=" + tomorrow);
        } catch (Exception e) {
            log.warn("Appointment remind job failed: " + e.getMessage());
        }
    }

    private UserInfoEntity resolveUser(Integer patientId) {
        if (patientId == null) {
            return null;
        }
        PatientInfoEntity patient = patientInfoService.queryById(patientId);
        if (patient != null && patient.getUserId() != null) {
            return userInfoService.queryById(patient.getUserId());
        }
        return userInfoService.queryById(patientId);
    }
}
