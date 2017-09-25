package com.hhit.controller;

import java.io.File;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.hhit.model.AdminPhoto;
import com.hhit.service.IUserService;
import com.hhit.service.PhotoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/img")
public class UploadController {
    /**
     * 纯java实现文件上传
     * MultipartFile file这个就表示存储内容为二进制+文件名
     * ModelMap model表示的是一个存储空间用来存储信息到下一个文件
     * @param file
     * @param request
     * @param model
     * @return
     */
    /*@Resource
    private IUserService userService;*/
    @Resource
    private PhotoService photoService;

    AdminPhoto photo=new AdminPhoto();
    @RequestMapping("/upload")
    public String upload(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request,
                         ModelMap model) {
        System.out.println("file是(我认为应该是文件上传的名字)"+file);
        //file:org.springframework.web.multipart.commons.CommonsMultipartFile@69f77bae
        //	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"+"media";
        String path = request.getSession().getServletContext().getRealPath("media");
        //path:D:\ideaworkspace\HomeDecoration\target\HomeDecoration\media
        String fileName = file.getOriginalFilename();
        String suffix=fileName.substring(fileName.lastIndexOf(".") + 1);
        System.out.println("查看刚刚上传的后缀名"+suffix);
        System.out.println("看看获得的文件fileName的名称"+fileName);
        // String fileName = new Date().getTime()+".jpg";
        File targetFile = new File(path, fileName);
        //target:D:\ideaworkspace\HomeDecoration\target\HomeDecoration\media\flower.jpg
        System.out.println("看看targetFile是什么"+targetFile);
        if (!targetFile.exists()) {
            targetFile.mkdirs();//没有就表示创建文件
        }
        // 1将图片保存到上服务器系统中
        try {
            file.transferTo(targetFile);//将进制文件流输入到目标文件形成目标信息
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("fileUrl", request.getContextPath() + "/media/" + fileName);
        //2将相关路径信息拷贝到数据库，这里需要的是相对路径，不然服务器无法使用
        String fileurl=request.getContextPath() + "/media/" + fileName;
        //图片的路径信息保存

        photo.setPhotoname(fileName);
        photo.setPhotourl("/media/"+fileName);
        photoService.insertPhoto(photo);
        return "ok";
    }

}
