<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
    <link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/modernizr.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/snowfall.jquery.js"></script>
    <script>
        $("body").snowfall();
        $("body,html").snowfall({image :"${pageContext.request.contextPath}/images/flake_black.png",minSize: 10, maxSize:32,flakeCount:28});
    </script>


</head>
<body>
<div id="wrapper">
    <header>
        <div class="headtop"></div>
        <div class="contenttop">
            <div class="logo f_l" style="font-family:'方正舒体';">浮游渡海<br/><br/>
                <span style="font-size: 16px;color:#666;font-family:'方正姚体'; line-height: 20px;">
                &nbsp;&nbsp;&nbsp;&nbsp;春苔兮 何以无根而生 无果而去;秋风兮 忍看相逢即别离;<br>
                短歌叙 过眼岁岁年年如朝夕;聚散后 故地烟云又起 刹那因缘会际</span>
            </div>

            <div class="search f_r">
                <form action="/e/search/index.php" method="post" name="searchform" id="searchform">
                    <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字" style="color: rgb(153, 153, 153);" onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='请输入关键字'}" type="text">
                    <input name="show" value="title" type="hidden">
                    <input name="tempid" value="1" type="hidden">
                    <input name="tbname" value="news" type="hidden">
                    <input name="Submit" class="input_submit" value="搜索" type="submit">
                </form>
            </div>
            <div class="blank"></div>
            <nav>
                <div  class="navigation">
                    <ul class="menu">
                        <li><a href="index.html">网站首页</a></li>
                        <li><a href="#">关于我</a>
                            <ul>
                                <li><a href="about.html">个人简介</a></li>
                                <li><a href="listpic.html">个人相册</a></li>
                            </ul>
                        </li>
                        <li><a href="#">我的日记</a>
                            <ul>
                                <li><a href="newslistpic.html">个人日记</a></li>
                                <li><a href="newslistpic.html">学习笔记</a></li>
                            </ul>
                        </li>
                        <li><a href="newslistpic.html">技术文章</a> </li>
                        <li><a href="#">给我留言</a> </li>
                    </ul>
                </div>
            </nav>
            <SCRIPT type=text/javascript>
                // Navigation Menu
                $(function() {
                    $(".menu ul").css({display: "none"}); // Opera Fix
                    $(".menu li").hover(function(){
                        $(this).find('ul:first').css({visibility: "visible",display: "none"}).slideDown("normal");
                    },function(){
                        $(this).find('ul:first').css({visibility: "hidden"});
                    });
                });
            </SCRIPT>
        </div>
    </header>
    <div class="jztop"></div>
