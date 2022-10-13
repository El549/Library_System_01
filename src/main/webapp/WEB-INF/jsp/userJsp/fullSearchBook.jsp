<%--
  Created by IntelliJ IDEA.
  User: lhy
  Date: 2022/10/13
  Time: 09:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.cn/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.cn/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
</head>
<body style="padding-top: 70px">
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <%--<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>--%>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/user/userQuery">图书借阅系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">用户ID：${sessionScope.user.userId} 用户名：${sessionScope.user.userName}</a></li>
                <li><a href="showUser?userId=${sessionScope.user.userId}">修改密码</a></li>
                <li><a href="deleteUser?userId=${sessionScope.user.userId}">用户注销</a></li>
                <%--<li><a href="#">Settings</a></li>
                <li><a href="#">Profile</a></li>--%>
                <li><a href="${pageContext.request.contextPath}/user/userLogout">退出登录</a></li>
            </ul>
            <%--搜索框--%>
            <%--<form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>--%>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="disabled"><a href="javascript:return false;">图书查询</a></li>
                <li><a href="${pageContext.request.contextPath}/user/showBorrowedBook?userId=${user.userId}">借阅信息</a></li>
                <li><a href="${pageContext.request.contextPath}/user/showHistorysByUserId?userId=${user.userId}">借阅历史</a></li>
            </ul>
        </div>

        <div class="table-responsive">
            <div class="container-fluid">
                <form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath}/user/foundBook?userId=${user.userId}&book" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="书名" name="bookName">
                        <input type="text" class="form-control" placeholder="作者" name="author">
                        <input type="text" class="form-control" placeholder="出版社" name="press">
                        <input type="text" class="form-control" placeholder="书籍类别" name="bookClass">
                        <input type="text" class="form-control" placeholder="书籍状态" name="bookStatus">
                        <button type="submit" class="btn btn-default">搜索</button>
                    </div>
                </form>
            </div>
            <div class="table-responsive container-fluid">
                <table class="table table-striped">
                    <%--<tr class="info">
                        <td>编号</td>
                        <td>书名</td>
                        <td>作者</td>
                        <td>出版社</td>
                        <td>书籍类别</td>
                        <td>书籍状态</td>
                        <td>操作</td>
                    </tr>--%>
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>书ID</th>
                        <th>封面</th>
                        <th>书名</th>
                        <th>作者</th>
                        <th>出版社</th>
                        <th>书籍类别</th>
                        <%--<th>书籍状态</th>--%>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <%--var是循环体内的变量 items是谁被循环 varStatus是专门做编号的--%>
                    <tbody>
                    <c:forEach var="b" items="${pi.list}" varStatus="vs">
                        <tr>
                            <td>${vs.count+(pi.pageNum-1)*5}</td>
                            <td>${b.bookId}</td>
                            <td><img src="${b.bookCover}" alt="${b.bookName}.png" height="100px"></td>
                            <td>${b.bookName}</td>
                            <td>${b.author}</td>
                            <td>${b.press}</td>
                            <td>${b.bookClass}</td>
                            <%--<td>${b.bookStatus}</td>--%>
                            <c:if test="${b.bookStatus == false}">
                                <td>
                                    <a class="btn btn-default btn-xs disabled" href="borrowBook?bookId=${b.bookId}&userId=${user.userId}">被借</a>
                                </td>
                            </c:if>
                            <c:if test="${b.bookStatus == true}">
                                <td>
                                    <a class="btn btn-warning btn-xs" href="borrowBook?bookId=${b.bookId}&userId=${user.userId}">借阅</a>
                                </td>
                            </c:if>
                            <%--<td>
                                <a class="btn btn-warning btn-xs" href="borrowBook?bookId=${b.bookId}&userId=${user.userId}">借阅</a>
                            </td>--%>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div>
                    <div>
                        <%--分页--%>
                        <c:if test="${!pi.isFirstPage && pi.isLastPage}">
                            <nav aria-label="...">
                                <ul class="pager">
                                    <li><a href="${pageContext.request.contextPath}/user/bookList?userId=${user.userId}">首页</a></li>
                                    <li><a href="${pageContext.request.contextPath}/user/bookList?pageNum=${pi.prePage}&userId=${user.userId}">上一页</a></li>
                                    当前页：${pi.pageNum}/${pi.pages}
                                    <li class="disabled"><a href="javascript:return false;">下一页</a></li>
                                    <li class="disabled"><a href="javascript:return false;">末页</a></li>
                                </ul>
                            </nav>
                        </c:if>
                        <c:if test="${!pi.isLastPage && pi.isFirstPage}">
                            <nav aria-label="...">
                                <ul class="pager">
                                    <li class="disabled"><a href="javascript:return false;">首页</a></li>
                                    <li class="disabled"><a href="javascript:return false;">上一页</a></li>
                                    当前页：${pi.pageNum}/${pi.pages}
                                    <li><a href="${pageContext.request.contextPath}/user/bookList?pageNum=${pi.nextPage}&userId=${user.userId}">下一页</a></li>
                                    <li><a href="${pageContext.request.contextPath}/user/bookList?pageNum=${pi.lastPage}&userId=${user.userId}">末页</a></li>
                                </ul>
                            </nav>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.cn/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</body>
</html>
