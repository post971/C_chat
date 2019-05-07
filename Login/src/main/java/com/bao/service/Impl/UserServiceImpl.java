package com.bao.service.Impl;


import com.bao.entity.Uau;
import com.bao.entity.User;
import com.bao.mapper.UserMapper;
import com.bao.service.IUserService;

import java.util.List;


public class UserServiceImpl  implements IUserService {
    UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public User queryUserByName(String name) {
        return userMapper.queryUserByUsername(name);
    }

    public String queryPassByUsername(String name) {
        return userMapper.queryPassByUsername(name);
    }

    @Override
    public void addUser(User user) {
        userMapper.addUser(user);
    }

    @Override
    public void updataPassByUsername(User user) {
        userMapper.updataPassByUsername(user);
    }

    @Override
    public void addUau(Uau uau) {
        userMapper.addUau(uau);
    }

    @Override
    public List<Uau> queryUauByTouser(String touser) {
        return  userMapper.queryUauByTouser(touser);
    }

    @Override
    public void deleteUauaByUau(Uau uau) {
        userMapper.deleteUauaByUau(uau);
    }


}
