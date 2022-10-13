<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hao
  Date: 2022/10/8
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>图书管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3.3.7/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/mycss/topmanu&siderbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/mycss/manageBook.css">
    <link rel="stylesheet" href="https://7npmedia.w3cschool.cn/w3.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<div class="topMenu">
    <div class="w3-sidebar w3-bar-block w3-collapse w3-card w3-animate-left" style="width:200px; color: black"
         id="mySidebar">
        <button class="w3-bar-item w3-button w3-large w3-hide-large" onclick="w3_close()">关闭 &times;</button>
        <a class="w3-bar-item w3-button" href="showAllBook_method">图书管理</a>
        <a class="w3-bar-item w3-button" href="showAllUser_method">读者管理</a>
        <a class="w3-bar-item w3-button" href="#">图书分类管理</a>
        <a class="w3-bar-item w3-button" href="showAllHistory_method">图书借阅记录</a>
        <a class="w3-bar-item w3-button" href="#">图书归还记录</a>
        <a class="w3-bar-item w3-button" href="showManagerInfo_method?managerId=${sessionScope.manager.managerId}">修改管理员信息</a>
    </div>
    <table>
        <tr>
            <td>
                <div class="w3-teal openSiderBar">
                    <button class="w3-button w3-teal w3-xlarge w3-hide-large" onclick="w3_open()"
                            style="display: block">&#9776;
                    </button>
                </div>
            </td>
            <td>欢迎使用图书管理系统</td>
            <td style="text-align: left">
                <a href="${pageContext.request.contextPath}/manager/managerInfo">
                    <img src="${pageContext.request.contextPath}/static/img/用户黑1.svg">
                    <p style="display: inline;">
                        返回管理员界面</p>
                </a>
            </td>
        </tr>
    </table>
</div>
<div id="container">
    <div class="searchBar">
        <div class="search bar5">
            <form target="_self" method="post" action="${pageContext.request.contextPath}/manager/showBooks">
                <input type="text" placeholder="请输入图书名称" name="bookName">
                <button type="submit"></button>
            </form>
        </div>
        <a href="${pageContext.request.contextPath}/manager/foundBooks" style="">高级检索</a>
    </div>
</div>
<div style="text-align: center">
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/manager/addBook">添加</a>
    <%--要展示数据  使用表格--%>
    <table class="table table-striped table-bordered table-condensed" style="width: 60%;margin: auto;">
        <c:forEach var="b" varStatus="vs" items="#{pi.list}">
            <tr style="margin: 10px">
                <td rowspan="4">${vs.count}</td>
                <td rowspan="4"><img src="${b.bookCover}" alt="${b.bookName}.png" height="200px"></td>
                <td colspan="2"><p style="font-size: 2.5em">${b.bookName}</p></td>
                <td>${b.author}</td>
                <td>${b.bookStatus}</td>
            </tr>
            <tr>
                <td colspan="2">${b.bookClass}</td>
                <td>${b.press}</td>
                <td>查看借阅人</td>
            </tr>
            <tr>
                <td colspan="3" rowspan="2"></td>
                <td><a class="btn btn-danger btn-xs" href="showBookByBookId_method?bookId=${b.bookId}">修改</a></td>
            </tr>
            <tr>
                <td rowspan="1"><a class="btn btn-danger btn-xs" href="deleteBook_method?bookId=${b.bookId}">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <%--分页--%>
    <c:if test="${!pi.isFirstPage}">
        <a href="${pageContext.request.contextPath}/manager/showAllBook_method">首页</a>
        <a href="${pageContext.request.contextPath}/manager/showAllBook_method?pageNum=${pi.prePage}">上一页</a>
    </c:if>
    <c:if test="${!pi.isLastPage}">
        <a href="${pageContext.request.contextPath}/manager/showAllBook_method?pageNum=${pi.nextPage}">下一页</a>
        <a href="${pageContext.request.contextPath}/manager/showAllBook_method?pageNum=${pi.lastPage}">末页</a>
    </c:if>
    当前页：${pi.pageNum}/${pi.pages}
</div>
</body>
</html>
