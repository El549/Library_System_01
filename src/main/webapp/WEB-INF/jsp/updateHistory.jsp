<%--
  Created by IntelliJ IDEA.
  User: lhy
  Date: 2022/10/11
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <title>updateHistory</title>
</head>
<body>
    修改页面
    <form action="updateHistory_method?historyId=${history.historyId}" method="post">
        Book_ID:<input name="bookId" value="${history.bookId}">
        User_ID:<input name="UserId" value="${history.userId}">
        借出时间:<input name="borrowedTime" value='<fmt:formatDate value="${history.borrowedTime}" pattern="yyyy-MM-dd HH:mm:ss"/>'>
        返还时间:<input name="returnedTime" value='<fmt:formatDate value="${history.returnedTime}" pattern="yyyy-MM-dd HH:mm:ss"/>'>
        <input type="submit" value="修改">
    </form>
</body>
</html>
