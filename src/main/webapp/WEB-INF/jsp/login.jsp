<%--
  Created by IntelliJ IDEA.
  User: crossover0411
  Date: 2022-10-07
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>
    登录
    <form action="${pageContext.request.contextPath}/user/userLogin" method="post">
        用户Id：<input name="userId">
        密码：<input name="userPassword">
        <input type="submit" value="登录">
    </form>

    <table>
        <tr class="info">
            <td>
                <a class="btn btn-danger btn-xs" href="userRegister">注册新用户</a>
            </td>
        </tr>

    </table>
</body>
</html>
