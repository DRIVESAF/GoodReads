<%--
  Created by IntelliJ IDEA.
  User: tyx
  Date: 2023/12/13
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
    <link rel="stylesheet" href="css/home.css">
    <script src="assets/vue.global.js"></script>
    <script src="assets/axios.min.js"></script>
    <link rel="icon" href="images/favicon-new.ico" type="image/x-icon" />
</head>
<body class="login-body">
<div class="login-box">
    <h2><img src="images/GoodReads.png"></h2>
    <form action="/register" method="post">
        <div class="user-box">
            <input type="text" name="userName" required="">
            <label>请输入用户名</label>
        </div>
        <div class="user-box">
            <input type="text" name="phone" required="">
            <label>请输入手机号</label>
        </div>
        <div class="user-box">
            <input type="text" name="email" required="">
            <label>请输入邮箱</label>
        </div>
        <div class="user-box">
            <input type="password" name="password" required="">
            <label>请输入密码</label>
        </div>
        <div class="log">
            <a href="" >
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <button>注 册</button>
            </a>

            <a href="./login.html">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <button>返回</button>
            </a>
        </div>
    </form>
</div>
</body>
</html>
