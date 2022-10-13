<%--
  Created by IntelliJ IDEA.
  User: crossover0411
  Date: 2022-10-08
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户首页</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3.3.7/css/bootstrap.css">
<body>
<table>
    <tr class="info">
        <td>
            <a class="btn btn-warning btn-xs" href="${pageContext.request.contextPath}/user/userInfo">个人信息</a>
            &lt;%&ndash;假退出&ndash;%&gt;
            <a class="btn btn-danger btn-xs" href="${pageContext.request.contextPath}/user/login">退出登录</a>
        </td>
    </tr>
</table>
<table>
    <tr class="info">
        <td><a class="btn btn-warning btn-xs" href="${pageContext.request.contextPath}/user/bookList?userId=${user.userId}">图书查询</a></td>
    </tr>
</table>
<table>
    <tr class="info">
        <td><a class="btn btn-warning btn-xs" href="${pageContext.request.contextPath}/user/showBorrowedBook?userId=${user.userId}">借阅信息</a></td>
    </tr>
</table>
<table>
    <tr class="info">
        <td><a href="${pageContext.request.contextPath}/user/showHistorysByUserId?userId=${user.userId}">借书历史</a></td>
    </tr>
</table>
    <a href="${pageContext.request.contextPath}/index.jsp">借阅系统首页</a>
</body>
</html>--%>
<%--
  Created by IntelliJ IDEA.
  User: lhy
  Date: 2022/10/13
  Time: 09:54
  To change this template use File | Settings | File Templates.
--%>
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.cn/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.cn/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
</head>
<body style="padding-top: 70px">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/user/userQuery">用户首页</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">用户ID：${sessionScope.user.userId} 用户名：${sessionScope.user.userName}</a></li>
                    <li>
                        <a href="#" data-toggle="modal" data-target="#myModal" >修改密码</a>
                    </li>
                    <li><a href="deleteUser?userId=${sessionScope.user.userId}">用户注销</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/userLogout">退出登录</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <li><a href="${pageContext.request.contextPath}/user/bookList?userId=${user.userId}">图书查询</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/showBorrowedBook?userId=${user.userId}">借阅信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/showHistorysByUserId?userId=${user.userId}">借阅历史</a></li>
                </ul>
            </div>

            <div class="table-responsive container-fluid">
                <div class="jumbotron">
                    <div class="container">
                        <h1>欢迎使用图书借阅系统</h1>
                        <p>Welcome to the library lending system.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal"tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        修改用户信息
                    </h4>
                </div>
                <div class="modal-body">
                    <form action="changeUserPasswordSucces?userId=${sessionScope.user.userId}" method="post" id="changeUserInfo">
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">用户名</label>
                            <input type="text" class="form-control" id="recipient-name" name="userName" value="${sessionScope.user.userName}">
                        </div>
                        <div class="form-group">
                            <label for="recipient-password" class="col-form-label">用户密码</label>
                            <input type="password" class="form-control" id="recipient-password" name="userPassword" value="${sessionScope.user.userPassword}">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary" form="changeUserInfo">
                        提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.cn/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</body>
</html>