package com.dyh.doctor.service.serviceImpl;

import com.dyh.doctor.domain.UserInfoEntity;
import com.dyh.doctor.mapper.UserInfoMapper;
import com.dyh.doctor.service.UserInfoService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import java.util.*;

@Service
public class UserInfoServiceImpl implements UserInfoService {
    private static int PAGE_DEFAULT = 1;
    private static int SIZE_DEFAULT = 10;

    @Resource
    private UserInfoMapper userInfoMapper;

    public UserInfoEntity queryById(Integer userId){
        return this.userInfoMapper.queryById(userId);
    }

    public Page<UserInfoEntity> queryByPage(UserInfoEntity userInfo, Integer page, Integer size, String orderCol, String orderDirect){

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

        long total = this.userInfoMapper.count(userInfo);

        return new PageImpl<>(this.userInfoMapper.queryAllByLimit(userInfo, pageRequest), pageRequest, total);
    }

    public boolean insert(UserInfoEntity userInfo){
        return this.userInfoMapper.insert(userInfo) > 0;
    }

    public boolean update(UserInfoEntity userInfo){
        return this.userInfoMapper.update(userInfo) > 0;
    }

    public boolean deleteById(Integer userId){
        return this.userInfoMapper.deleteById(userId) > 0;
    }

    @Override
    public UserInfoEntity queryByUsername(String username) {
        return this.userInfoMapper.queryByUsername(username);
    }

    @Override
    public UserInfoEntity queryByEmail(String email) {
        return this.userInfoMapper.queryByEmail(email);
    }

    @Override
    public UserInfoEntity queryByLogin(String username, String password, Integer roleType) {
        return this.userInfoMapper.queryByLogin(username, password, roleType);
    }

}