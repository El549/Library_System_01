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
</head>
<body>

    <div id="searchBox" style="width: 100%; text-align: center">
        <form target="_self" method="post" action="${pageContext.request.contextPath}/manager/showBooks">
            <input type="text" placeholder="请输入图书名称" name="bookName"/>
            <input type="submit" value="搜索">
        </form>
        <a href="${pageContext.request.contextPath}/manager/foundBooks">高级检索</a>
    </div>
    <div  style="text-align: center"    >
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/manager/addBook">添加</a>
    <%--要展示数据  使用表格--%>
    <table class="table table-striped table-bordered table-condensed" style="width: 70%;margin: auto;">
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
                <td rowspan="1"><a class="btn btn-danger btn-xs" href="deleteBook_method?bookId=${b.bookId}">删除</a></td>
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
