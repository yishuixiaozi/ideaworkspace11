<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" type="text/css" href="css/register.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.js"></script>
    <script src="https://cdn.bootcss.com/jquery.form/4.2.1/jquery.form.js"></script>
    <script language="javaScript">
        function check()
        {
            var username = document.form1.username.value;
            var password = document.form1.password.value;
            var password1 = document.form1.password1.value;
            if (username==""|| password==""||password1=="")
            {
                alert("信息不能为空，请重新填写!");
                return false;
            }
            else if (password!=password1)
            {
                alert("2次密码输入不一致!");
                return false;
            }
            else{

                return true;
            }

        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            /*alert("看看这一步是否执行");*/
            $("#form1").ajaxForm(function (data) {
                /*alert(data);*/
                if (data.indexOf("wrong")>-1) {
                   alert("该用户名已被使用");
                }
                else if(data.indexOf("right")>-1){
                    alert("注册成功，请登录");
                   window.location.href = "/user/tiaozhuan.action?name=login";
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
<div class="inner">
    <!--<img src="../images/flower.jpg">-->
    <p></p>
    <form action="/user/insert.action" id="form1" name="form1" method="post" onsubmit="return check()">
        <input type="text" class="name_input" name="username" for="reservation" placeholder="注册邮箱/用户名">
        <input type="password" class="pass_input" name="password" for="reservation" placeholder="密码">
        <input type="password" class="pass_input" name="password1" for="reservation" placeholder="确认密码">
        <input type="submit" class="p_login" value="立即注册"/>
        <%--<p class="p_login">注册</p>--%>
        <!--<a href="#">免费注册</a>-->
    </form>
</div>
</body>
</html>