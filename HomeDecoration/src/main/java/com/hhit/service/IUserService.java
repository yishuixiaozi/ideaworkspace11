package com.hhit.service;

import com.hhit.model.*;

import java.util.List;

/**
 * 这里是接口的集中，定义的方法
 * 通过实现了类进行实现
 * 定义接口后编写实现类
 */
public interface IUserService {
    User selectUser(String username);//用户查询
    void insertUser(User user);//用户注册
    List<User> searchUserAll();//集合查询
    void updatePass(User user);//密码修改


}

