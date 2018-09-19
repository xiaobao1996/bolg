<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head>
    <meta charset="utf-8">
    <title>admin</title>

    <meta name="description" content="Dashboard">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--Basic Styles-->
    <link href="${pageContext.request.contextPath}/style/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/weather-icons.css" rel="stylesheet">

    <!--Beyond styles-->
    <link id="beyond-link" href="${pageContext.request.contextPath}/style/beyond.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/style/demo.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/typicons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/style/animate.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ueditor/themes/default/css/ueditor.css">
</head>
<body>
<!-- 头部 -->
<div class="navbar">
    <div class="navbar-inner">
        <div class="navbar-container">
            <!-- Navbar Barnd -->
            <div class="navbar-header pull-left">
                <a href="#" class="navbar-brand">
                    <small style="font-size:24px;line-height: 45px;font-weight: bold;font-family: '方正舒体';padding-left: 30px;">
                        浮游渡海
                    </small>
                </a>
            </div>
            <!-- /Navbar Barnd -->
            <!-- Sidebar Collapse -->
            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="collapse-icon fa fa-bars"></i>
            </div>
            <!-- /Sidebar Collapse -->
            <!-- Account Area and Settings -->
            <div class="navbar-header pull-right">
                <div class="navbar-account">
                    <ul class="account-area">
                        <li>
                            <a class="login-area dropdown-toggle" data-toggle="dropdown">
                                <div class="avatar" title="View your public profile">
                                    <img src="${USER.img}" width="120px" style="border-radius: 50%">
                                </div>
                                <section>
                                    <h2><span class="profile"><span>${USER.username}</span></span></h2>
                                </section>
                            </a>
                            <!--Login Area Dropdown-->
                            <ul class="pull-right dropdown-menu dropdown-arrow dropdown-login-area">
                                <li class="dropdown-footer" style="text-align: center">
                                    <a href="${pageContext.request.contextPath}/logout.do">
                                        退出登录
                                    </a>
                                </li>
                                <li class="dropdown-footer" style="text-align: center">
                                    <a href="${pageContext.request.contextPath}/toEdit.do">
                                        修改信息
                                    </a>
                                </li>
                            </ul>

                        </li>

                    </ul>
                </div>
            </div>

        </div>
    </div>
</div>