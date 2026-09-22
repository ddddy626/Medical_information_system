package com.dyh.doctor.mapper;

import com.dyh.doctor.domain.UserInfoEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.*;

public interface UserInfoMapper{

    UserInfoEntity queryById(Integer userId);

    public List<UserInfoEntity> queryAllByLimit(@Param("userInfo") UserInfoEntity userInfo, @Param("pageable") Pageable pageable);

    long count(@Param("userInfo") UserInfoEntity userInfo);

    int insert(UserInfoEntity userInfo);

    int update(UserInfoEntity userInfo);

    int deleteById(Integer userId);

    UserInfoEntity queryByUsername(@Param("username") String username);

    UserInfoEntity queryByEmail(@Param("email") String email);

    UserInfoEntity queryByLogin(@Param("username") String username, @Param("password") String password, @Param("roleType") Integer roleType);

}