<%--
  Created by IntelliJ IDEA.
  User: Hao
  Date: 2022/10/11
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理图书</title>
</head>
<body>
      <form action="foundBook_method" method="post">
        书名:<input name="bookName">
        作者:<input name="author">
        出版社:<input name="press">
        书籍类别:<input name="bookClass">
        书籍状态:<input name="bookStatus">
        <input type="submit" value="搜索">
      </form>
</body>
</html>
