<%--
  Created by IntelliJ IDEA.
  User: 24868
  Date: 2022/10/11
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <title>借书历史页面</title>
</head>
<body>
    <a href="${pageContext.request.contextPath}/user/userQuery">用户主页</a>
    <a href="${pageContext.request.contextPath}/index.jsp">借阅系统首页</a>
<table>
    <tr class="info">
        <td>编号</td>
        <td>书名</td>
        <td>用户名</td>
        <td>借书时间</td>
        <td>还书时间</td>
        <td>操作</td>
    </tr>
    <%--var是循环体内的变量 items是谁被循环 varStatus是专门做编号的--%>
    <c:forEach var="h" items="${histories}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td>${h.bookId}</td>
            <td>${h.userId}</td>
            <td><fmt:formatDate value="${h.borrowedTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td><fmt:formatDate value="${h.returnedTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <a href="${pageContext.request.contextPath}/user/returnBook?historyId=${h.historyId}&userId=${userId}">还书</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a class="btn btn-danger btn-xs" href="${pageContext.request.contextPath}/user/userQuery">回到用户首页</a>
</body>
</html>
