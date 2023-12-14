<%@ page import="java.util.List" %>
<%@ page import="com.zzt.goodreads.service.BookService" %>
<%@ page import="com.zzt.goodreads.service.BookSortService" %>
<%@ page import="com.zzt.goodreads.entity.*" %>
<%@ page import="com.zzt.goodreads.service.ClassifyService" %>
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
</head>
<body class="wrapper">
<%
    User user = (User) request.getSession().getAttribute("user");
    request.setAttribute("user", user);

    Order order = (Order) request.getSession().getAttribute("order");
    request.setAttribute("order", order);

%>
<div id="top">
    <div class="left">
        <div class="aside">
            <%--            logo--%>
            <a href="http://localhost:8080/index" class="logo">
                <img src="./images/GoodReads.png" alt="">
                <span>入书香之地，摘智慧之果</span>
            </a>
            <%--            左侧导航栏开始--%>
            <div class="list">
                <ul>
                    <li>
                        <span class="iconfont icon-shouye "></span>
                        <a href="http://localhost:8080/index">我的主页</a>
                    </li>
                    <li>
                        <span class="iconfont icon-rexiao"></span>
                        <a href="index.jsp#hot">
                            热销书籍
                        </a>
                    </li>
                    <li>
                        <span class="iconfont icon-fenlei"></span>
                        <a href="index.jsp#classify">书籍分类</a>
                    </li>
                    <li>
                        <span class="iconfont icon-goodbook"></span>
                        <a href="index.jsp#recommend">好书推荐</a>
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
                    <a class="iconfont icon-shengdangerenzhongxin " href="${pageContext.request.contextPath}/user"></a>
                </a>
            </div>
        </div>
        <%--    header区域结束--%>


        <%--    main区域开始--%>
        <div class="main">
            <%
                BookService bookService = new BookService();
                List<Book> books = bookService.selectAll();
                request.setAttribute("books", books);
//
                ClassifyService classifyService = new ClassifyService();
                List<Classify> classifies = classifyService.selectAll();
                request.setAttribute("classifies", classifies);
            %>
            <%--            热销书籍开始--%>
            <div class="hot" id="hot">
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
                                    <span class="iconfont icon-gouwuche add_btn"></span>
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
            <%--            热销书籍结束--%>


            <%--            书籍分类开始--%>
            <div class="classify" id="classify">
                <a href="#">
                    <img class="books-classify" src="./images/书籍分类.png" alt="书籍分类">
                </a>
                <div class="classify-card">
                    <c:forEach items="${classifies}" var="classify">
                        <div class="classify-box"
                             style="background-image: url('./images/classify/${classify.classifyCover}');">
                            <a href="#">
                                <div class="classify-content">
                                    <div class="classify-content">
                                        <span class="classify-add">${classify.content}</span>
                                        <h3 class="classify-title">${classify.className}</h3>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <%--            书籍分类结束--%>

            <%--            好书推荐开始--%>
            <div class="recommend" id="recommend">
                <div class="recommend-title">
                    <a href="#">
                        <img class="books-recommend" src="./images/好书推荐.png" alt="好书推荐">
                        <img class="recommend-tip" src="./images/每天阅读一本书.png"></img>
                    </a>
                    <div class="recommend-classify">
                        <a href="javascript:" class="active">最新</a>
                        <a href="javascript:">文学经典</a>
                        <a href="javascript:">人文纪实</a>
                        <a href="javascript:">互联网</a>
                        <a href="javascript:">心理成长</a>
                        <a href="javascript:">投资理财</a>
                        <a href="javascript:">两性情感</a>
                        <a href="javascript:">社科新知</a>
                        <a href="javascript:">职场发展</a>
                    </div>
                </div>

                <div class="recommend-list">
                    <ul class="current">
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/你一生的故事.jpg" alt="你一生的故事">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">科幻</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">你一生的故事</p>
                                <p class="card-content ellipsis2">一瞥之下，过去与未来轰轰然同时并至，
                                    我的意识成为长达半个世纪的灰烬，时间未至已成灰。
                                    五十年诸般纷纭并发眼底，我的余生尽在其中。
                                    还有，你的一生。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;446</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <span class="iconfont icon-zhuanjibofang"></span>
                                <img src="./images/recommend/最新/你一生的故事.jpg" alt="你一生的故事">
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">科幻</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">你一生的故事</p>
                                <p class="card-content ellipsis2">一瞥之下，过去与未来轰轰然同时并至，
                                    我的意识成为长达半个世纪的灰烬，时间未至已成灰。
                                    五十年诸般纷纭并发眼底，我的余生尽在其中。
                                    还有，你的一生。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;446</span>
                            </div>
                        </li>
                    </ul>
                    <%--                    文学经典开始--%>
                    <ul>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/你一生的故事.jpg" alt="你一生的故事">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">科幻</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">你一生的故事</p>
                                <p class="card-content ellipsis2">一瞥之下，过去与未来轰轰然同时并至，
                                    我的意识成为长达半个世纪的灰烬，时间未至已成灰。
                                    五十年诸般纷纭并发眼底，我的余生尽在其中。
                                    还有，你的一生。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;446</span>
                            </div>
                        </li>
                    </ul>
                    <%--                    文学经典结束--%>
                    <%--                    人文纪实开始--%>
                    <ul>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/你一生的故事.jpg" alt="你一生的故事">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">科幻</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">你一生的故事</p>
                                <p class="card-content ellipsis2">一瞥之下，过去与未来轰轰然同时并至，
                                    我的意识成为长达半个世纪的灰烬，时间未至已成灰。
                                    五十年诸般纷纭并发眼底，我的余生尽在其中。
                                    还有，你的一生。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;446</span>
                            </div>
                        </li>
                    </ul>
                    <%--                    人文纪实结束--%>
                    <%--                    互联网开始--%>
                    <ul>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/你一生的故事.jpg" alt="你一生的故事">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">科幻</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">你一生的故事</p>
                                <p class="card-content ellipsis2">一瞥之下，过去与未来轰轰然同时并至，
                                    我的意识成为长达半个世纪的灰烬，时间未至已成灰。
                                    五十年诸般纷纭并发眼底，我的余生尽在其中。
                                    还有，你的一生。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;446</span>
                            </div>
                        </li>
                    </ul>
                    <%--                    互联网结束--%>
                    <%--                    心理成长开始--%>
                    <ul>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/你一生的故事.jpg" alt="你一生的故事">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">科幻</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">你一生的故事</p>
                                <p class="card-content ellipsis2">一瞥之下，过去与未来轰轰然同时并至，
                                    我的意识成为长达半个世纪的灰烬，时间未至已成灰。
                                    五十年诸般纷纭并发眼底，我的余生尽在其中。
                                    还有，你的一生。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;446</span>
                            </div>
                        </li>
                    </ul>
                    <%--                    心里成长结束--%>
                    <%--                    投资理财开始--%>
                    <ul>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/你一生的故事.jpg" alt="你一生的故事">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">科幻</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">你一生的故事</p>
                                <p class="card-content ellipsis2">一瞥之下，过去与未来轰轰然同时并至，
                                    我的意识成为长达半个世纪的灰烬，时间未至已成灰。
                                    五十年诸般纷纭并发眼底，我的余生尽在其中。
                                    还有，你的一生。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;446</span>
                            </div>
                        </li>
                    </ul>
                    <%--                    投资理财结束--%>
                    <%--                两性情感开始    --%>
                    <ul>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/你一生的故事.jpg" alt="你一生的故事">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">科幻</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">你一生的故事</p>
                                <p class="card-content ellipsis2">一瞥之下，过去与未来轰轰然同时并至，
                                    我的意识成为长达半个世纪的灰烬，时间未至已成灰。
                                    五十年诸般纷纭并发眼底，我的余生尽在其中。
                                    还有，你的一生。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;446</span>
                            </div>
                        </li>
                    </ul>
                    <%--                    两性情感结束--%>
                    <%--                    社科新知开始--%>
                    <ul>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/你一生的故事.jpg" alt="你一生的故事">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">科幻</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">你一生的故事</p>
                                <p class="card-content ellipsis2">一瞥之下，过去与未来轰轰然同时并至，
                                    我的意识成为长达半个世纪的灰烬，时间未至已成灰。
                                    五十年诸般纷纭并发眼底，我的余生尽在其中。
                                    还有，你的一生。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;446</span>
                            </div>
                        </li>
                    </ul>
                    <%--                    社科新知结束--%>
                    <%--                    职场发展开始--%>
                    <ul>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/你一生的故事.jpg" alt="你一生的故事">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">科幻</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">你一生的故事</p>
                                <p class="card-content ellipsis2">一瞥之下，过去与未来轰轰然同时并至，
                                    我的意识成为长达半个世纪的灰烬，时间未至已成灰。
                                    五十年诸般纷纭并发眼底，我的余生尽在其中。
                                    还有，你的一生。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;446</span>
                            </div>
                        </li>
                    </ul>
                    <%--                    职场发展结束--%>
                </div>
            </div>
        </div>
    </div>
    <%--            好书推荐结束--%>
</div>
<%--        main区域结束--%>
</div>

<%--    回到顶部--%>
<div class="back-top">
    <%--        <img class="tip" src="./images/回到顶部文字.png">--%>
    <a href="index.jsp#top">
        <img class="top" src="./images/回到顶部2.png" alt="回到顶部">
    </a>
</div>
</div>
<script src="js/index.js"></script>
</body>

</html>