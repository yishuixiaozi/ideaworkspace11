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
    <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
    <script src="https://cdn.bootcss.com/jquery.form/4.2.1/jquery.form.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
               /* alert("你确定执行ajax实验");*/
                    $.ajax({
                        /*data:"name="+$("#name").val(),*/
                        data:"name="+1,
                        type:"GET",
                        dataType: 'json',
                        url:"user/ajax1.action",
                        error:function(data){
                            alert("出错了！！:"+data.msg);
                        },
                        success:function(data){
                           /* alert(data);*/
                            /*alert("1");*/
                            /*alert(data[0].photourl);*/
//                            alert("success:"+data.msg);
//                            $("#img1").attr("src",data.msg);
                           /* alert(data.length);*/
                            for(var i=0;i<data.length;i++){
                                /*alert(data[i].photourl);*/
                                /*id='logo1' class='img-responsive center-block'*/
                                $("#sp1").append("<img src='"+data[i].photourl+"'/>");
                            }

                        }
                    });
            });
        </script>
</head>
<body>

   <a href="login.jsp">跳转到设计好的登录界面</a><br>
   <a href="/user/tiaozhuan.action?name=login">登录 跳转</a><br>
   <a href="/user/tiaozhuan.action?name=register">注册 跳转</a><br>

   用户登录测试
   <form action="/user/login.action" id="loginform1" method="post">
       <input type="text" class="name1" name="username"/>
       <input type="password" name="password"/>
       <input type="submit" class="sub" value="提交">
   </form>
   <form name="itemForm"  target="_self" id="itemForm" method="post"
         action="/img/upload.action" enctype="multipart/form-data"  >
   <input type="file" name="file" class="text1" size="40" maxlength="40"/>
   <input type="submit" value="上传"></form>
   图片测试成功
   <img id="img1" src="" width="40px"
    height="40px"/>

   ajax数据传递测试
   <%--<input type="text" name="name" id="name"/>
   <input type="button" id="butn" value="登录"/>--%>
   <a href="/photo/select.action">点击查询所有的图片信息</a>
   <div id="sp1" >
       <!-- <img src="img/39932159_p0.jpg" id="logo1" class="img-responsive center-block"/> -->
       <%--<video src="" height="500" controls preload="metadata"></video>--%>
   </div>
</body>

</html>