package com.hhit.dao;

import com.hhit.model.*;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository(value = "iUserDao")
public interface UserDao {
    User selectUser(String username);//查询单个用户
    void insertUser(User user);//用户添加
    void insertPhoto(AdminPhoto photo);//图片上传
    List<AdminPhoto> selectPhoto();//图片集合查询
    List<User> searchUserAll();//用户集合查询
    void updatePass(User user);//密码修改
}
