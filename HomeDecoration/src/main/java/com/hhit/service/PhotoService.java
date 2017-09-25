package com.hhit.service;

import com.hhit.model.AdminPhoto;

import java.util.List;

public interface PhotoService {
    void insertPhoto(AdminPhoto photo);
    public List<AdminPhoto> selectPhoto();
}
