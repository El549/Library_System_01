<%--
  Created by IntelliJ IDEA.
  User: crossover0411
  Date: 2022-10-08
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</html>
