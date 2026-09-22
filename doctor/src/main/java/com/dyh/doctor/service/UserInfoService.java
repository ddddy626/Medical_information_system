package com.dyh.doctor.service;

import com.dyh.doctor.domain.UserInfoEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.*;

public interface UserInfoService {
    UserInfoEntity queryById(Integer userId);

    Page<UserInfoEntity> queryByPage(UserInfoEntity userInfo, Integer page, Integer size, String orderCol, String orderDirect);

    boolean insert(UserInfoEntity userInfo);

    boolean update(UserInfoEntity userInfo);

    boolean deleteById(Integer userId);

    UserInfoEntity queryByUsername(String username);

    UserInfoEntity queryByEmail(String email);

    UserInfoEntity queryByLogin(String username, String password, Integer roleType);

}