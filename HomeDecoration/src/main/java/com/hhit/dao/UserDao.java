package com.hhit.dao;

import com.hhit.model.*;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository(value = "iUserDao")
public interface UserDao {
    User selectUser(String username);
    void insertUser(User user);
    void insertPhoto(AdminPhoto photo);
    List<AdminPhoto> selectPhoto();
    List<User> searchUserAll();
}
