<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功</title>
</head>
<body>
注册成功
<br>
<tr>
    你的用户Id是：${user.userId}
</tr>
<br>
<tr>
    <a class="btn btn-danger btn-xs" href="${pageContext.request.contextPath}/user/login">登录</a>
</tr>
</body>
</html>
