<%@ page import="com.zzt.goodreads.service.UserService" %>
<%@ page import="com.zzt.goodreads.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <title>管理员首页-用户管理</title>
    <link rel="stylesheet" href="css/manage.css">
    <link rel="stylesheet" href="css/pull.css">
</head>

<body class="w">
<form action="/userManage">
    <div class="nav">
        <h3 class="title">
            <a href="manage.jsp">书籍管理</a>
            <a href="javascript:" class="active">用户管理</a>
            <a href="javascript:">书籍分类管理</a>
            <a href="javascript:">订单管理</a>
        </h3>
    </div>

    <!--搜索表单-->
    <div class="search">

        <div class="author">
            <input placeholder="用户名">
        </div>

        <div class="bookName">
            <input placeholder="手机号" name="phone">
        </div>
        <button>查询</button>
        <input type="button" value="删除" class="del">
    </div>

    <!--按钮-->

    <input id="show-Popup" onclick="showPopup()" type="button" value="新增">
    <div id="overlay">
        <div class="popup">
            <p class="popup_title">添加用户</p>
            <div class="container">
                <form action="${pageContext.request.contextPath}/addUserServlet" method="post">
                    <div class="form-group">
                        <label for="name"  style="display:inline-block;width:100px;text-align:left">用户名：</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="请输入用户名">
                    </div>

                    <div class="form-group">
                        <label for="password" style="display:inline-block;width:100px;text-align:left">密码：</label>
                        <input type="text" class="form-control" id="password" name="password" placeholder="请输入密码">
                    </div>

                    <div class="form-group">
                        <label for="phone" style="display:inline-block;width:100px;text-align:left">手机号：</label>
                        <input type="text" class="form-control" name="phone" id="phone" placeholder="请输入手机号"/>
                    </div>

                    <div class="form-group">
                        <label for="email" style="display:inline-block;width:100px;text-align:left">邮箱：</label>
                        <input type="text" class="form-control" name="email"  id="email" placeholder="请输入邮箱"/>
                    </div>

                    <div class="form-group">
                        <label >是否为管理员：</label>
                        <input type="radio" name="true" value="true" checked="checked"/>是
                        <input type="radio" name="false" value="false" />否
                    </div>
                </form>
            </div>
            <div class="popup_btn">
                <input class="cancelBtn" onclick="hidePopup()" type="button" value="取消">
                <input class="confirmBtn" onclick="hidePopup()" type="button" value="确认">
            </div>
        </div>
    </div>

    <!--添加数据对话框表单-->
    <table width="600" border="1" cellspacing="0">
        <thead>
        <tr>
            <th>编号</th>
            <th>用户名</th>
            <th>密码</th>
            <th>姓名</th>
            <th>邮箱</th>
            <th>手机号</th>
            <th>地址</th>
            <th>是否为管理员</th>
        </tr>
        </thead>
        <tbody id="tbMain">
        <%
            UserService userService = new UserService();
            User user= (User) request.getSession().getAttribute("user");
            request.setAttribute("user", user);

            List<User> users = userService.selectAll();
            request.setAttribute("users", users);
        %>
        <% if(user == null) { %>
        <c:forEach items="${users}" var="user">
            <tr class="a">
                <td>
                        ${user.userId}
                </td>
                <td>
                        ${user.userName}
                </td>
                <td>
                        ${user.password}
                </td>
                <td>
                        ${user.name}
                </td>
                <td>
                        ${user.email}
                </td>
                <td>
                        ${user.phone}
                </td>
                <td>
                        ${user.address}
                </td>
                <td>
                        ${user.isAdmin}
                </td>
            </tr>
        </c:forEach>
        <%} else {%>
        <tr class="b">
            <td>
                ${user.userId}
            </td>
            <td>
                ${user.userName}
            </td>
            <td>
                ${user.password}
            </td>
            <td>
                ${user.name}
            </td>
            <td>
                ${user.email}
            </td>
            <td>
                ${user.phone}
            </td>
            <td>
                ${user.address}
            </td>
            <td>
                ${user.isAdmin}
            </td>
        </tr>
        <%} %>
        </tbody>
    </table>
</form>

</body>
<script type="text/javascript">
    var btnDel = document.getElementsByClassName("dele")
    var a  = document.getElementsByClassName("a")
    var b = document.getElementsByClassName("b")
    window.onload = function () {
        btnDel.οnclick = function () {
            <%
                userService.delete(user);
            %>
        }
    }

    function showPopup(){
        var overlay = document.getElementById("overlay");
        overlay.style.display = "block";
    }
    function hidePopup(){
        var overlay = document.getElementById("overlay");
        overlay.style.display = "none";
    }
</script>
</html>
