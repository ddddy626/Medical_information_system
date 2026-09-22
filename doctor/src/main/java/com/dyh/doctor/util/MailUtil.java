package com.dyh.doctor.util;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * QQ 邮箱 SMTP 发送封装。失败不抛出，避免阻塞主流程。
 */
@Component
public class MailUtil {
    private static final Logger log = Logger.getLogger(MailUtil.class);

    @Autowired(required = false)
    private JavaMailSender mailSender;

    @Value("${spring.mail.username:}")
    private String from;

    @PostConstruct
    public void logMailReady() {
        if (mailSender == null) {
            log.warn("JavaMailSender missing: login email codes cannot be delivered");
        } else {
            log.info("JavaMailSender ready, from=" + from);
        }
    }

    /**
     * 挂号/缴费/就诊提醒等通知：异步发送，失败只记日志。
     */
    @Async
    public void send(String to, String subject, String content) {
        sendSync(to, subject, content);
    }

    /**
     * 登录验证码等需要立刻知道结果的场景：同步发送。
     * @return true 已投递到 SMTP
     */
    public boolean sendSync(String to, String subject, String content) {
        return sendAndGetError(to, subject, content) == null;
    }

    /** @return null 表示成功，否则为失败原因 */
    public String sendAndGetError(String to, String subject, String content) {
        if (to == null || to.trim().isEmpty()) {
            return "收件人为空";
        }
        if (mailSender == null) {
            log.warn("JavaMailSender not configured, skip mail to=" + to);
            return "邮件服务未启动，请检查 spring.mail 配置与 JASYPT_PWD";
        }
        if (from == null || from.trim().isEmpty()) {
            return "发件邮箱未配置";
        }
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setFrom(new InternetAddress(from.trim(), "智慧门诊系统", "UTF-8"));
            helper.setTo(to.trim());
            helper.setSubject(subject);
            helper.setText(content, true);
            mailSender.send(message);
            log.info("Mail sent to=" + to + ", subject=" + subject);
            return null;
        } catch (Exception e) {
            log.warn("Mail send failed to=" + to, e);
            String msg = e.getMessage();
            if (e.getCause() != null && e.getCause().getMessage() != null) {
                msg = e.getCause().getMessage();
            }
            return msg == null ? e.getClass().getSimpleName() : msg;
        }
    }
}
