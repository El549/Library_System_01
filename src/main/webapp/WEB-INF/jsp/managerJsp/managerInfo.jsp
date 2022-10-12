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
<%--                        <button onclick="show2()">修改管理员信息</button>--%>
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
</html>
