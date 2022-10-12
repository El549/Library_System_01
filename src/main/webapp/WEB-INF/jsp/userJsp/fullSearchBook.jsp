<%--
  Created by IntelliJ IDEA.
  User: 24868
  Date: 2022/10/8
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <title>全查页面</title>
</head>
<body>
    <a href="${pageContext.request.contextPath}/user/userQuery">用户主页</a>
    <a href="${pageContext.request.contextPath}/index.jsp">借阅系统首页</a>
<form action="${pageContext.request.contextPath}/user/foundBook?userId=${user.userId}&book" method="post">
    书名:<input name="bookName">
    作者:<input name="author">
    出版社:<input name="press">
    书籍类别:<input name="bookClass">
    书籍状态:<input name="bookStatus">
    <input type="submit" value="搜索书籍">
</form>
<table>
    <tr class="info">
        <td>编号</td>
        <td>书名</td>
        <td>作者</td>
        <td>出版社</td>
        <td>书籍类别</td>
        <td>书籍状态</td>
        <td>操作</td>
    </tr>
    <%--var是循环体内的变量 items是谁被循环 varStatus是专门做编号的--%>
    <c:forEach var="book" items="${booklist}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td>${book.bookName}</td>
            <td>${book.author}</td>
            <td>${book.press}</td>
            <td>${book.bookClass}</td>
            <td>${book.bookStatus}</td>
           <%-- <td><fmt:formatDate value="${b.saletime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>--%>
            <td>
                <a href="borrowBook?bookId=${book.bookId}&userId=${user.userId}">借书</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a class="btn btn-danger btn-xs" href="${pageContext.request.contextPath}/user/userQuery">回到用户首页</a>
</body>
</html>
