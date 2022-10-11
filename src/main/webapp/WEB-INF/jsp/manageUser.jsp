<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>用户管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3.3.7/css/bootstrap.css">
</head>
<body>

<div  style="text-align: center" >
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/manager/addUser">添加</a>
    <%--要展示数据  使用表格--%>
    <table class="table table-striped table-bordered table-condensed" style="width: 70%;margin: auto;">
        <c:forEach var="u" items="#{ulist}">
            <tr>
                <td rowspan="2"><img src="https://bbs.mihoyo.com/mainPage/ys-logo-v2.png"></td>
                <td>${u.userName}</td>
                <td>${u.userId}</td>
                <td><a class="btn btn-danger btn-xs" href="showUserByUserId_method?userId=${u.userId}">修改</a></td>
            </tr>
            <tr>
                <td colspan="2"><p>系统默认签名,送给每一个小可爱o(*￣▽￣*)o</p></td>
                <td><a href="deleteUser_method?userId=${u.userId}">删除</a></td>
            </tr>

        </c:forEach>

    </table>
</div>

</body>
</html>
