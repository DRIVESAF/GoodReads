<%@ page import="com.zzt.goodreads.entity.User" %>
<%@ page import="com.zzt.goodreads.entity.Order" %>
<%@ page import="com.zzt.goodreads.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zzt.goodreads.service.BookService" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>猫猫阅读</title>
    <link rel="icon" href="images/favicon-new.ico" type="image/x-icon"/>
    <style>
        @import url("./css/home.css");
    </style>
    <script src="js/index.js"></script>
</head>
<body class="wrapper">
<%
    User user = (User) request.getSession().getAttribute("user");
    request.setAttribute("user", user);

    Order order = (Order) request.getSession().getAttribute("order");
    request.setAttribute("order", order);

%>
<div>
    <div class="left">
        <div class="aside">
            <%--            logo--%>
            <a href="http://localhost:8080/index.jsp" class="logo">
                <img src="./images/GoodReads.png" alt="">
                <span>入书香之地，摘智慧之果</span>
            </a>
            <%--            左侧导航栏开始--%>
            <div class="list">
                <ul>
                    <li>
                        <span class="iconfont icon-shouye "></span>
                        <a href="http://localhost:8080/index.jsp">我的主页</a>
                    </li>
                    <li>
                        <span class="iconfont icon-rexiao"></span>
                        <a href="#">
                            热销书籍
                        </a>
                    </li>
                    <li>
                        <span class="iconfont icon-fenlei"></span>
                        <a href="#">书籍分类</a>
                    </li>

                    <li>
                        <span class="iconfont icon-dingdan"></span>
                        <a href="#">我的订单</a>
                    </li>
                    <li>
                        <span class="iconfont icon-shoucang"></span>
                        <a href="#">我的收藏</a>
                    </li>
                    <li>
                        <span class="iconfont icon-guanzhu"></span>
                        <a href="#">我的关注</a>
                    </li>
                </ul>
            </div>
            <%--            左侧导航栏结束--%>
        </div>
    </div>
    <div class="right">
        <%--        header区域开始--%>
        <div class="header">
            <%--            搜索框--%>
            <div class="search-box">
                <form action="">
                    <label>
                        <span class="iconfont icon-sousuo"></span>
                        <input type="search" placeholder="搜索GoodReads...">
                    </label>
                </form>
            </div>
            <%--header右侧--%>
            <div class="font shop-cart">
                <a href="#">
                    <span class="iconfont icon-gouwuche"></span>
                    <span class="cart-number">1${order.orderAmount}</span>
                </a>
            </div>

            <div class="font info">
                <a href="#">
                    <span class="iconfont icon-xiaoxi"></span>
                    <span class="info-num"></span>
                </a>
            </div>
            <%--    个人中心--%>
            <div class="font personal">
                <a href="#">
                    <span class="iconfont icon-shengdangerenzhongxin "></span>
                </a>
            </div>
        </div>
        <%--    header区域结束--%>

        <%--    main区域开始--%>
        <div class="main">
            <%--            热销书籍--%>
            <%
                BookService bookService = new BookService();
                List<Book> books = bookService.selectAll();
                request.setAttribute("books", books);
            %>
            <div class="hot">
                <a href="#">
                    <img class="hot-books" src="./images/热销书籍.png" alt="热销书籍">
                </a>
                <div class="hot-card">
                    <c:forEach items="${books}" var="book">
                        <div class="hot-box ">
                            <img src="./images/cover/${book.bookCover}" alt="${book.bookName}">
                            <div class="content">
                                <div class="content-left">
                                    <h2>《${book.bookName}》</h2>
                                    <h3>${book.author}</h3>
                                </div>
                                <div class="content-right">
                                    <span class="iconfont icon-gengduo"></span>
                                </div>
                            </div>
                            <div class="content-bottom">
                                <span class="iconfont icon-guanzhu">&nbsp;${book.collect}</span>
                                <span class="iconfont icon-shuping">&nbsp;${book.comment}</span>
                                <span class="iconfont icon-liulanliang">&nbsp;${book.browse}</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>


    <%--        main区域结束--%>

</body>

</html>