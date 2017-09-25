package com.hhit.service;

import com.hhit.model.*;

import java.util.List;

public interface IUserService {
    User selectUser(String username);
    void insertUser(User user);
    List<User> searchUserAll();

}

