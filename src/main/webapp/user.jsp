<%@ page import="com.zzt.goodreads.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
</head>
<style>
    @import url("./css/home.css");
</style>
<body>
<%
    User user = (User) request.getSession().getAttribute("user");
    request.setAttribute("user", user);
%>
<div class="user">
    <form action="/user">
        <h1>个人中心</h1>
        <h1>${user.userName}</h1>
    </form>
</div>
</body>
</html>
