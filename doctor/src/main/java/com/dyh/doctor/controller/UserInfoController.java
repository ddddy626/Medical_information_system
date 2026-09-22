package com.dyh.doctor.controller;

import com.dyh.doctor.domain.UserInfoEntity;
import com.dyh.doctor.service.UserInfoService;
import com.dyh.doctor.util.*;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.*;

import org.springframework.data.domain.Page;

import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("userInfo")
public class UserInfoController {
    private static final Logger log = Logger.getLogger(UserInfoController.class);

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private MailUtil mailUtil;

    @Resource
    private EmailCodeService emailCodeService;

    @RequestMapping("queryById/{id}")
    public ReturnVO queryById(@PathVariable("id") Integer id) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        UserInfoEntity userInfo = this.userInfoService.queryById(id);

        if(userInfo == null) {
            return returnVO;
        }

        returnVO = ReturnVO.getSuccessDataReturnVO(userInfo);

        return returnVO;
    }

    @RequestMapping("queryByPage")
    public ReturnVO queryByPage(UserInfoEntity userInfo, Integer page, Integer size, String orderCol, String orderDirect) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        Page<UserInfoEntity> pageVO =
            this.userInfoService.queryByPage(
                userInfo,
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

    @RequestMapping("add")
    public ReturnVO add(@RequestBody UserInfoEntity userInfo) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        //入库
        if(!this.userInfoService.insert(userInfo)){
            //入库失败
            return returnVO;
        }

        //入库成功
        returnVO.setCode(1);
        returnVO.setMsg("添加成功");

        return returnVO;
    }

    @RequestMapping("edit")
    public ReturnVO edit(@RequestBody UserInfoEntity userInfo) {

        //定义失败的返回对象
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();

        if (userInfo != null && userInfo.getEmail() != null && !userInfo.getEmail().trim().isEmpty()) {
            String emailErr = validateEmailForSave(userInfo.getEmail(), userInfo.getUserId());
            if (emailErr != null) {
                returnVO.setMsg(emailErr);
                return returnVO;
            }
            userInfo.setEmail(EmailCodeService.normalizeEmail(userInfo.getEmail()));
        }

        //修改
        if(!this.userInfoService.update(userInfo)){
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
        if(!this.userInfoService.deleteById(id)){
            //删除失败
            return returnVO;
        }

        returnVO.setCode(1);
        returnVO.setMsg("删除成功");

        return returnVO;
    }

    @PostMapping("register")
    public ReturnVO register(@RequestBody UserInfoEntity userInfo) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        if (userInfo == null || userInfo.getUsername() == null || userInfo.getUsername().trim().isEmpty()
                || userInfo.getPassword() == null || userInfo.getPassword().trim().isEmpty()
                || userInfo.getRoleType() == null) {
            returnVO.setMsg("注册参数不完整");
            return returnVO;
        }

        String username = userInfo.getUsername().trim();
        if (this.userInfoService.queryByUsername(username) != null) {
            returnVO.setMsg("账号已存在");
            return returnVO;
        }

        // 仅患者注册强制邮箱
        if (EmailCodeService.isPatientRole(userInfo.getRoleType())) {
            String email = userInfo.getEmail();
            if (email == null || email.trim().isEmpty()) {
                returnVO.setMsg("请填写邮箱");
                return returnVO;
            }
            String emailErr = validateEmailForSave(email, null);
            if (emailErr != null) {
                returnVO.setMsg(emailErr);
                return returnVO;
            }
            userInfo.setEmail(EmailCodeService.normalizeEmail(email));
        } else if (userInfo.getEmail() != null && !userInfo.getEmail().trim().isEmpty()) {
            String emailErr = validateEmailForSave(userInfo.getEmail(), null);
            if (emailErr != null) {
                returnVO.setMsg(emailErr);
                return returnVO;
            }
            userInfo.setEmail(EmailCodeService.normalizeEmail(userInfo.getEmail()));
        }

        userInfo.setUsername(username);
        userInfo.setPassword(PasswordUtil.degistPwd(userInfo.getPassword().trim()));
        if (userInfo.getStatus() == null) {
            userInfo.setStatus(1);
        }
        if (userInfo.getCreateTime() == null || userInfo.getCreateTime().trim().isEmpty()) {
            userInfo.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        }

        if (!this.userInfoService.insert(userInfo)) {
            returnVO.setMsg("注册失败");
            return returnVO;
        }

        returnVO.setCode(1);
        returnVO.setMsg("注册成功");
        Map<String, Object> data = new HashMap<>();
        data.put("userId", userInfo.getUserId());
        data.put("username", userInfo.getUsername());
        returnVO.setContent(data);
        return returnVO;
    }

    @PostMapping("login")
    public ReturnVO login(@RequestBody UserInfoEntity userInfo, HttpSession session) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        if (userInfo == null || userInfo.getUsername() == null || userInfo.getUsername().trim().isEmpty()
                || userInfo.getPassword() == null || userInfo.getPassword().trim().isEmpty()) {
            returnVO.setMsg("登录参数不完整");
            return returnVO;
        }

        String username = userInfo.getUsername().trim();
        String inputPwd = userInfo.getPassword().trim();
        String encryptedPwd = PasswordUtil.degistPwd(inputPwd);
        UserInfoEntity loginUser = this.userInfoService.queryByUsername(username);
        if (loginUser == null) {
            returnVO.setMsg("账号不存在");
            return returnVO;
        }

        // 兼容历史明文密码和新加密密码
        boolean pwdOk = inputPwd.equals(loginUser.getPassword()) || encryptedPwd.equals(loginUser.getPassword());
        if (!pwdOk) {
            returnVO.setMsg("密码错误");
            return returnVO;
        }

        if (loginUser.getStatus() != null && loginUser.getStatus() != 1) {
            returnVO.setMsg("账号已被禁用");
            return returnVO;
        }

        // 若前端传了角色，必须与数据库角色一致，防止越权登录
        if (userInfo.getRoleType() != null && !userInfo.getRoleType().equals(loginUser.getRoleType())) {
            returnVO.setMsg("所选角色与账号角色不匹配");
            return returnVO;
        }

        // 患者：库中已有邮箱才校验验证码；历史无邮箱账号允许先密码登录，进系统后再补绑
        boolean patientNeedBindEmail = false;
        if (EmailCodeService.isPatientRole(loginUser.getRoleType())) {
            boolean hasEmail = loginUser.getEmail() != null && !loginUser.getEmail().trim().isEmpty();
            if (hasEmail) {
                String codeErr = emailCodeService.validateAndConsume(username, userInfo.getEmailCode());
                if (codeErr != null) {
                    returnVO.setMsg(codeErr);
                    return returnVO;
                }
            } else {
                patientNeedBindEmail = true;
            }
        }

        Map<String, Object> data = new HashMap<>(8);
        data.put("userId", loginUser.getUserId());
        data.put("username", loginUser.getUsername());
        data.put("roleType", loginUser.getRoleType());
        data.put("realName", loginUser.getRealName());
        data.put("email", loginUser.getEmail());
        data.put("needBindEmail", patientNeedBindEmail);
        session.setAttribute("loginUserId", loginUser.getUserId());
        session.setAttribute("loginRoleType", loginUser.getRoleType());
        returnVO.setCode(1);
        returnVO.setMsg("登录成功");
        returnVO.setContent(data);
        return returnVO;
    }

    @PostMapping("sendEmailCode")
    public ReturnVO sendEmailCode(@RequestBody Map<String, String> body) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        String username = body != null ? body.get("username") : null;
        if (username == null || username.trim().isEmpty()) {
            returnVO.setMsg("请先填写账号");
            return returnVO;
        }
        username = username.trim();
        UserInfoEntity user = this.userInfoService.queryByUsername(username);
        if (user == null) {
            returnVO.setMsg("账号不存在");
            return returnVO;
        }
        if (!EmailCodeService.isPatientRole(user.getRoleType())) {
            returnVO.setMsg("该功能仅限患者账号");
            return returnVO;
        }
        if (user.getEmail() == null || user.getEmail().trim().isEmpty()) {
            returnVO.setMsg("该账号尚未绑定邮箱，请直接登录后再补填");
            return returnVO;
        }

        String allowErr = emailCodeService.checkSendAllowed(username);
        if (allowErr != null) {
            returnVO.setMsg(allowErr);
            return returnVO;
        }

        String code = emailCodeService.generateCode();
        String saveErr = emailCodeService.saveCode(username, code);
        if (saveErr != null) {
            returnVO.setMsg(saveErr);
            return returnVO;
        }

        String email = user.getEmail().trim();
        log.info("sendEmailCode to masked=" + maskEmail(email) + ", user=" + username);
        String content = "<p>您好，</p><p>您的登录验证码为 <b style=\"font-size:18px;letter-spacing:2px;\">"
                + code + "</b>，" + (EmailCodeService.CODE_TTL_SECONDS / 60)
                + " 分钟内有效。如非本人操作，请忽略本邮件。</p><p>智慧门诊系统</p>";
        String sendErr = mailUtil.sendAndGetError(email, "【智慧门诊系统】登录验证码", content);
        if (sendErr != null) {
            emailCodeService.rollbackUnsentCode(username);
            returnVO.setMsg("邮件发送失败：" + sendErr);
            return returnVO;
        }

        returnVO.setCode(1);
        returnVO.setMsg("发送成功，请查收邮件");
        Map<String, Object> data = new HashMap<>(2);
        data.put("emailMasked", maskEmail(email));
        returnVO.setContent(data);
        return returnVO;
    }

    /**
     * 登录前补全邮箱（公开接口）。需校验账号密码；仅患者且当前未绑邮箱时可绑定。
     */
    @PostMapping("bindEmail")
    public ReturnVO bindEmail(@RequestBody Map<String, String> body) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        if (body == null) {
            returnVO.setMsg("参数不完整");
            return returnVO;
        }
        String username = body.get("username");
        String password = body.get("password");
        String email = body.get("email");
        if (username == null || username.trim().isEmpty()
                || password == null || password.trim().isEmpty()
                || email == null || email.trim().isEmpty()) {
            returnVO.setMsg("请填写账号、密码与邮箱");
            return returnVO;
        }
        username = username.trim();
        UserInfoEntity user = this.userInfoService.queryByUsername(username);
        if (user == null) {
            returnVO.setMsg("账号不存在");
            return returnVO;
        }
        if (!EmailCodeService.isPatientRole(user.getRoleType())) {
            returnVO.setMsg("该功能仅限患者账号");
            return returnVO;
        }
        String inputPwd = password.trim();
        String encryptedPwd = PasswordUtil.degistPwd(inputPwd);
        boolean pwdOk = inputPwd.equals(user.getPassword()) || encryptedPwd.equals(user.getPassword());
        if (!pwdOk) {
            returnVO.setMsg("密码错误");
            return returnVO;
        }
        if (user.getEmail() != null && !user.getEmail().trim().isEmpty()) {
            returnVO.setMsg("该账号已绑定邮箱");
            return returnVO;
        }
        String emailErr = validateEmailForSave(email, user.getUserId());
        if (emailErr != null) {
            returnVO.setMsg(emailErr);
            return returnVO;
        }
        UserInfoEntity patch = new UserInfoEntity();
        patch.setUserId(user.getUserId());
        patch.setEmail(EmailCodeService.normalizeEmail(email));
        if (!this.userInfoService.update(patch)) {
            returnVO.setMsg("保存失败，请稍后重试");
            return returnVO;
        }
        returnVO.setCode(1);
        returnVO.setMsg("邮箱绑定成功");
        Map<String, Object> data = new HashMap<>(2);
        data.put("email", patch.getEmail());
        returnVO.setContent(data);
        return returnVO;
    }

    /**
     * 完善资料页补填邮箱（仅当当前邮箱为空）。
     */
    @PostMapping("fillEmail")
    public ReturnVO fillEmail(@RequestBody Map<String, Object> body) {
        ReturnVO returnVO = ReturnVO.getNodataFoundReturnVO();
        if (body == null || body.get("userId") == null || body.get("email") == null) {
            returnVO.setMsg("参数不完整");
            return returnVO;
        }
        Integer userId;
        try {
            userId = Integer.valueOf(String.valueOf(body.get("userId")));
        } catch (Exception e) {
            returnVO.setMsg("用户ID无效");
            return returnVO;
        }
        String email = String.valueOf(body.get("email"));
        UserInfoEntity user = this.userInfoService.queryById(userId);
        if (user == null) {
            returnVO.setMsg("账号不存在");
            return returnVO;
        }
        if (user.getEmail() != null && !user.getEmail().trim().isEmpty()) {
            // 已有邮箱时允许更新（格式/唯一校验）
        }
        String emailErr = validateEmailForSave(email, userId);
        if (emailErr != null) {
            returnVO.setMsg(emailErr);
            return returnVO;
        }
        UserInfoEntity patch = new UserInfoEntity();
        patch.setUserId(userId);
        patch.setEmail(EmailCodeService.normalizeEmail(email));
        if (!this.userInfoService.update(patch)) {
            returnVO.setMsg("保存失败");
            return returnVO;
        }
        returnVO.setCode(1);
        returnVO.setMsg("邮箱保存成功");
        return returnVO;
    }

    @PostMapping("logout")
    public ReturnVO logout(HttpSession session) {
        session.invalidate();
        ReturnVO returnVO = new ReturnVO();
        returnVO.setCode(1);
        returnVO.setMsg("退出成功");
        return returnVO;
    }

    private String validateEmailForSave(String email, Integer excludeUserId) {
        if (!EmailCodeService.isValidEmail(email)) {
            return "邮箱格式不正确";
        }
        String normalized = EmailCodeService.normalizeEmail(email);
        UserInfoEntity exist = this.userInfoService.queryByEmail(normalized);
        if (exist != null && (excludeUserId == null || !excludeUserId.equals(exist.getUserId()))) {
            return "该邮箱已被注册";
        }
        return null;
    }

    private static String maskEmail(String email) {
        int at = email.indexOf('@');
        if (at <= 1) {
            return "***" + email.substring(Math.max(at, 0));
        }
        return email.charAt(0) + "***" + email.substring(at);
    }

}
