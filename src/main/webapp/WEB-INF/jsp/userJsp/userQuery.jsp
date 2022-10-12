<%--
  Created by IntelliJ IDEA.
  User: crossover0411
  Date: 2022-10-08
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <%--假退出--%>
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
</body>
</html>
