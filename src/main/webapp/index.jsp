<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>欢迎访问图书管理系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/mycss/login.css">
<body>
<div id="box">
    <div id="mask">
        <div class="login-box">

            <h4>用户登录</h4>
            <div class="">
                <form action="${pageContext.request.contextPath}/manager/mLogin" method="post" class="input-box">
                    <div class="input-text">
                        <span class="login-login"><img src="static/img/用户黑1.svg"
                                                       style="width: 25px;height: 25px;"></span>
                        <input type="text" placeholder="用户名" name="managerId">
                    </div>
                    <div class="input-text">
                        <span class="login-passwd"><img src="static/img/密码.svg"
                                                        style="width: 25px;height: 25px;"></span>
                        <input type="password" placeholder="密码" name="managerPassword">
                    </div>
                    <input type="submit" value="登录" class="button">
                    <div class="signup">
                        还没有账户？<a href="#">注册</a>
                    </div>
                </form>
            </div>
            <div id="changeBox">
                <div id="button-changeManagerType">
                    <a href="${pageContext.request.contextPath}/manager/managerLogin">管理员登录</a>
                </div>
                <div id="button-changeUserType">
                    <a href="#">用户登录</a>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>