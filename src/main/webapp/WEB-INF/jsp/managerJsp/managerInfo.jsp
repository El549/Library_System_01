<%--
  Created by IntelliJ IDEA.
  User: Hao
  Date: 2022/10/8
  Time: 15:01
  To change this template use File | Settings | File Templates.
  在此页面展示管理员信息和修改管理员信息

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>管理员信息</title>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-4.6.1/js/bootstrap.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/mycss/managerInfo.css">
    <link rel="stylesheet" href="https://7npmedia.w3cschool.cn/w3.css">

</head>
<body>
<div class="topMenu">
    <div class="w3-sidebar w3-bar-block w3-collapse w3-card w3-animate-left" style="width:200px; color: black" id="mySidebar">
        <button id="close-button"  class="w3-bar-item w3-button w3-large w3-hide-large" onclick="w3_close()">关闭 &times;</button>
        <a class="w3-bar-item w3-button" href="showAllBook_method">图书管理</a>
        <a class="w3-bar-item w3-button" href="showAllUser_method">读者管理</a>
        <a class="w3-bar-item w3-button" href="#">图书分类管理</a>
        <a class="w3-bar-item w3-button" href="showAllHistory_method">图书借阅记录</a>
        <a class="w3-bar-item w3-button" href="#">图书归还记录</a>
        <a class="w3-bar-item w3-button" data-toggle="modal" data-target="#myModal" href="#">修改管理员信息</a>

        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
            Launch demo modal
        </button>

        <!-- Modal -->
        <div class="modal fade exampleModal" id="exampleModal test" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <button type="button" class="" data-toggle="modal" data-target="#test">
            Launch demo modal
        </button>
    </div>

    <table>
        <tr>
            <td>
                <div class="w3-teal openSiderBar">
                    <button class="w3-button w3-teal w3-xlarge w3-hide-large" onclick="w3_open()" style="display: block">&#9776;</button>
                </div>
            </td>
            <td>欢迎使用图书管理系统</td>
            <td style="text-align: left">
                <a href="${pageContext.request.contextPath}/manager/managerInfo">
                    <img src="${pageContext.request.contextPath}/static/img/用户黑1.svg">
                    <p style="display: inline;">
                        欢迎您，管理员${sessionScope.manager.managerName}(${sessionScope.manager.managerId})</p>
                </a>
            </td>
        </tr>
    </table>
</div>


<div class="box0">
    <div class="box1Right">
        <table class="introduceInfo">
            <tr>
                <td>
                    <p class="functionName">图书管理</p>
                    <ur>
                        <li>根据图书名称、作者、分类、出版社等信息查询图书</li>
                        <li>查询到的图书分页展示其编号、名称、作者、出版社以及描述信息</li>
                    </ur>
                </td>
                <td>
                    <p class="functionName">图书分类管理</p>
                    <ur>
                        <li>分类查询图书</li>
                        <li>对查询到的图书进行管理</li>
                    </ur>
                </td>
            </tr>
            <tr>
                <td>
                    <p class="functionName">读者管理</p>
                    <ur>
                        <li>展示所有用户及基本信息</li>
                        <li>增加用户、删除用户、查看用户的借书信息</li>
                    </ur>
                </td>
                <td>
                    <p class="functionName">修改信息</p>
                    <ur>
                        <li>点击修改管理员信息或管理员名称</li>
                        <li>可更改管理员名称以及密码</li>
                    </ur>
                </td>
            </tr>
            <tr>
                <td>
                    <p class="functionName">借阅管理</p>
                    <ur>
                        <li>查看所有借阅记录</li>
                        <li>对记录进行更改，查看尚未归还图书的信息</li>
                    </ur>
                </td>

            </tr>
        </table>
    </div>
</div>
<a href="${pageContext.request.contextPath}/index.jsp">借阅系统首页</a>
</body>
</html>
