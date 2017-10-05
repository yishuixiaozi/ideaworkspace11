<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>装修平台</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" type="text/css" href="../css/login.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.js"></script>
    <script src="https://cdn.bootcss.com/jquery.form/4.2.1/jquery.form.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#loginform1").ajaxForm(function (data) {
                if (-1 < data.indexOf("admin")) {
                    window.location.href = "/user/tiaozhuan.action?name=admin";
                }
                else{
                    alert("用户名或密码错误！");
                }
                $("#loginform1").resetForm();
            })
        })
    </script>

</head>

<body>
<div class="header">
    <div class="inner_c">
        <div class="header_left">Design By Zhou</div>
        <div class="header_right">
            <div class="hri_left">
                <ul>
                    <li>登录&nbsp;&nbsp;&nbsp;&nbsp;|</li>
                    <li>注册&nbsp;&nbsp;&nbsp;&nbsp;|</li>
                    <li>公司合作&nbsp;&nbsp;|</li>
                </ul>
            </div>
            <div class="hri_right">咨询热线：1845-1111-598</div>
        </div>
    </div>
</div>
<div class="body_top">
    <div class="inner_body">
        <p><img src="../images/flower.jpg"/></p>
        <p class="p_id1">Hello&nbsp;&nbsp;&nbsp;&nbsp;welcome!</p>
    </div>
</div>
<div class="body_center">
    <div class="inner_body2">
        <div class="bc_left">
            <img src="../images/jiaju.jpg">
        </div>
        <div class="bc_right">
            <p></p>
            <form action="/user/login.action" id="loginform1" method="post">
                <input type="text" class="name_input" name="username" for="reservation" placeholder="注册邮箱/用户名">
                <input type="password" class="pass_input" name="password" for="reservation" placeholder="密码">
                <input type="submit" class="p_login" value="立即登录"/>
                <%--<p class="p_login">立即登录</p>--%>
                <a href="/user/tiaozhuan.action?name=register">免费注册</a>
            </form>
        </div>
    </div>
</div>
<div class="bottom">
    <div class="inner_bottom">
        <div class="bottom1">
            <p class="p_l">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright &copy;
                2004-2014&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;装修装饰（Decorating &nbsp;&nbsp;Houses）
                &nbsp;&nbsp;&nbsp;&nbsp;粤ICP
                备05062536号 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                增值电信业务经营许可证：&nbsp;&nbsp;粤B2-20110513</p>
            <p class="p_r"><img src="../images/govIcon.gif" alt=""></p>
            <!--<p>免责声明：本网站设计用于理论学习</p>-->
        </div>
    </div>
</div>
</body>
</html>