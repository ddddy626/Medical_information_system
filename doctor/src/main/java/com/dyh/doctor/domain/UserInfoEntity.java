package com.dyh.doctor.domain;

import java.io.Serializable;
import java.util.*;
import lombok.Data;

@Data
public class UserInfoEntity{
    private Integer userId;// primary key 
    private String username;
    private String password;
    private String realName;
    private String phone;
    private String email;
    private Integer roleType;
    private Integer status;
    private String createTime;
    /** 登录时提交的邮箱验证码（非库字段） */
    private String emailCode;
}