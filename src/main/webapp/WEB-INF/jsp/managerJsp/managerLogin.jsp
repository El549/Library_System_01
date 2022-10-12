<%--
  Created by IntelliJ IDEA.
  User: Hao
  Date: 2022/10/8
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3.3.7/css/bootstrap.css">
</head>
<body>
    登录页面
    <form action="${pageContext.request.contextPath}/manager/mLogin" method="post">
        账号：<input name="managerId">
        密码：<input name="managerPassword">
        <input type="submit" value="登录">
    </form>

</table>

</body>
</html>
