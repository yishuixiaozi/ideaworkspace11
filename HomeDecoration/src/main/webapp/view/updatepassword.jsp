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
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="../css/matrix-style2.css" />
    <link rel="stylesheet" href="../css/matrix-media.css" />
    <link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
    <%--ajax传值测试结果--%>
    <script type="text/javascript">
         function updatepass() {
             /*alert("触发事件成功");*/
             if($("#password").val()!=$("#password2").val()){
                 alert("两次密码输入不等，请重新输入");
                 document.getElementById("password").value="";
                 document.getElementById("password2").value="";
             }else{
                 $.ajax({
                     data:"password="+$("#password").val(),
                     type:"GET",
                     dataType:'json',
                     url:"user/updatepass.action",
                     error:function (data) {
                         alert(data["msg"]);
                     },
                     success:function(data){
                         alert(data["msg"]);//返回的data是一个map,所以data["msg"]是对象的值
                         /*window.location.href = "view/login.jsp";这个跳转后还是子页面*/
                         /*top.loaction.href的跳转是跳出子页面成为最外层页面*/
                         top.location.href = "view/login.jsp"
                     }
                 });
             }
         }
    </script>
</head>

<body>
<div id="content">
    <div id="content-header">
        <h1>个人密码修改界面</h1>
    </div>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">
                <div class="widget-box">
                    <div class="widget-title"> <span class="icon"> <i class="icon-pencil"></i> </span>
                        <h5>密码修改 &amp; 认证</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <form id="form-wizard" class="form-horizontal" method="post">
                            <div id="form-wizard-1" class="step" action=“#”>
                                <div class="control-group">
                                    <label class="control-label">密码</label>
                                    <div class="controls">
                                        <input id="password" type="password" name="password" style="height: 30px"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">确认密码</label>
                                    <div class="controls">
                                        <input id="password2" type="password" name="password2" style="height: 30px"/>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <button type="button" class="btn btn-success" onclick="updatepass()">保存</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../js/jquery.min.js"></script>
<script src="../js/jquery.ui.custom.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.validate.js"></script>
<script src="../js/jquery.wizard.js"></script>
<script src="../js/matrix.js"></script>
<script src="../js/matrix.wizard.js"></script>
</body>
</html>