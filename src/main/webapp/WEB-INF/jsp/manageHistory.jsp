<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Hao
  Date: 2022/10/8
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>记录管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3.3.7/css/bootstrap.css">
</head>
<body>

<div style="">

    <%--要展示数据  使用表格--%>
    <table class="table table-striped table-bordered table-condensed" style="width: 70%;margin: auto; text-align: center">
        <tr class="info">
            <td>记录编号</td>
            <td>图书名称</td>
            <td>借阅者编号</td>
            <td>借阅时间</td>
            <td>归还时间</td>
            <td>操作</td>
        </tr>
        <%--var是循环体内的变量  items是谁被循环 varstatus是专门做编号的--%>
        <c:forEach var="h" items="${hlist}" varStatus="vs">
            <tr>
                <td>${h.historyId}</td>
                <td>${h.bookId}</td>
                <td>${h.userId}</td>
                <td><fmt:formatDate value="${h.borrowedTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${h.returnedTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>
                    <a class="btn btn-warning btn-xs" href="showHistoryByHistoryId_method?historyId=${h.historyId}">修改</a>
                    <a class="btn btn-danger btn-xs" href="deleteHistory_method?historyId=${h.historyId}">删除</a>
                </td>
            </tr>
        </c:forEach>


    </table>
</div>

</body>
</html>
