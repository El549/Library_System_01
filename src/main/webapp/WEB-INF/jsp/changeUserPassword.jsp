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

<%--<form action="updateBook?id=${user.userId}" method="post">--%>
<%--    用户名：<input name="bname" value="${user.userName}">--%>
<%--    新密码：<input name="author"  value="${user.userPassword}">--%>
<%--    <input type="submit" value="修改">--%>
<%--</form>--%>
</body>
</html>
