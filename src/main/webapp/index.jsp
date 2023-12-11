<%@ page import="com.zzt.goodreads.entity.User" %>
<%@ page import="com.zzt.goodreads.entity.Order" %>
<%@ page import="com.zzt.goodreads.service.BookService" %>
<%@ page import="com.zzt.goodreads.service.impl.BookServiceImpl" %>
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

    BookService bookService = new BookServiceImpl();
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
                        <a href="#">热销书籍</a>
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
                <x-sign>
                    <small>热销书籍</small>
                </x-sign>
                <div class="box">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <div class="content">
                        <h2>《教父》</h2>
                        <p class="ellipsis2" ><a>教父及其继承人——他的小儿子迈克尔本来都是坏透了的坏蛋，但是却并不显得令人痛恨，因为他们杀人是整个不合理的社会逼出来的，因为他们杀的也都是更坏的人，他们同那些在幕后“坐地分赃”的政客比较起来，在“坏”的程度上，可真是小巫见大巫了。
                            美国纽约五大黑势力集团之一的维托·考利昂一家采用多种极端手段，实现了在整个美国黑暗势力团体中的独尊地位。在这场斗争中有黑团伙之间的火拼；有走私贩毒的嚣张；有赌场的烟云；有红灯区的人欲横流。本书被认为是描写资本主义社会中黑社会现象的最具权威的作品</a></p>
                    </div>
                </div>
                <div class="box box2">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <div class="content">
                        <h2>《霍乱时期的爱情》</h2>
                        <p class="ellipsis2"><a>《霍乱时期的爱情》是加西亚•马尔克斯获得诺贝尔文学奖之后完成的第一部小说。讲述了一段跨越半个多世纪的爱情史诗，穷尽了所有爱情的可能性：忠贞的、隐秘的、粗暴的、羞怯的、柏拉图式的、放荡的、转瞬即逝的、生死相依的……再现了时光的无情流逝，被誉为“人类有史以来最伟大的爱情小说”，是20世纪最重要的经典文学巨著之一。</a></p>
                    </div>
                </div>
                <div class="box box3">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <div class="content">
                        <h2>《活着》</h2>
                        <p class="ellipsis2"><a>《活着(新版)》讲述了农村人福贵悲惨的人生遭遇。福贵本是个阔少爷，可他嗜赌如命，终于赌光了家业，一贫如洗。他的父亲被他活活气死，母亲则在穷困中患了重病，福贵前去求药，却在途中被国民党抓去当壮丁。经过几番波折回到家里，才知道母亲早已去世，妻子家珍含辛茹苦地养大两个儿女。此后更加悲惨的命运一次又一次降临到福贵身上，他的妻子、儿女和孙子相继死去，最后只剩福贵和一头老牛相依为命，但老人依旧活着，仿佛比往日更加洒脱与坚强。</a></p>
                    </div>
                </div>
                <div class="box box4">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <div class="content">
                        <h2>《梦的解析》</h2>
                        <p class="ellipsis2"><a>弗洛伊德首先回顾了此前关于分析梦的科学著作，他认为虽然有趣但是不够充分。然后他记述了许多梦，来阐明他的理论。他的方法开始于分析他的梦“伊尔玛打针”，但也有许多来自病人的个案研究，书中引用的许多最重要的梦都来自他人。
                            弗洛伊德进行分析的许多来源来自文学作品，该书更多的是一次文学分析的自觉尝试，超过心理学研究的成分。弗洛伊德在此首次讨论了后来发展的恋母情结理论，也就是俄狄浦斯情结。
                            书中作者声称他发现了三大真理：梦是无意识欲望和儿时欲望的伪装的满足；俄狄浦斯情结是人类普通的心理情绪；儿童是有性爱意识和动机的。</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%--        main区域结束--%>

</body>

</html>