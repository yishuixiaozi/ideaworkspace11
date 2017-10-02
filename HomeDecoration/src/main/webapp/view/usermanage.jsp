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
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="css/uniform.css" />
    <link rel="stylesheet" href="css/select2.css" />
    <link rel="stylesheet" href="css/matrix-style2.css" />
    <link rel="stylesheet" href="css/matrix-media.css" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>

<body>
<div id="content">
    <div id="content-header">
        <h1>表格</h1>
    </div>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">
                <div class="widget-box">
                    <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
                        <h5>用户信息显示</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <table class="table table-bordered data-table">
                            <thead>
                            <tr>
                                <th>字段1</th>
                                <th>字段2</th>
                                <th>字段3</th>
                                <th>字段4</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="gradeX">
                                <td>王四</td>
                                <td>Internet
                                    Explorer 4.0</td>
                                <td>Win 95+</td>
                                <td class="center">4</td>
                            </tr>
                            <tr class="gradeC">
                                <td>李四</td>
                                <td>Internet
                                    Explorer 5.0</td>
                                <td>Win 95+</td>
                                <td class="center">5</td>
                            </tr>
                            <tr class="gradeA">
                                <td>张三</td>
                                <td>Internet
                                    Explorer 5.5</td>
                                <td>Win 95+</td>
                                <td class="center">5.5</td>
                            </tr>
                            <tr class="gradeA">
                                <td>小周</td>
                                <td>3</td>
                                <td>Win 98+</td>
                                <td class="center">6</td>
                            </tr>
                            <tr class="gradeA">
                                <td>未庄</td>
                                <td>5</td>
                                <td>Win XP SP2+</td>
                                <td class="center">7</td>
                            </tr>
                            <tr class="gradeA">
                                <td>格里</td>
                                <td>7</td>
                                <td>Win XP</td>
                                <td class="center">6</td>
                            </tr>
                            <tr class="gradeA">
                                <td>张翰</td>
                                <td>9</td>
                                <td>Win 98+ / OSX.2+</td>
                                <td class="center">1.7</td>
                            </tr>



                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/jquery.ui.custom.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.uniform.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/matrix.js"></script>
<script src="js/matrix.tables.js"></script>
</body>
</html>