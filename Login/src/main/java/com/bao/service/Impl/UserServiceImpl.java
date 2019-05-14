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
    public List<User> queryUser() {
        return userMapper.queryUser();
    }

    @Override
    public User queryUserByName(String name) {
        return userMapper.queryUserByUsername(name);
    }

    @Override
    public String queryPassByUsername(String name) {
        return userMapper.queryPassByUsername(name);
    }

   
    
    @Override
    public void addUser(User user) {
        userMapper.addUser(user);
    }

    @Override
    public void updatePassByUsername(User user) {
        userMapper.updatePassByUsername(user);
    }

    @Override
    public void updateUserByUser(User user) {
        userMapper.updateUserByUser(user);
    }
    @Override
    public void deleteUser(User user){
        userMapper.deleteUser(user);
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
