<%@ page import="com.zzt.goodreads.entity.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>猫猫阅读</title>
    <link rel="icon" href="images/favicon-new.ico" type="image/x-icon" />
    <style>
        @import url("./css/home.css");
    </style>
</head>
<body>
<%
    User user = (User) request.getSession().getAttribute("user");
    request.setAttribute("user", user);
%>
<div class="wrarper" class="layout-row">
<%--    左侧导航栏--%>
    <div id="aside" class="site-aside">
        <div class="aside-overlay"></div>
        <div class="aside-inner bg-light h-100">
            <div class="site-logo">
                <a href="http://localhost:9090/index" class="navbar-brand">
                    <img src="./images/GoodReads.png" alt="猫猫阅读" class="logo logo-large logo-light nc-no-lazy active">
                </a>
            </div>
        </div>
    </div>

<%--    右侧主页--%>
<div id="main" class="site-main">

</div>
</div>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<h2>${user.userName}</h2>
</body>

</html>