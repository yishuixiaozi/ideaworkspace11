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
import javax.servlet.http.HttpSession;
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
        else if(name.equals("updatepassword")){
            return "updatepassword";
        }
        else{
            return null;
        }

    }

    /**
     * 用户登录
     * @param user
     * @return
     */
    @RequestMapping("/login")
    public @ResponseBody String loginuser(User user,HttpServletRequest request){
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
                System.out.println("查询对象的身份"+user2.getIdentity());
                //这里是添加session，用于后台系统识别用户所用
                HttpSession session=request.getSession();
                session.setAttribute("username",user2.getUsername());//设置username的值，由页面进行获取
                session.setAttribute("identity",user2.getIdentity());
                if(user.getPassword().equals(user2.getPassword())){//密码对了
                    msg="admin";
                }
                else{//用户信息错误
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

    /**
     * 页面显示从数据库获取的地址然后显示图片
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/ajax")
    @ResponseBody
    public  Map<String,Object> login(HttpServletRequest request,HttpServletResponse response) throws Exception{
        System.out.println(request.getParameter("name"));
        System.out.println("request.getParameter(name)"+request.getParameter("name"));
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("msg", "/media/flower.jpg");
        return map;
    }

    /**
     * 这个应该是获取数据库中排序后前几条数据后的显示图
     * @param request
     * @param response
     * @return
     */
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

    /**
     * 查询所有的用户的信息的集合并且在页面显示
     * @param modelMap
     * @return
     */
    @RequestMapping("/searchall")
    public String select1(ModelMap modelMap){
        List<User> userlist;
        userlist=userService.searchUserAll();
        /*int m=userlist.size(); 查看数据库获取的用户集合是否正确的查到了*/
        /*for (int i=0;i<m;i++)
        {
            System.out.println("测试user列表"+userlist.get(i).getUsername()+"密码"+
            userlist.get(i).getPassword());
        }*/
        modelMap.addAttribute("userlist",userlist);
        return "usermanage";
    }

    /**
     * 获取登录界面的时候放在session中的个人用户名的信息
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/updatepass")
    @ResponseBody
    public Map<String,Object> updatepass(HttpServletRequest request,HttpServletResponse response) throws Exception{
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");//session中以对象形式存储，需要转换
        user2.setUsername(username);
        user2.setPassword(request.getParameter("password"));
        Map<String,Object> map=new HashMap<String, Object>();
        if(request.getParameter("password")==null){
            map.put("msg","修改信息失败,请重新修改");
        }
        else{
            userService.updatePass(user2);
            map.put("msg","密码修改成功，请重新登录");
        }
        return  map;
    }

}
