<%--
  Created by IntelliJ IDEA.
  User: lhy
  Date: 2022/10/11
  Time: 09:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>addUser</title>
</head>
<body>
    添加页面
    <form action="${pageContext.request.contextPath}/manager/addUser_method" method="post">
        用户名:<input name="userName">
        密码:<input name="userPassword">
        <input type="submit" value="提交">
    </form>
</body>
</html>
