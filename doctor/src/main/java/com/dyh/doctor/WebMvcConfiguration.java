package com.dyh.doctor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {

    @Autowired
    private AdminAuthInterceptor adminAuthInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(adminAuthInterceptor)
                .addPathPatterns(
                        "/userInfo/add", "/userInfo/edit", "/userInfo/deleteById/**",
                        "/deptInfo/add", "/deptInfo/edit", "/deptInfo/deleteById/**",
                        "/doctorInfo/add", "/doctorInfo/edit", "/doctorInfo/deleteById/**",
                        "/patientInfo/deleteById/**",
                        "/medicineInfo/add", "/medicineInfo/edit", "/medicineInfo/deleteById/**",
                        "/feeInfo/deleteById/**",
                        "/messageInfo/deleteById/**",
                        "/consultInfo/deleteById/**",
                        "/checkInfo/queryByPage", "/checkInfo/queryById/**", "/checkInfo/add", "/checkInfo/edit", "/checkInfo/deleteById/**",
                        "/recordInfo/queryById/**", "/recordInfo/deleteById/**",
                        "/registerInfo/queryById/**", "/registerInfo/deleteById/**",
                        "/presDetailInfo/queryById/**", "/presDetailInfo/edit"
                );
    }
}