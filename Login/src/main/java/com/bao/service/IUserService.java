package com.bao.service;

import com.bao.entity.Uau;
import com.bao.entity.User;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IUserService {
    public List<User> queryUser();
    public User queryUserByName(String name);
    public String queryPassByUsername(String name);
    public void addUser(User user);
    public void updatePassByUsername(User user);
    public void updateUserByUser(User user);
    public void deleteUser(User user);

    public void addUau(Uau uau);
    public List<Uau> queryUauByTouser(String touser);
    public void deleteUauaByUau(Uau uau);
}
