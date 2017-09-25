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
    <script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

</head>

<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div class="navbar">
                <div class="navbar-inner">
                    <div class="container-fluid">
                        <a class="brand" href="#">Design By Zhou</a>
                        <div class="nav-collapse collapse navbar-responsive-collapse">
                            <ul class="nav">
                                <li class="active">
                                    <a href="#">首页</a>
                                </li>
                                <li>
                                    <a href="/user/tiaozhuan.action?name=login">登录</a>
                              </li>
                                <li>
                                    <a href="/user/tiaozhuan.action?name=register">注册</a>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">更多</a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="#">下拉导航1</a>
                                        </li>
                                        <li>
                                            <a href="#">下拉导航2</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="nav pull-right">
                                <li>
                                    <a href="#">建议咨询</a>
                                </li>
                                <li>
                                    <a href="#">联系电话：1845-1111-598</a>
                                </li>
                                <li class="divider-vertical">
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>

            </div>
            <div class="carousel slide" id="carousel-867300">
                <ol class="carousel-indicators">
                    <li class="active" data-slide-to="0" data-target="#carousel-867300">
                    </li>
                    <li data-slide-to="1" data-target="#carousel-867300">
                    </li>
                    <li data-slide-to="2" data-target="#carousel-867300">
                    </li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img alt="" src="/media/changtu6.jpg" width="1480" height="400" />
                        <div class="carousel-caption">
                            <h4>
                                棒球
                            </h4>
                            <p>
                                棒球运动是一种以棒打球为主要特点，集体性、对抗性很强的球类运动项目，在美国、日本尤为盛行。
                            </p>
                        </div>
                    </div>
                    <div class="item">
                        <img alt="" src="/media/changtu6.jpg" width="1480" height="400"/>
                        <div class="carousel-caption">
                            <h4>
                                冲浪
                            </h4>
                            <p>
                                冲浪是以海浪为动力，利用自身的高超技巧和平衡能力，搏击海浪的一项运动。运动员站立在冲浪板上，或利用腹板、跪板、充气的橡皮垫、划艇、皮艇等驾驭海浪的一项水上运动。
                            </p>
                        </div>
                    </div>
                    <div class="item">
                        <img alt="" src="/media/changtu6.jpg" width="1480px" height="400px"/>
                        <div class="carousel-caption">
                            <h4>
                                自行车
                            </h4>
                            <p>
                                以自行车为工具比赛骑行速度的体育运动。1896年第一届奥林匹克运动会上被列为正式比赛项目。环法赛为最著名的世界自行车锦标赛。
                            </p>
                        </div>
                    </div>
                </div> <a data-slide="prev" href="#carousel-867300" class="left carousel-control">‹</a> <a data-slide="next" href="#carousel-867300" class="right carousel-control">›</a>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span4">
            <img alt="140x140" src="/media/logo.jpg" width="200px" height="200px" class="img-circle" />
            <h2>
                标题
            </h2>
            <p>
                本可视化布局程序在HTML5浏览器上运行更加完美, 能实现自动本地化保存, 即使关闭了网页, 下一次打开仍然能恢复上一次的操作.
            </p>
            <p>
                <a class="btn" href="#">查看更多 »</a>
            </p>
        </div>
        <div class="span4">
            <img alt="140x140" src="/media/logo.jpg" width="200px" height="200px" class="img-circle" />
            <h2>
                标题
            </h2>
            <p>
                本可视化布局程序在HTML5浏览器上运行更加完美, 能实现自动本地化保存, 即使关闭了网页, 下一次打开仍然能恢复上一次的操作.
            </p>
            <p>
                <a class="btn" href="#">查看更多 »</a>
            </p>
        </div>
        <div class="span4">
            <img alt="140x140" src="/media/logo.jpg" width="200px" height="200px" class="img-circle" />
            <h2>
                标题
            </h2>
            <p>
                本可视化布局程序在HTML5浏览器上运行更加完美, 能实现自动本地化保存, 即使关闭了网页, 下一次打开仍然能恢复上一次的操作.
            </p>
            <p>
                <a class="btn" href="#">查看更多 »</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>