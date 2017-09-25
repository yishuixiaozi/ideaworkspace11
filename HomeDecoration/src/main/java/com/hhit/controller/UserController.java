package com.hhit.controller;

import com.hhit.model.AdminPhoto;
import com.hhit.model.User;
import com.hhit.service.IUserService;
import com.hhit.service.PhotoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.swing.*;
import javax.xml.crypto.Data;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/user")
public class UserController {

    User user=new User();
    User user2=new User();
    @Resource
    private IUserService userService;

    @Resource
    private PhotoService photoService;

    @RequestMapping("/insert11")
    public String insert1(String username,String password,String password1){
        User user=new User();
        user.setUsername(username);
        user.setPassword(password);
        user2=userService.selectUser(username);
        boolean s=empty1(user2);
        if(s==false){
            if(password.equals(password1))
            {
                userService.insertUser(user);
                String msg="注册成功，请登录";
                int type=JOptionPane.YES_NO_CANCEL_OPTION;
                String title="信息提示！";
                JOptionPane.showMessageDialog(null, msg,title,type);
                return "login";
            }
            else{
                String msg="确认密码不一致，重新zhuce";
                int type=JOptionPane.YES_NO_CANCEL_OPTION;
                String title="信息提示！";
                JOptionPane.showMessageDialog(null, msg,title,type);
                return "register";
            }
        }
        else{
            String msg="该用户名已存在，请重新注册";
            int type=JOptionPane.YES_NO_CANCEL_OPTION;
            String title="信息提示！";
            JOptionPane.showMessageDialog(null, msg,title,type);
            return "register";
        }
    }

    /**
     * 作用:对象控制判断
     * 用来判断返回对象是否为空，否则返回对象为空的话，页面会出错
     * @param obj
     * @return
     */
    public static boolean empty1(Object obj){
        if(obj==null){
            return false;
        }
        else{
            return true;
        }
    }

    /**
     * 这里是实现各种控制类的直接跳转，包括页面跳转都通过控制类实现
     * @param name
     * @return
     */
    @RequestMapping(value="/tiaozhuan")
    public String tiaozhuan(String name){

        if (name.equals("login")){
           return "login";
        }
        else if(name.equals("register")){
            return  "register";
        }
        else if(name.equals("admin")){
            return "admain";

        }
        else if(name.equals("putong")){
            return "pumain";
        }
        else{
            return null;
        }

    }

    /**
     * 用户登录
     * 这里是用户类，前台传递的两个值自动封装成为User对象，然后进行数据比较
     * 采用的是一步刷新来实现用户信息错误页面不跳转，用户信息正确判断用户身份进行跳转
     * @param user
     * @return
     */
    @RequestMapping("/login")
    public @ResponseBody String loginuser(User user){
        /*System.out.println("user中username的值"+user.getUsername());
        System.out.println("user中password的值"+user.getPassword());*/
        String msg ;
        if(user.getUsername()==""){
            msg="wrong";
        }
        else{
            user2=userService.selectUser(user.getUsername());
            boolean m=empty1(user2);
            if(m==false){//表示没有查到对象
                System.out.println("没有对象会打印这个");
                msg="wrong";
            }
            else{//查到对象了
                System.out.println("查询对象的密码"+user2.getPassword());
                System.out.println("查询对象的身份"+user2.getIdentity());
                if(user.getPassword().equals(user2.getPassword())){//密码对了
                    if(user2.getIdentity()==null){//判断是否为null
                        msg="putong";
                    }
                    else{//不为空判断是否为管理员或者普通员工
                        if(user2.getIdentity().equals("admin")){
                            msg="admin";
                        }
                        else{
                            msg="putong";
                        }
                    }
                }
                else{//密码不对
                    msg="wrong";
                }
            }
        }

        return msg;
    }

    /**
     * 用户注册，附加用户名重复判断，页面自行检测为空或者密码重复
     * @param user
     * @return
     */
    @RequestMapping("/insert")
    @ResponseBody
    public String adduser(User user){
        String msg;
        System.out.println("111111111"+user.getUsername());
        System.out.println("222222222"+user.getPassword());
        user2=userService.selectUser(user.getUsername());
        boolean s=empty1(user2);
        if(s==false){
            userService.insertUser(user);
            msg="right";
        }else{
            msg="wrong";
        }
        return msg;
    }

    @RequestMapping("/ajax")
    @ResponseBody
    public  Map<String,Object> login(HttpServletRequest request,HttpServletResponse response) throws Exception{
        System.out.println(request.getParameter("name"));
        System.out.println("request.getParameter(name)"+request.getParameter("name"));
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("msg", "/media/flower.jpg");
        return map;
    }
    @RequestMapping("/ajax1")
    @ResponseBody
    public List<AdminPhoto> select(HttpServletRequest request,HttpServletResponse response){
        List<AdminPhoto> photolist=new ArrayList<AdminPhoto>();
        photolist=photoService.selectPhoto();
        int m=photolist.size();
        for(int i=0;i<m;i++){
            System.out.println(""+photolist.get(i).getPhotourl());
        }
        return photolist;
    }

    @RequestMapping("/searchall")
    public String select1(ModelMap modelMap){
        List<User> userlist;
        userlist=userService.searchUserAll();
        int m=userlist.size();
        for (int i=0;i<m;i++)
        {
            System.out.println("测试user列表"+userlist.get(i).getUsername()+"密码"+
            userlist.get(i).getPassword());
        }
        modelMap.addAttribute("userlist",userlist);
        return "ok";
    }

}
