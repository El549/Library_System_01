<%--
  Created by IntelliJ IDEA.
  User: lhy
  Date: 2022/10/11
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>updateUser</title>
</head>
<body>
    修改页面
    <form action="updateUser_method?userId=${user.userId}" method="post">
        用户名:<input name="userName" value="${user.userName}">
        密码:<input name="userPassword" value="${user.userPassword}">
        <input type="submit" value="修改">
    </form>
</body>
</html>
