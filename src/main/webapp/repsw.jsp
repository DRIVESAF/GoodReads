<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="css/home.css">
    <script src="assets/vue.global.js"></script>
    <script src="assets/axios.min.js"></script>
    <link rel="icon" href="images/favicon-new.ico" type="image/x-icon" />

</head>

<body class="login-body">
<div class="login-box">
    <h2><img src="images/GoodReads.png"></h2>
    <form action="/resetPassword" method="post">
        <div class="user-box">
            <input type="text" name="phone" required>
            <label>手机号</label>
        </div>
        <div class="user-box">
            <input type="password" name="originP" required>
            <label>原密码</label>
        </div>

        <div class="user-box">
            <input type="password" name="newP" required>
            <label>新密码</label>
        </div>
        <div class="log" style="text-align: center">
            <a href="">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <button>确 定</button>
            </a>
        </div>
    </form>
</div>
<%--<script>--%>
<%--    var errori = '<%=request.getParameter("error")%>';--%>
<%--    if(errori='yes'){--%>
<%--        alert("登录失败！")--%>
<%--    }--%>
<%--</script>--%>
</body>

</html>
