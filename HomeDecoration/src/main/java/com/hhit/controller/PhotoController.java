package com.hhit.controller;

import com.hhit.model.AdminPhoto;
import com.hhit.service.IUserService;
import com.hhit.service.PhotoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/photo")
public class PhotoController {

    @Resource
    private PhotoService photoService;

    AdminPhoto photo=new AdminPhoto();

    /**
     * 这里是测试图片集合从数据库查询的信息
     */
    @RequestMapping("/select")
    @ResponseBody
    public void selectphoto(){

        List<AdminPhoto> photolist=new ArrayList<AdminPhoto>();
        photolist=photoService.selectPhoto();
        int m=photolist.size();
        for (int i=0;i<m;i++){
            System.out.println("这里只是获取对象的url"+photolist.get(i).getPhotourl());
        }


    }


}


