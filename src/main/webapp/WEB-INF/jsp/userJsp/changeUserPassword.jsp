<%--
  Created by IntelliJ IDEA.
  User: crossover0411
  Date: 2022-10-08
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户密码</title>
</head>
<body>
    修改密码
    <form action="changeUserPasswordSucces?userId=${user.userId}" method="post">
        用户名：<input name="userName" value="${user.userName}">
        新密码：<input name="userPassword" value="${user.userPassword}">
        <input type="submit" value="修改">
    </form>
    <a href="${pageContext.request.contextPath}/user/userQuery">用户主页</a>
    <a href="${pageContext.request.contextPath}/index.jsp">借阅系统首页</a>
</body>
</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.cn/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.cn/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
</head>
<body style="padding-top: 70px">
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <%--<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>--%>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/user/userQuery">图书借阅系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">用户ID：${sessionScope.user.userId} 用户名：${sessionScope.user.userName}</a></li>
                <li class="disabled"><a href="javascript:return false;">修改密码</a></li>
                <li><a href="deleteUser?userId=${sessionScope.user.userId}">用户注销</a></li>
                <%--<li><a href="#">Settings</a></li>
                <li><a href="#">Profile</a></li>--%>
                <li><a href="${pageContext.request.contextPath}/user/userLogout">退出登录</a></li>
            </ul>
            <%--搜索框--%>
            <%--<form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>--%>
        </div>
    </div>
</nav>

    <div class="container" style="width: 300px">

        <form class="form-signin" action="changeUserPasswordSucces?userId=${user.userId}" method="post">
            <h3 class="form-signin-heading">修改用户名或密码</h3>

            <div class="input-group" style="margin-bottom: 10px">
                <span class="input-group-addon">用户名</span>
                <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1" name="userName" value="${user.userName}">
            </div>

            <div class="input-group" style="margin-bottom: 10px">
                <span class="input-group-addon">新密码</span>
                <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1" name="userPassword" value="${user.userPassword}">
            </div>

            <%--<span class="input-group-addon" id="basic-addon">@</span>
            <input name="userName" class="form-control" placeholder="userName" value="${user.userName}">
            <span class="input-group-addon" id="basic-addon">@</span>
            <input name="userPassword" class="form-control" placeholder="userPassword" value="${user.userPassword}">--%>
            <button class="btn btn-lg btn-primary btn-block" type="submit">修改</button>
        </form>

    </div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.cn/npm/jquery@1.12.4/dist/jquery.min.js"
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
        crossorigin="anonymous"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>
</body>
</html>