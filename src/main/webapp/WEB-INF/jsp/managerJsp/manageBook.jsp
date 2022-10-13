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
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
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
            <a class="navbar-brand" href="${pageContext.request.contextPath}/manager/managerInfo">图书借阅系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">管理员ID：${sessionScope.manager.managerId} 用户名：${sessionScope.manager.managerName}</a></li>
                <li>
                    <%--                    <a href="showUser?userId=${sessionScope.user.userId}" >修改密码</a>--%>
                    <a href="#" data-toggle="modal" data-target="#myModal" >修改密码</a>

                </li>
                <li><a href="${pageContext.request.contextPath}/manager/mLogout">退出登录</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="disabled"><a href="showAllBook_method">管理图书</a></li>
                <li><a href="${pageContext.request.contextPath}/manager/showAllUser_method">管理用户</a></li>
                <li><a href="${pageContext.request.contextPath}/manager/showAllHistory_method">管理借阅记录</a></li>
            </ul>
        </div>

        <div class="table-responsive">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-1 col-md-offset-0">
                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal2">添加图书</button>
                    </div>
                </div>
            </div>
            <div class="table-responsive container-fluid">

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th class="text-center" style="font-size:x-large">序号</th>
                            <th class="text-center" style="font-size:x-large">书ID</th>
                            <th class="text-center" style="font-size:x-large">封面</th>
                            <form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath}/manager/foundBook_method" method="post">
                                <th><input type="text" class="form-control" placeholder="书名" name="bookName"></th>
                                <th><input type="text" class="form-control" placeholder="作者" name="author"></th>
                                <th><input type="text" class="form-control" placeholder="出版社" name="press"></th>
                                <th><input type="text" class="form-control" placeholder="书籍类别" name="bookClass"></th>
                                <th><input type="text" class="form-control" placeholder="书籍状态" name="bookStatus"></th>
                                <th><button type="submit" class="btn btn-default">搜索</button></th>
                            </form>
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
                            <td>${b.bookStatus}</td>
                            <td>
                                <a class="btn btn-warning btn-xs" href="showBookByBookId_method?bookId=${b.bookId}">修改</a>
                                <a class="btn btn-danger btn-xs" href="deleteBook_method?bookId=${b.bookId}">删除</a>
                            </td>
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
                                    <li><a href="${pageContext.request.contextPath}/manager/showAllBook_method">首页</a></li>
                                    <li><a href="${pageContext.request.contextPath}/manager/showAllBook_method?pageNum=${pi.prePage}">上一页</a></li>
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
                                    <li> <a href="${pageContext.request.contextPath}/manager/showAllBook_method?pageNum=${pi.nextPage}">下一页</a></li>
                                    <li><a href="${pageContext.request.contextPath}/manager/showAllBook_method?pageNum=${pi.lastPage}">末页</a></li>
                                </ul>
                            </nav>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal"tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改管理员信息
                </h4>
            </div>
            <div class="modal-body">
                <form action="changeUserPasswordSucces?userId=${sessionScope.manager.managerId}" method="post" id="changeUserInfo">
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">管理员名称</label>
                        <input type="text" class="form-control" id="recipient-name" name="managerName" value="${sessionScope.manager.managerName}">
                    </div>
                    <div class="form-group">
                        <label for="recipient-password" class="col-form-label">管理员密码</label>
                        <input type="password" class="form-control" id="recipient-password" name="managerPassword" value="${sessionScope.manager.managerPassword}">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="submit" class="btn btn-primary" form="changeUserInfo">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 增加图书模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel2">
                    添加图书
                </h4>
            </div>
            <div class="modal-body">
                <form action="addBook_method" method="post" id="addBook">
                    <div class="form-group">
                        <label for="recipient-bookcover" class="col-form-label">封面url</label>
                        <input type="text" class="form-control" id="recipient-bookcover" name="bookCover"
                               value="">
                    </div>
                    <div class="form-group">
                        <label for="recipient-bookname" class="col-form-label">书名</label>
                        <input type="text" class="form-control" id="recipient-bookname" name="bookName"
                               value="">
                    </div>
                    <div class="form-group">
                        <label for="recipient-author" class="col-form-label">作者</label>
                        <input type="text" class="form-control" id="recipient-author" name="author" value="">
                    </div>
                    <div class="form-group">
                        <label for="recipient-press" class="col-form-label">出版社</label>
                        <input type="text" class="form-control" id="recipient-press" name="press" value="">
                    </div>
                    <div class="form-group">
                        <label for="recipient-bookClass" class="col-form-label">类别</label>
                        <input type="text" class="form-control" id="recipient-bookClass" name="bookClass"
                               value="">
                    </div>
                    <div class="form-group">
                        <label for="recipient-bookStatus" class="col-form-label">借还情况</label>
                        <input type="text" class="form-control" id="recipient-bookStatus" name="bookStatus"
                               value="">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="submit" class="btn btn-primary" form="addBook">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.cn/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</body>