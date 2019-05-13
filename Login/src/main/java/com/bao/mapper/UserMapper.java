package com.bao.mapper;

import com.bao.entity.Uau;
import com.bao.entity.User;

import java.util.List;

public interface UserMapper {
    List<User> queryUser();
    User queryUserByUsername(String name);
    String queryPassByUsername(String name);
    void addUser(User user);
    void updatePassByUsername(User user);
    void updateUserByUser(User user);
    void deleteUser(User user);
    
    /*非user操作*/
    void addUau(Uau uau);
    List<Uau> queryUauByTouser(String touser);
    void deleteUauaByUau(Uau uau);
}
