package com.dyh.doctor.controller;

import com.dyh.doctor.domain.RegisterInfoEntity;
import com.dyh.doctor.domain.UserInfoEntity;
import com.dyh.doctor.domain.PatientInfoEntity;
import com.dyh.doctor.domain.DoctorInfoEntity;
import com.dyh.doctor.domain.DeptInfoEntity;
import com.dyh.doctor.service.RegisterInfoService;
import com.dyh.doctor.service.UserInfoService;
import com.dyh.doctor.service.PatientInfoService;
import com.dyh.doctor.service.DoctorInfoService;
import com.dyh.doctor.service.DeptInfoService;
import com.dyh.doctor.service.serviceImpl.RegisterInfoServiceImpl;
import com.dyh.doctor.util.*;
import org.apache.log4j.Logger;

import javax.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import org.springframework.data.domain.Page;

import java.util.*;

@RestController
@RequestMapping("registerInfo")
public class RegisterInfoController {
    private static final Logger log = Logger.getLogger(RegisterInfoController.class);

    @Resource
    private RegisterInfoService registerInfoService;

    @Resource
    private MailUtil mailUtil;

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private PatientInfoService patientInfoService;

    @Resource
    private DoctorInfoService doctorInfoService;

    @Resource
    private DeptInfoService deptInfoService;

    @RequestMapping("queryById/{id}")
    public ReturnVO queryById(@PathVariable("id") Integer id) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        RegisterInfoEntity registerInfo = this.registerInfoService.queryById(id);

        if(registerInfo == null) {
            return returnVO;
        }

        returnVO = ReturnVO.getSuccessDataReturnVO(registerInfo);

        return returnVO;
    }

    @RequestMapping("queryByPage")
    public ReturnVO queryByPage(RegisterInfoEntity registerInfo, Integer page, Integer size, String orderCol, String orderDirect) {
        log.info("queryByPage查询参数: doctorId=" + registerInfo.getDoctorId() + ", patientId=" + registerInfo.getPatientId() + ", regStatus=" + registerInfo.getRegStatus() + ", page=" + page + ", size=" + size);

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        Page<RegisterInfoEntity> pageVO =
            this.registerInfoService.queryByPage(
                registerInfo,
                page, size,
                orderCol, orderDirect);

        //没有数据
        if(pageVO.getContent().isEmpty()){
            return returnVO;
        }

        //查询成功
        returnVO = ReturnVO.getSuccessDataReturnVO(pageVO);

        return returnVO;
    }

    /**
     * 查询医生某日剩余号源：remaining = dailyLimit - 已挂号数
     * GET /registerInfo/remainingSlots?doctorId=1&date=2026-08-07
     */
    @RequestMapping("remainingSlots")
    public ReturnVO remainingSlots(Integer doctorId, String date) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        if (doctorId == null) {
            returnVO.setMsg("缺少医生ID");
            return returnVO;
        }
        String day = (date == null || date.trim().isEmpty())
                ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())
                : date.trim();
        int limit = this.registerInfoService.getDailyLimit();
        long used = this.registerInfoService.countByDoctorAndDate(doctorId, day);
        long remaining = Math.max(0, limit - used);

        Map<String, Object> data = new LinkedHashMap<>();
        data.put("doctorId", doctorId);
        data.put("date", day);
        data.put("dailyLimit", limit);
        data.put("used", used);
        data.put("remaining", remaining);
        return ReturnVO.getSuccessDataReturnVO(data);
    }

    @RequestMapping("add")
    public ReturnVO add(@RequestBody Map<String, Object> registerData) {
        log.info("接收到挂号请求: " + registerData);

        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        try {
            RegisterInfoEntity registerInfo = new RegisterInfoEntity();


            if (registerData.containsKey("patientId")) {
                Object patientIdObj = registerData.get("patientId");
                if (patientIdObj != null) {
                    if (patientIdObj instanceof Number) {
                        registerInfo.setPatientId(((Number) patientIdObj).intValue());
                    } else {
                        registerInfo.setPatientId(Integer.parseInt(patientIdObj.toString().trim()));
                    }
                }
            }
            if (registerData.containsKey("doctorId")) {
                Object doctorId = registerData.get("doctorId");
                if (doctorId != null) {
                    if (doctorId instanceof Number) {
                        registerInfo.setDoctorId(((Number) doctorId).intValue());
                    } else {
                        String doctorIdStr = doctorId.toString().trim();
                        if (!doctorIdStr.isEmpty()) {
                            registerInfo.setDoctorId(Integer.parseInt(doctorIdStr));
                        }
                    }
                }
            }
            if (registerData.containsKey("deptId")) {
                Object deptId = registerData.get("deptId");
                if (deptId != null) {
                    if (deptId instanceof Number) {
                        registerInfo.setDeptId(((Number) deptId).intValue());
                    } else {
                        String deptIdStr = deptId.toString().trim();
                        if (!deptIdStr.isEmpty()) {
                            registerInfo.setDeptId(Integer.parseInt(deptIdStr));
                        }
                    }
                }
            }

            registerInfo.setRegNo("REG-" + System.currentTimeMillis());
            String currentTime = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
            registerInfo.setRegTime(currentTime);
            // 优先使用前端预约日期，保证「剩余号」按就诊日统计
            String visitTime = resolveVisitTime(registerData.get("registerTime"), currentTime);
            registerInfo.setVisitTime(visitTime);

            String status = registerData.get("registerStatus") != null ? registerData.get("registerStatus").toString() : "待就诊";
            registerInfo.setRegStatus("待就诊".equals(status) ? 0 : 1);

            registerInfo.setFee(0.0);

            log.info("开始插入挂号信息: regNo=" + registerInfo.getRegNo() + ", patientId=" + registerInfo.getPatientId() + ", doctorId=" + registerInfo.getDoctorId() + ", deptId=" + registerInfo.getDeptId() + ", visitTime=" + visitTime);

            //入库
            if(!this.registerInfoService.insert(registerInfo)){
                String lockMsg = RegisterInfoServiceImpl.LOCK_FAIL_MSG.get();
                RegisterInfoServiceImpl.LOCK_FAIL_MSG.remove();
                returnVO.setMsg(lockMsg != null ? lockMsg : "预约失败");
                return returnVO;
            }

            sendRegisterSuccessMail(registerInfo);

            returnVO.setCode(1);
            returnVO.setMsg("预约成功");
            return returnVO;
        } catch (Exception e) {
            log.error("挂号失败: " + e.getMessage(), e);
            returnVO.setMsg("预约失败：" + e.getMessage());
            return returnVO;
        }
    }

    private String resolveVisitTime(Object registerTimeObj, String fallback) {
        if (registerTimeObj == null) {
            return fallback;
        }
        String raw = registerTimeObj.toString().trim();
        if (raw.isEmpty()) {
            return fallback;
        }
        // yyyy-MM-dd → 补当天时刻，便于锁时段与展示
        if (raw.length() == 10) {
            String timePart = fallback.length() >= 19 ? fallback.substring(10) : " 09:00:00";
            return raw + timePart;
        }
        if (raw.length() >= 16) {
            return raw.length() >= 19 ? raw.substring(0, 19) : raw + ":00";
        }
        return fallback;
    }

    private void sendRegisterSuccessMail(RegisterInfoEntity registerInfo) {
        try {
            String email = resolvePatientEmail(registerInfo.getPatientId());
            if (email == null) {
                log.warn("挂号成功但患者未绑定邮箱，跳过邮件: patientId=" + registerInfo.getPatientId()
                        + ", regNo=" + registerInfo.getRegNo());
                return;
            }
            String name = resolvePatientName(registerInfo.getPatientId());
            String deptName = "";
            String doctorName = "";
            if (registerInfo.getDeptId() != null) {
                DeptInfoEntity dept = deptInfoService.queryById(registerInfo.getDeptId());
                if (dept != null) {
                    deptName = dept.getDeptName() != null ? dept.getDeptName() : "";
                }
            }
            if (registerInfo.getDoctorId() != null) {
                DoctorInfoEntity doctor = doctorInfoService.queryById(registerInfo.getDoctorId());
                if (doctor != null) {
                    doctorName = doctor.getDoctorName() != null ? doctor.getDoctorName() : "";
                }
            }
            String regNo = registerInfo.getRegNo() != null ? registerInfo.getRegNo() : "";
            String visitTime = registerInfo.getVisitTime() != null ? registerInfo.getVisitTime() : "";
            String content = "<div style=\"font-family:sans-serif;line-height:1.7;color:#222;\">"
                    + "<p>尊敬的 <b>" + name + "</b>：</p>"
                    + "<p>您已成功预约挂号，详情如下：</p>"
                    + "<ul>"
                    + "<li>挂号单号：<b>" + regNo + "</b></li>"
                    + "<li>科室：" + deptName + "</li>"
                    + "<li>医生：" + doctorName + "</li>"
                    + "<li>就诊时间：<b>" + visitTime + "</b></li>"
                    + "</ul>"
                    + "<p>请携带有效证件，建议提前 30 分钟到院候诊；如需退号请登录系统取消。</p>"
                    + "<p style=\"color:#666;\">智慧门诊系统</p>"
                    + "</div>";
            mailUtil.send(email, "挂号成功通知", content);
        } catch (Exception e) {
            log.warn("挂号邮件发送失败: " + e.getMessage());
        }
    }

    private String resolvePatientEmail(Integer patientId) {
        if (patientId == null) {
            return null;
        }
        PatientInfoEntity patient = patientInfoService.queryById(patientId);
        Integer userId = patient != null ? patient.getUserId() : patientId;
        UserInfoEntity user = userInfoService.queryById(userId);
        if (user == null || user.getEmail() == null || user.getEmail().trim().isEmpty()) {
            return null;
        }
        return user.getEmail().trim();
    }

    private String resolvePatientName(Integer patientId) {
        if (patientId == null) {
            return "患者";
        }
        PatientInfoEntity patient = patientInfoService.queryById(patientId);
        if (patient != null && patient.getPatientName() != null) {
            return patient.getPatientName();
        }
        UserInfoEntity user = userInfoService.queryById(patientId);
        if (user != null && user.getRealName() != null) {
            return user.getRealName();
        }
        return "患者";
    }

    @RequestMapping("edit")
    public ReturnVO edit(@RequestBody RegisterInfoEntity registerInfo) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        //修改
        if(!this.registerInfoService.update(registerInfo)){
            //修改失败
            return returnVO;
        }

        //修改成功
        returnVO.setCode(1);
        returnVO.setMsg("修改成功");

        return returnVO;
    }

    @RequestMapping("deleteById/{id}")
    public ReturnVO deleteById(@PathVariable("id") Integer id) {        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        if(!this.registerInfoService.deleteById(id)){
            //删除失败
            return returnVO;
        }

        returnVO.setCode(1);
        returnVO.setMsg("删除成功");

        return returnVO;
    }

}
