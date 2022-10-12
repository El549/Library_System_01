<%--
  Created by IntelliJ IDEA.
  User: lhy
  Date: 2022/10/10
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>addBook</title>
</head>
<body>
    添加页面
    <form action="${pageContext.request.contextPath}/manager/addBook_method" method="post">
        封面url:<input name="bookCover">
        书名:<input name="bookName">
        作者:<input name="author">
        出版社:<input name="press">
        类别:<input name="bookClass">
        借还情况:<input name="bookStatus">
        <input type="submit" value="提交">
    </form>
    <a href="${pageContext.request.contextPath}/manager/managerInfo">管理员主页</a>
    <a href="${pageContext.request.contextPath}/index.jsp">借阅系统首页</a>
</body>
</html>
