<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
</head>
<body>
<table>
    <tr calss="info">
        <a class="btn btn-danger btn-xs" href="${pageContext.request.contextPath}/user/userQuery">回到用户首页</a>
    </tr>
    <br>
    <tr class="info">
        <td>
            <a class="btn btn-danger btn-xs" href="showUser?userId=${sessionScope.user.userId}">修改密码</a>
            <br>
            <a class="btn btn-danger btn-xs" href="deleteUser?userId=${sessionScope.user.userId}">注销</a>
        </td>
    </tr>
</table>
</body>
</html>
