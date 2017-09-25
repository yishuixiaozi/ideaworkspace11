package com.hhit.service.impl;

import com.hhit.dao.UserDao;
import com.hhit.model.AdminPhoto;
import com.hhit.service.PhotoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service(value = "photoService")
public class PhotoServiceImpl implements PhotoService{
    @Resource
    UserDao userDao;
    public void insertPhoto(AdminPhoto photo){
        userDao.insertPhoto(photo);
    }
    public List<AdminPhoto> selectPhoto(){
        return userDao.selectPhoto();
    }
}

