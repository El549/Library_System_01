<%--
  Created by IntelliJ IDEA.
  User: lhy
  Date: 2022/10/10
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>updateBook</title>
</head>
<body>
    修改页面
    <form action="${pageContext.request.contextPath}/manager/updateBook_method?bookId=${book.bookId}" method="post">
        封面url:<input name="bookCover" value="${book.bookCover}">
        书名:<input name="bookName" value="${book.bookName}">
        作者:<input name="author" value="${book.author}">
        出版社:<input name="press" value="${book.press}">
        类别:<input name="bookClass" value="${book.bookClass}">
        借还情况:<input name="bookStatus" value="${book.bookStatus}">
        <input type="submit" value="修改">
    </form>
</body>
</html>
