<%--
  Created by IntelliJ IDEA.
  User: Hao
  Date: 2022/10/8
  Time: 15:01
  To change this template use File | Settings | File Templates.
  在此页面展示管理员信息和修改管理员信息

--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>管理员信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3.3.7/css/bootstrap.css">
    <script type="text/javascript">
        function changeInfo(){
            var m = document.getElementById("mname");
            var mname = m.getAttribute("value");
            if(mname != ''){
                var a = document.getElementById("frameDownDown");
                a.style.display="block";
            }
        }
    </script>
</head>
<body onload="changeInfo()">
    <div id="frame0" style="width: 100%; height: 100%; text-align: center;">
        <div id="frameUp" style="width: 70%; margin: auto; padding: 100px">
            <table id="showManagerInfo" style="width: 100%;border: solid 1px;text-align: center;margin: auto;">
                <tr style="border: 1px">
                    <td rowspan="3">
                        <img src="https://webstatic.mihoyo.com/upload/op-public/2021/10/11/320a35c423a3d8ca043d7ee14a8c7925_602536019813937911.png">
                    </td>
                    <td>${sessionScope.manager.managerName}</td>
                </tr>
                <tr>
                    <td>${sessionScope.manager.managerId}</td>
                </tr>
                <tr>
                    <td>
                        和蔼可亲的管理员d=====(￣▽￣*)b
                    </td>
                </tr>
            </table>
        </div>
        <div id="frameDown"  style="width: 70%; margin: auto; border: solid black 2px;padding: 100px">
            <div id="frameDownUp" style="margin: auto; border: solid red 2px;">
                <table style="text-align: center">
                    <tr>
&lt;%&ndash;                        <button onclick="show2()">修改管理员信息</button>&ndash;%&gt;
                        <td><a href="showManagerInfo_method?managerId=${sessionScope.manager.managerId}">修改管理员信息</a></td>
                        <td><a href="showAllBook_method">管理图书</a></td>
                        <td><a href="showAllUser_method">管理用户</a></td>
                        <td><a href="showAllHistory_method">管理借阅记录</a></td>
                    </tr>

                </table>

            </div>
            <div id="frameDownDown" style="margin: auto; border: solid red 2px; display: none">
                <form action="changeManagerInfo_method?managerId=${manager.managerId}" method="post">
                    管理员名称<input id="mname" name="managerName" value="${manager.managerName}"><br>
                    管理员密码<input name="managerPassword" value="${manager.managerPassword}"><br>
                    <input type="submit" value="修改">
                </form>
            </div>

        </div>
    </div>
    <a href="${pageContext.request.contextPath}/index.jsp">借阅系统首页</a>
</body>
</html>--%>

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
                    <li><a href="showAllBook_method">管理图书</a></li>
                    <li><a href="${pageContext.request.contextPath}/manager/showAllUser_method">管理用户</a></li>
                    <li><a href="${pageContext.request.contextPath}/manager/showAllHistory_method">管理借阅记录</a></li>
                </ul>
            </div>

            <div class="table-responsive container-fluid">
                <div class="jumbotron">
                    <div class="container">
                        <h1>欢迎使用图书借阅系统</h1>
                        <p>Welcome to the library lending system.</p>
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
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.cn/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</body>