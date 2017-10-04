package com.hhit.service.impl;

import com.hhit.dao.UserDao;
import com.hhit.model.User;
import com.hhit.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service(value = "userService")
public class UserServiceImpl implements IUserService{


    @Resource
    UserDao userDao;

    @Override
    public List<User> searchUserAll() {
        return userDao.searchUserAll();
    }
    public User selectUser(String username) {
        return userDao.selectUser(username);
        /*return null;*/
    }
    public void insertUser(User user){
        userDao.insertUser(user);

    }
    public void updatePass(User user){
        userDao.updatePass(user);
    }
}
