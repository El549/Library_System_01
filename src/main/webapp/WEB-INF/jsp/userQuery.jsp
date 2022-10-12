<%--
  Created by IntelliJ IDEA.
  User: crossover0411
  Date: 2022-10-08
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户首页</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3.3.7/css/bootstrap.css">
<body>

<table>
    <tr class="info">
        <td>
            <a class="btn btn-warning btn-xs" href="userInfo">个人信息</a>
            <a class="btn btn-danger btn-xs" href="login">退出登录</a>
        </td>
    </tr>

</table>
<table>

    <tr class="info">
        <td>图书查阅</td>
    </tr>


</table>
<table>

    <tr class="info">
        <td>借阅信息</td>
    </tr>


</table>
<table>

    <tr class="info">
        <td>借阅历史</td>
    </tr>


</table>

<table>

    <tr class="info">
        <td>图书查阅</td>
        <td>借阅信息</td>
        <td>借阅历史</td>
        <td>热门推荐</td>
        <td>问题反馈</td>
    </tr>


</table>

</body>
</html>
