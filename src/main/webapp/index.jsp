<%@ page import="com.zzt.goodreads.entity.User" %>
<%@ page import="com.zzt.goodreads.entity.Order" %>
<%@ page import="com.zzt.goodreads.service.BookService" %>
<%--<%@ page import="com.zzt.goodreads.service.impl.BookServiceImpl" %>--%>
<%@ page import="com.zzt.goodreads.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

//    BookService bookService = new BookServiceImpl();
//    List<Book> books = bookService.selectAll();
//    request.setAttribute("books", books);
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
            <div class="hot">
                <a href="#">
                    <img class="hot-books" src="./images/热销书籍.png" alt="热销书籍">
                </a>
                <div class="hot-card">
                    <div class="hot-box ">
                        <img src="./images/cover/教父.webp" alt="教父">
                        <div class="content">
                            <div class="content-left">
                                <h2>《教父》</h2>
                                <h3>马里奥·普佐(美)</h3>
                            </div>
                            <div class="content-right">
                                <span class="iconfont icon-gengduo"></span>
                            </div>
                        </div>
                        <div class="content-bottom">
                            <span class="iconfont icon-guanzhu">&nbsp;5,188</span>
                            <span class="iconfont icon-shuping">&nbsp;99</span>
                            <span class="iconfont icon-liulanliang">&nbsp;98,720</span>
                        </div>

                    </div>
                    <div class="hot-box ">
                        <img src="./images/cover/霍乱时期的爱情.webp" alt="霍乱时期的爱情">
                        <div class="content">
                            <div class="content-left">
                                <h2>《霍乱时期的爱情》</h2>
                                <h3>加西亚·马尔克斯(哥伦比亚)</h3>
                            </div>
                            <div class="content-right">
                                <span class="iconfont icon-gengduo"></span>
                            </div>
                        </div>
                        <div class="content-bottom">
                            <span class="iconfont icon-guanzhu">&nbsp;5,188</span>
                            <span class="iconfont icon-shuping">&nbsp;99</span>
                            <span class="iconfont icon-liulanliang">&nbsp;98,720</span>
                        </div>
                    </div>
                    <div class="hot-box">
                        <img src="./images/cover/活着.webp" alt="活着">
                        <div class="content">
                            <div class="content-left">
                                <h2>《活着》</h2>
                                <h3>余华(中)</h3>
                            </div>
                            <div class="content-right">
                                <span class="iconfont icon-gengduo"></span>
                            </div>
                        </div>
                        <div class="content-bottom">
                            <span class="iconfont icon-guanzhu">&nbsp;5,188</span>
                            <span class="iconfont icon-shuping">&nbsp;99</span>
                            <span class="iconfont icon-liulanliang">&nbsp;98,720</span>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</div>
</div>


<%--        main区域结束--%>

</body>

</html>