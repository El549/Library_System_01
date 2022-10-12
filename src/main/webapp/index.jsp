<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>Hello World!</h2>

<a href="${pageContext.request.contextPath}/user/login">用户登录</a>

<a href="${pageContext.request.contextPath}/manager/managerLogin">管理员登录</a>

<a href="${pageContext.request.contextPath}/index.jsp">借阅系统首页</a>

<br/><br/>以下仅用于管理员测试<br/>
<a href="${pageContext.request.contextPath}/user/userQuery">用户主页</a>
<br/>
<a href="${pageContext.request.contextPath}/manager/managerInfo">管理员主页</a>
</body>
</html>