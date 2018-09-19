<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <link href="${pageContext.request.contextPath}/css/style.css" rel='stylesheet' type='text/css' />
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/icon-font.min.css" type='text/css' />
    <script src="${pageContext.request.contextPath}/js/Chart.js"></script>
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet" type="text/css" media="all">
    <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <link href='http://fonts.useso.com/css?family=Cabin:400,400italic,500,500italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
    <script src="js/jquery-1.10.2.min.js"></script>
</head>
<body class="sign-in-up">
<section>
    <div id="page-wrapper" class="sign-in-wrapper">
        <div class="graphs">
            <div class="sign-in-form">
                <div class="sign-in-form-top">
                    <p><span>Wel</span> <a href="#">Come</a></p>
                </div>
                <div class="signin">
                    <div class="signin-rit">
								<span class="checkbox1">
									<!--  <label class="checkbox"><input type="checkbox" name="checkbox" checked="">Forgot Password ?</label> -->
								</span>
                        <p><a href="${pageContext.request.contextPath}/toReg.do">注册</a> </p>
                        <div class="clearfix"> </div>
                    </div>
                    <form action="${pageContext.request.contextPath}/doLogin.do" method="post">
                        <div class="log-input">
                            <div class="log-input-left">
                                <input type="text" name="username" class="user" value="Yourname" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '请输入用户名';}"/>
                            </div>
                            <span class="checkbox2">
									 <label class="checkbox"><input type="checkbox" name="checkbox" checked=""></label>
								</span>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="log-input">
                            <div class="log-input-left">
                                <input type="password" name="password" class="lock" value="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '请输入密码';}"/>
                            </div>
                            <span class="checkbox2">
									 <label class="checkbox"><input type="checkbox" name="checkbox" checked=""></label>
								</span>
                            <div class="clearfix"> </div>
                        </div>
                        <input type="submit" value="Login to your account">
                    </form>
                </div>

            </div>
        </div>
    </div>
    <footer>
        <p>Copyright &copy; 2018 浮游渡海
        </p>
    </footer>
</section>

<script src="${pageContext.request.contextPath}/js/jquery.nicescroll.js"></script>
<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>
