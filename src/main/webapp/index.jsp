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
                        <a href="index.jsp#order">我的订单</a>
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
                <a href="${pageContext.request.contextPath}/shoppingCart.jsp">
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
                <a href="${pageContext.request.contextPath}/user.jsp">
                    <span class="iconfont icon-shengdangerenzhongxin " ></span>
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
            <div class="classify section" id="classify">
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
            <div class="recommend section" id="recommend">
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
                        <a href="javascript:">社科新知</a>
                        <a href="javascript:">职场发展</a>
                    </div>
                </div>
                <%--                好书推荐列表开始--%>
                <div class="recommend-list">
                    <%--                    最新开始--%>
                    <ul class="current">
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
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/献给阿尔吉侬的花束.jpg" alt="献给阿尔吉侬的花束">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">科幻</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">献给阿尔吉侬的花束</p>
                                <p class="card-content ellipsis2">
                                    声称能改造智能的科学实验在白老鼠阿尔吉侬身上获得了突破性的进展，下一步急需进行人体实验。个性和善、学习态度积极的心智障碍者查理·高登成为最佳人选。手术成功后，查理的智商从68跃升为185，然而那些从未有过的情绪和记忆也逐渐浮现。
                                    。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;112</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/星之继承者.jpg" alt="星之继承者">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">科幻</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">星之继承者</p>
                                <p class="card-content ellipsis2">
                                    2027年，月球上发现一具五万年前的人类尸体。如果地球存在高科技史前文明，不可能没有任何遗迹；但若说他来自外星，则又违背进化论。同时，科研发现月球正面与背面的土壤年份相差几十亿年，
                                    而从猿猴到智人的进化链上缺失的一环一直没有找到……这一切谜团，都指向五万年前太阳系的那场浩劫，人类创世的史诗大幕，已徐徐拉开。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;110</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/激荡三十年.jpg" alt="激荡三十年">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">互联网</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">激荡三十年</p>
                                <p class="card-content ellipsis2">
                                    尽管任何一段历史都有它不可替代的独特性，可是，1978年－2008年的中国，却是不可能重复的。在一个拥有13亿人口的大国里，僵化的计划经济体制日渐瓦解了，
                                    一群小人物把中国变成了一个巨大的试验场，它在众目睽睽之下，以不可逆转的姿态向商业社会转轨。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;435</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/创新者的窘境.jpg" alt="创新者的窘境">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">互联网</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">创新者的窘境</p>
                                <p class="card-content ellipsis2">管理类经典图书
                                    o 被《福布斯》评为20世纪最具影响的20本商业图书之一
                                    o “全球商业书籍奖”获奖图书
                                    “颠覆大师”克莱顿•克里斯坦森经典力作。
                                    《金融时报》/布兹•亚兰及汉密顿全球商务书刊颁发“1997年最佳商务书”奖</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;116</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/定位.jpg" alt="定位">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">互联网</span>
                                <span class="green"></span>
                                <span class="card-classify">职场发展</span>
                                <p class="card-title">定位</p>
                                <p class="card-content ellipsis2">
                                    20多年前，美国《广告时代》杂志约请年轻的营销专家里斯和特劳特撰写一系列有关营销和广告新思维的文章，总标题就是“定位的时代”。系列文章刊载之后，引起全行业的轰动，
                                    定位成了营销界人人谈论的热闹话题，经作者之手送出的文章就达12万份之多，由此开创了营销理论全面创新的时代。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;199</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/浪潮之巅.jpg" alt="浪潮之巅">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">互联网</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">浪潮之巅</p>
                                <p class="card-content ellipsis2">
                                    近一百多年来，总有一些公司很幸运地、有意识或无意识地站在技术革命的浪尖之上。在这十几年间，它们代表着科技的浪潮，直到下一波浪潮的来临。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;12月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;503</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/苏世民：我的经验与教训.jpg"
                                     alt="苏世民：我的经验与教训">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">职场发展</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">苏世民：我的经验与教训</p>
                                <p class="card-content ellipsis2">这是一部投资、管理类图书，是一部关于成功创业的书，还是一部处世哲学。
                                    苏世民创立的黑石集团是全球私募股权资产管理公司和房地产管理公司的巨头。截至2019年第三季度，黑石管理的资金总额超过5500亿美元。黑石集团人均利润是高盛的9倍，
                                    过去30余年平均回报率高达30%以上。美国排名前50的公司和养老基金中，70%以上都有黑石的投资。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;12月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;273</span>
                            </div>
                        </li>
                    </ul>
                    <%--    最新结束--%>
                    <%--                    文学经典开始--%>
                    <ul>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/文学经典/看不见的城市.jpg" alt="看不见的城市">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">小说</span>
                                <span class="green"></span>
                                <span class="card-classify">文学经典</span>
                                <p class="card-title">看不见的城市</p>
                                <p class="card-content ellipsis2">王小波、苏童、阿城、止庵是他的忠实粉丝
                                    朱天文，唐诺是卡尔维诺不余遗力的传播者
                                    梁文道说他一直在准备谈卡尔维诺，可是一直没准备好
                                    权威版本，全面修订2006年单行本译本，并增补卡尔维诺各作品自序、后记、注释等重要资料</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;1年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;306</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/文学经典/你当像鸟飞往你的山.jpg" alt="你当像鸟飞往你的山">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">心理成长</span>
                                <span class="green"></span>
                                <span class="card-classify">文学经典</span>
                                <p class="card-title">你当像鸟飞往你的山</p>
                                <p class="card-content ellipsis2">
                                    人们只看到我的与众不同：一个十七岁前从未踏入教室的大山女孩，却戴上一顶学历的高帽，熠熠生辉。只有我知道自己的真面目：我来自一个极少有人能想象的家庭。我的童年由垃圾场的废铜烂铁铸成，那里没有读书声，只有起重机的轰鸣。不上学，不就医，是父亲要我们坚持的忠诚与真理。父亲不允许我们拥有自己的声音，我们的意志是他眼中的恶魔。哈佛大学，剑桥大学，哲学硕士，历史博士……我知道，像我这样从垃圾堆里爬出来的无知女孩，能取得如今的成就，应当感激涕零才对。但我丝毫提不起热情。我曾怯懦、崩溃、自我怀疑，内心里有什么东西腐烂了，
                                    恶臭熏天。直到我逃离大山，打开另一个世界。那是教育给我的新世界，那是我生命的无限可能。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;1年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;475</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/文学经典/边城.jpg" alt="边城">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">小说</span>
                                <span class="green"></span>
                                <span class="card-classify">文学经典</span>
                                <p class="card-title">边城</p>
                                <p class="card-content ellipsis2">
                                    《边城》是沈从文的代表作，写于一九三三年至一九三四年初。这篇作品如沈从文的其他湘西作品，着眼于普通人、善良人的命运变迁，描摹了湘女翠翠阴差阳错的生活悲剧，
                                    诚如作者所言：“一切充满了善，然而到处是不凑巧。既然是不凑巧，因之素朴的善终难免产生悲剧。”
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;316</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/文学经典/斯通纳.jpg" alt="斯通纳">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">小说</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">斯通纳</p>
                                <p class="card-content ellipsis2">
                                    《斯通纳》讲述了生命中最重要的部分：爱，认同，怜悯，志业，傲骨，信任与死亡。
                                    一个勇者有过的失败不失意的人生：即使不能拥有完美的生活，所幸追求过完整的自我。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;90</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/文学经典/一个叫欧维的男人决定去死.png"
                                     alt="一个叫欧维的男人决定去死">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">心理成长</span>
                                <span class="green"></span>
                                <span class="card-classify">文学经典</span>
                                <p class="card-title">一个叫欧维的男人决定去死</p>
                                <p class="card-content ellipsis2">
                                    欧维（罗夫·拉斯加德 Rolf Lassgård
                                    饰）是一个刻板而又固执的老头，他的妻子半年前死于疾病，留他一人生活在这个混乱不堪的世界之中。每天早晨，欧维都会定时在社区里进行巡视，确认所有的车辆都停在应停的位置，呵斥违反规定私自驶入社区的车辆，赶走四处乱转破坏环境的猫狗，
                                    、在社区居民眼里，欧维是“来自地狱的恶邻”，可每个人都明白，这其实是欧维对于社区爱之深刻的表现。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;241</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/文学经典/悉达多.jpg" alt="悉达多">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">文学经典</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">悉达多</p>
                                <p class="card-content ellipsis2">
                                    古印度贵族青年悉达多英俊聪慧，拥有人们羡慕的一切。为了追求心灵的安宁，他孤身一人展开了求道之旅。他在舍卫城聆听佛陀乔答摩宣讲教义，在繁华的大城中结识了名妓伽摩拉，并成为一名富商。心灵与肉体的享受达到顶峰，却让他对自己厌倦、鄙弃到极点。在与伽摩拉最后一次欢爱之后，他抛弃了自己所有世俗的一切，来到那河边，想结束自己的生命。在那最绝望的一刹那，
                                    他突然听到了生命之河永恒的声音……经过几乎一生的追求，悉达多终于体验到万事万物的圆融统一，所有生命的不可摧毁的本性，并最终将自我融入了瞬间的永恒之中。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;137</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/文学经典/诗经.jpg" alt="诗经">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">文学经典</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">诗经</p>
                                <p class="card-content ellipsis2">
                                    诗经介绍：《诗经》作为中国文学史上第一部诗歌总集，收录了自商末(或说周初)到春秋中叶的诗歌305篇，存目311篇，其中6篇有目无辞。共分风、雅、颂三部。我们以十三经注疏本《诗经》为底本，约请专家注释疑难词句及典故名物，
                                    并进行了全诗翻译。评析部分从文学、历史、哲学、民俗、语言、文化学等多个角度对诗篇文本进行解读。在校对文字、注释及作品辨伪、评析方面尽可能汲取先贤时彦的最新研究成果。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;131</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/文学经典/窗边的小豆豆.jpg" alt="窗边的小豆豆">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">人文纪实</span>
                                <span class="green"></span>
                                <span class="card-classify">文学经典</span>
                                <p class="card-title">窗边的小豆豆</p>
                                <p class="card-content ellipsis2">
                                    《窗边的小豆豆》讲述了作者上小学时的一段真实的故事。作者因淘气被原学校退学后，来到巴学园。在小林校长的爱护和引导下，让一般人眼里“怪怪”的小豆豆逐渐成了一个大家都能接受的孩子，并奠定了她一生的基础。
                                    这本书不仅带给世界几千万读者无数的笑声和感动，而且为现代教育的发展注入了新的活力。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;161</span>
                            </div>
                        </li>
                    </ul>
                    <%--                    文学经典结束--%>
                    <%--                    人文纪实开始--%>
                    <ul>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/人文纪实/冬牧场.jpg" alt="冬牧场">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">人文纪实</span>
                                <span class="green"></span>
                                <span class="card-classify">小说</span>
                                <p class="card-title">冬牧场</p>
                                <p class="card-content ellipsis2">文坛清新之风，阿勒泰的精灵
                                    李娟首部长篇纪实散文力作
                                    四个月、零距离、全程记述哈萨克民族冬牧场的点点滴滴！
                                    春天接羔，夏天催膘，秋天配种，冬天孕育。羊的一生是牧人的一年，牧人的一生呢？这绵延千里的家园，
                                    这些大地最隐秘微小的褶皱，这每一处最狭小脆弱的栖身之地……青春啊，财富啊，爱情啊，希望啊，全都默默无声。
                                    ——李娟
                                    还有，你的一生。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;1年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;183</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/人文纪实/最好的告别.jpg" alt="最好的告别">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">人文纪实</span>
                                <span class="green"></span>
                                <span class="card-classify">心理成长</span>
                                <p class="card-title">最好的告别</p>
                                <p class="card-content ellipsis2">
                                    当独立、自助的生活不能再维持时，我们该怎么办？在生命临近终点的时刻，我们该和医生谈些什么？应该如何优雅地跨越生命的终点？
                                    对于这些问题，大多数人缺少清晰的观念，而只是把命运交由医学、技术和陌生人来掌控。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;207</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/人文纪实/看见.jpg" alt="看见">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">人文纪实</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">看见</p>
                                <p class="card-content ellipsis2">
                                    《看见》是知名记者和主持人柴静讲述央视十年历程的自传性作品，既是柴静个人的成长告白书，某种程度上亦可视作中国社会十年变迁的备忘录。十年前她被选择成为国家电视台新闻主播，却因毫无经验而遭遇挫败，非典时期成为现场记者后，
                                    现实生活犬牙交错的切肤之感，让她一点一滴脱离外在与自我的束缚，对生活与人性有了更为宽广与深厚的理解。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;127</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/人文纪实/史记.jpg" alt="史记">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">人文纪实</span>
                                <span class="green"></span>
                                <span class="card-classify">社科新知</span>
                                <p class="card-title">史记</p>
                                <p class="card-content ellipsis2">
                                    《史记》是我国第一部通史，是“二十四史”中最早的一部，也是最重要的一部史书。全书共一百三十篇。《史记》叙事，始自黄帝，下迄西汉太初，采用了综合性的叙事模式，囊括记言、纪事、编年、国别等形式，
                                    开创纪传体史书“纪、传、表、志”的体例。就内容而言，《史记》是对前代史学的一次总结；就体例而言，《史记》也是集大成之作。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;131</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/人文纪实/历史深处的忧虑.jpg" alt="历史深处的忧虑">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">人文纪实</span>
                                <span class="green"></span>
                                <span class="card-classify">社科新知</span>
                                <p class="card-title">历史深处的忧虑</p>
                                <p class="card-content ellipsis2">
                                    美国的面积和中国差不多。和大多数留学生及新移民一样，当我们一脚踏上这块广袤的陌生土地时，最初落脚点的选择是十分偶然的。我们落在了一个普通的地方，居住的环境平常而宁静。
                                    周围的美国人老老少少都在辛勤劳作，过着普通得不能再普通的生活。要想谋出一番好的光景，对他们也不是一件轻而易举的事情。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;83</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/人文纪实/我与地坛.jpg" alt="我与地坛">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">人文纪实</span>
                                <span class="green"></span>
                                <span class="card-classify">文学经典</span>
                                <p class="card-title">我与地坛</p>
                                <p class="card-content ellipsis2">
                                    史铁生，1951年生于北京。1967年初中毕业。1969年去陕北农村插队，三年后双腿瘫痪转回北京。回京后在一家街道工厂做临时工，七年后因病情加重回家疗养。1979年始有小说、散文、剧本等作品发表。主要作品有：短篇小说《我的遥远的清平湾》、《命若琴弦》、《老屋小记》；散文《我与地坛》、《好运设计》、
                                    《病隙碎笔》；中篇小说《关于詹牧师的报告文学》、《中篇1或短篇4》；长篇小说《务虚笔记》、《我的丁一之旅》等。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;109</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/人文纪实/肖申克的救赎.png" alt="肖申克的救赎">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">人文纪实</span>
                                <span class="green"></span>
                                <span class="card-classify">文学经典</span>
                                <p class="card-title">肖申克的救赎</p>
                                <p class="card-content ellipsis2">
                                    一场谋杀案使银行家安迪（蒂姆•罗宾斯 Tim Robbins 饰）蒙冤入狱，谋杀妻子及其情人的指控将囚禁他终生。
                                    在肖申克监狱的首次现身就让监狱“大哥”瑞德（摩根•弗里曼 Morgan Freeman
                                    饰）对他另眼相看。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;101</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/人文纪实/狂人日记.jpg" alt="狂人日记">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">人文纪实</span>
                                <span class="green"></span>
                                <span class="card-classify">文学经典</span>
                                <p class="card-title">狂人日记</p>
                                <p class="card-content ellipsis2">《狂人日记》是鲁迅1918年发表的第一篇白话短篇小说，当时正值“五四”运动的前夜。由于辛亥革命的半途而废，
                                    特别是帝国主义侵略的加剧，使社会各种矛盾更加复杂尖锐。鲁迅以他锐敏的思想和犀利的笔触，对封建制度及其上层建筑表现了彻底的反抗。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;155</span>
                            </div>
                        </li>
                    </ul>
                    <%--                    人文纪实结束--%>
                    <%--                    互联网开始--%>
                    <ul>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/激荡三十年.jpg" alt="激荡三十年">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">互联网</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">激荡三十年</p>
                                <p class="card-content ellipsis2">
                                    尽管任何一段历史都有它不可替代的独特性，可是，1978年－2008年的中国，却是不可能重复的。在一个拥有13亿人口的大国里，僵化的计划经济体制日渐瓦解了，
                                    一群小人物把中国变成了一个巨大的试验场，它在众目睽睽之下，以不可逆转的姿态向商业社会转轨。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;435</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/创新者的窘境.jpg" alt="创新者的窘境">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">互联网</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">创新者的窘境</p>
                                <p class="card-content ellipsis2">管理类经典图书
                                    o 被《福布斯》评为20世纪最具影响的20本商业图书之一
                                    o “全球商业书籍奖”获奖图书
                                    “颠覆大师”克莱顿•克里斯坦森经典力作。
                                    《金融时报》/布兹•亚兰及汉密顿全球商务书刊颁发“1997年最佳商务书”奖</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;116</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/定位.jpg" alt="定位">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">互联网</span>
                                <span class="green"></span>
                                <span class="card-classify">职场发展</span>
                                <p class="card-title">定位</p>
                                <p class="card-content ellipsis2">
                                    20多年前，美国《广告时代》杂志约请年轻的营销专家里斯和特劳特撰写一系列有关营销和广告新思维的文章，总标题就是“定位的时代”。系列文章刊载之后，引起全行业的轰动，
                                    定位成了营销界人人谈论的热闹话题，经作者之手送出的文章就达12万份之多，由此开创了营销理论全面创新的时代。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;199</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/最新/浪潮之巅.jpg" alt="浪潮之巅">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">互联网</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">浪潮之巅</p>
                                <p class="card-content ellipsis2">
                                    近一百多年来，总有一些公司很幸运地、有意识或无意识地站在技术革命的浪尖之上。在这十几年间，它们代表着科技的浪潮，直到下一波浪潮的来临。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;12月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;503</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/互联网/原则.jpg" alt="原则">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">互联网</span>
                                <span class="green"></span>
                                <span class="card-classify">职场发展</span>
                                <p class="card-title">原则</p>
                                <p class="card-content ellipsis2">
                                    瑞·达利欧是全世界顶级投资家、企业家之一，对冲基金公司桥水创始人。桥水创立至今为客户赚取的收益远远超过历史上任何一家对冲基金。
                                    达利欧认为桥水的成功源自他所奉行的一套原则，而这些原则也是他一生中学到的最重要的东西。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;1年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;542</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/互联网/不拘一格.jpg" alt="不拘一格">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">互联网</span>
                                <span class="green"></span>
                                <span class="card-classify">职场发展</span>
                                <p class="card-title">不拘一格</p>
                                <p class="card-content ellipsis2">
                                    网飞，一家市值超2000亿美元，全球付费订阅用户超1.9亿，业务版图遍布近200个国家和地区的商业巨头。
                                    作为创始人兼 CEO，里德·哈斯廷斯引领网飞实现了成功转型和强势增长，并坦言这得益于一套违反直觉的管理原则：
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;1年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;236</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/互联网/乔布斯传.jpg" alt="乔布斯传">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">互联网</span>
                                <span class="green"></span>
                                <span class="card-classify"></span>
                                <p class="card-title">乔布斯传</p>
                                <p class="card-content ellipsis2">
                                    这本乔布斯唯一授权的官方传记，在2011年上半年由美国出版商西蒙舒斯特对外发布出版消息以来，备受全球媒体和业界瞩目，
                                    这本书的全球出版日期最终确定为2011年11月21日，简体中文版也将同步上市。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;1年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;605</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/互联网/浪潮之巅.jpg" alt="浪潮之巅">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">互联网</span>
                                <span class="green"></span>
                                <span class="card-classify">社科新知</span>
                                <p class="card-title">浪潮之巅</p>
                                <p class="card-content ellipsis2">
                                    这不只是一部科技产业发展历史集……
                                    更是在这个智能时代，一部IT人非读不可，而非IT人也应该阅读的作品。
                                    一个企业的发展与崛起，绝非只是空有领导强人即可达成。任何的决策、同期的商业环境、各种能量的此消彼长，也在影响着企业的兴衰。《浪潮之巅》不只是一部历史书
                                    ，除了讲 述 科技顶尖企业的发展规律， 对于华尔街如何左右科技公司，以及金融风暴对科技产业的冲击，也多有着墨。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;185</span>
                            </div>
                        </li>
                    </ul>
                    <%--                    互联网结束--%>
                    <%--                    心理成长开始--%>
                    <ul>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/文学经典/你当像鸟飞往你的山.jpg" alt="你当像鸟飞往你的山">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">心理成长</span>
                                <span class="green"></span>
                                <span class="card-classify">文学经典</span>
                                <p class="card-title">你当像鸟飞往你的山</p>
                                <p class="card-content ellipsis2">
                                    人们只看到我的与众不同：一个十七岁前从未踏入教室的大山女孩，却戴上一顶学历的高帽，熠熠生辉。只有我知道自己的真面目：我来自一个极少有人能想象的家庭。我的童年由垃圾场的废铜烂铁铸成，那里没有读书声，只有起重机的轰鸣。不上学，不就医，是父亲要我们坚持的忠诚与真理。父亲不允许我们拥有自己的声音，我们的意志是他眼中的恶魔。哈佛大学，剑桥大学，哲学硕士，历史博士……我知道，像我这样从垃圾堆里爬出来的无知女孩，能取得如今的成就，应当感激涕零才对。但我丝毫提不起热情。我曾怯懦、崩溃、自我怀疑，内心里有什么东西腐烂了，
                                    恶臭熏天。直到我逃离大山，打开另一个世界。那是教育给我的新世界，那是我生命的无限可能。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;1年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;475</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/文学经典/斯通纳.jpg" alt="斯通纳">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">小说</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">斯通纳</p>
                                <p class="card-content ellipsis2">
                                    《斯通纳》讲述了生命中最重要的部分：爱，认同，怜悯，志业，傲骨，信任与死亡。
                                    一个勇者有过的失败不失意的人生：即使不能拥有完美的生活，所幸追求过完整的自我。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;90</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/心理成长/最好的告别.jpg"
                                     alt="最好的告别">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">心理成长</span>
                                <span class="green"></span>
                                <span class="card-classify">人文纪实</span>
                                <p class="card-title">最好的告别</p>
                                <p class="card-content ellipsis2">
                                    当独立、自助的生活不能再维持时，我们该怎么办？在生命临近终点的时刻，我们该和医生谈些什么？应该如何优雅地跨越生命的终点？对于这些问题，大多数人缺少清晰的观念，而只是把命运交由医学、技术和陌生人来掌控。影响世界的医生阿图•葛文德结合其多年的外科医生经验与流畅的文笔，讲述了一个个伤感而发人深省的故事，对在21世纪变老意味着什么进行了清醒、深入的探索。本书富有洞见、感人至深，
                                    并为我们提供了实用的路线图，告诉我们为了使生命最后的岁月有意义，我们可以做什么、应该做什么。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;208</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/文学经典/一个叫欧维的男人决定去死.png"
                                     alt="一个叫欧维的男人决定去死">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">心理成长</span>
                                <span class="green"></span>
                                <span class="card-classify">文学经典</span>
                                <p class="card-title">一个叫欧维的男人决定去死</p>
                                <p class="card-content ellipsis2">
                                    欧维（罗夫·拉斯加德 Rolf Lassgård
                                    饰）是一个刻板而又固执的老头，他的妻子半年前死于疾病，留他一人生活在这个混乱不堪的世界之中。每天早晨，欧维都会定时在社区里进行巡视，确认所有的车辆都停在应停的位置，呵斥违反规定私自驶入社区的车辆，赶走四处乱转破坏环境的猫狗，
                                    、在社区居民眼里，欧维是“来自地狱的恶邻”，可每个人都明白，这其实是欧维对于社区爱之深刻的表现。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;241</span>
                            </div>
                        </li>
                    </ul>
                    <%--                    心里成长结束--%>
                    <%--                    社科新知开始--%>
                    <ul>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/社科新知/时间简史.jpg" alt="时间简史">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">社科新知</span>
                                <span class="green"></span>
                                <span class="card-classify">科幻</span>
                                <p class="card-title">时间简史</p>
                                <p class="card-content ellipsis2">
                                    《时间简史》讲述是探索时间和空间核心秘密的故事，是关于宇宙本性的最前沿知识，包括我们的宇宙图像、空间和时间、膨胀的宇宙不确定性原理、基本粒子和自然的力、
                                    黑洞、黑洞不是这么黑、时间箭头等内容。第一版中的许多理论预言，后来在对微观或宏观宇宙世界观测中得到证实。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;1年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;311</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/社科新知/最好的告别.jpg" alt="最好的告别">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">社科新知</span>
                                <span class="green"></span>
                                <span class="card-classify">人文纪实</span>
                                <p class="card-title">最好的告别</p>
                                <p class="card-content ellipsis2">
                                    当独立、自助的生活不能再维持时，我们该怎么办？在生命临近终点的时刻，我们该和医生谈些什么？
                                    应该如何优雅地跨越生命的终点？对于这些问题，大多数人缺少清晰的观念，而只是把命运交由医学、技术和陌生人来掌控
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;209</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/社科新知/道德经.jpg" alt="道德经">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">社科新知</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">道德经</p>
                                <p class="card-content ellipsis2">
                                    《道德经》又称《道德真经》《老子》，分“道经”“德经”上下两篇，共八十一章。它不仅是道家（包括道教）代表作，而且还被尊为诸子之首、万经之王。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;328</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/社科新知/沉默的大多数.jpg" alt="沉默的大多数">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">社科新知</span>
                                <span class="green"></span>
                                <span class="card-classify">文学经典</span>
                                <p class="card-title">沉默的大多数</p>
                                <p class="card-content ellipsis2">
                                    这本杂文随笔集包括思想文化方面的文章，涉及知识分子的处境及思考，社会道德伦理，文化论争，国学与新儒家，民族主义等问题；包括从日常生活中发掘出来的各种真知灼见，涉及科学与邪道，女权主义等；包括对社会科学研究的评论，涉及性问题，生育问题，同性恋问题，社会研究的伦理问题和方法问题等
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;74</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/社科新知/上帝掷骰子吗：量子物理史话.jpg"
                                     alt="上帝掷骰子吗：量子物理史话">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">社科新知</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">上帝掷骰子吗：量子物理史话</p>
                                <p class="card-content ellipsis2">
                                    《上帝掷骰子吗》这本书是关于量子论的故事。量子论是一个极为奇妙的理论：从物理角度来说，它在科学家中间引起了最为激烈的争议和关注；
                                    从现实角度来说，它给我们的社会带来了无与伦比的变化和进步；从科学史角度来说，也几乎没有哪段历史比量子论的创立得到了更为彻底的研究。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;102</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/社科新知/史记.jpg" alt="史记">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">社科新知</span>
                                <span class="green"></span>
                                <span class="card-classify">人文纪实</span>
                                <p class="card-title">史记</p>
                                <p class="card-content ellipsis2">
                                    《史记》是我国第一部通史，是“二十四史”中最早的一部，也是最重要的一部史书。全书共一百三十篇。《史记》叙事，始自黄帝，下迄西汉太初，采用了综合性的叙事模式，囊括记言、纪事、编年、
                                    国别等形式，开创纪传体史书“纪、传、表、志”的体例。就内容而言，《史记》是对前代史学的一次总结；就体例而言，《史记》也是集大成之作。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;132</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/社科新知/朝花夕拾.jpg" alt="朝花夕拾">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">社科新知</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">朝花夕拾</p>
                                <p class="card-content ellipsis2">
                                    本书收作者1926年所作回忆散文十篇。1928年9月由北平未名社初版，列为作者所编的《未名新集》之一。
                                    1932年8月改由上海北新书局出版。作者生前共印行七版次。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;43</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/社科新知/艺术的故事.jpg" alt="艺术的故事">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">社科新知</span>
                                <span class="green"></span>
                                <span class="card-classify">文学经典</span>
                                <p class="card-title">艺术的故事</p>
                                <p class="card-content ellipsis2">
                                    《艺术的故事》概括地叙述了从最早的洞窟绘画到当今的实验艺术的发展历程，以阐明艺术史是“各种传统不断迂回、不断改变的历史，每一件作品在这历史中都既回顾过去又导向未来。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;67</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/社科新知/乡土中国.jpg" alt="乡土中国">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">社科新知</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">乡土中国</p>
                                <p class="card-content ellipsis2">
                                    豆瓣评分：9.2

                                    作者：费孝通

                                    著名社会学家费孝通教授，一生行行重行行，实地调查和考察总结中国农村经济发展的各种模式，写下了诸多不朽篇章。本书推出的是学界共认的中国乡土社会传统文化和社会结构理论研究的代表作《乡土中国》、《生育制度》、《乡土重建》和《皇权与绅权》四篇著作，可供社会学工作或教学、研究者参考。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;90</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/社科新知/万历十五年.jpg" alt="万历十五年">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">社科新知</span>
                                <span class="green"></span>
                                <span class="card-classify">人文纪实</span>
                                <p class="card-title">万历十五年</p>
                                <p class="card-content ellipsis2">
                                    万历十五年，亦即公元1587年，在西欧历史上为西班牙舰队全部出动征英的前一年；而在中国，这平平淡淡的一年中，发生了若干为历史学家所易于忽视的事件。这些事件，表面看来虽似末端小节，但实质上却是以前发生大事的症结，也是将在以后掀起波澜的机缘。在历史学家黄仁宇的眼中，其间的关系因果，恰为历史的重点，而我们的大历史之旅，也自此开始……
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;152</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/社科新知/人类简史.jpg" alt="人类简史">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">社科新知</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">人类简史</p>
                                <p class="card-content ellipsis2">
                                    十万年前，地球上至少有六种不同的人
                                    但今日，世界舞台为什么只剩下了我们自己？
                                    从只能啃食虎狼吃剩的残骨的猿人，到跃居食物链顶端的智人，
                                    从雪维洞穴壁上的原始人手印，到阿姆斯壮踩上月球的脚印，
                                    从认知革命、农业革命，到科学革命、生物科技革命，
                                    我们如何登上世界舞台成为万物之灵的？
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;126</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/社科新知/明朝那些事儿.jpg" alt="明朝那些事儿">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">社科新知</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">明朝那些事儿</p>
                                <p class="card-content ellipsis2">
                                    《明朝那些事儿》这篇文主要讲述的是从1344年到1644年这三百年间关于明朝的一些事情，以史料为基础，以年代和具体人物为主线，并加入了小说的笔法，对明朝十七帝和其他王公权贵和小人物的命运进行全景展示，尤其对官场政治、战争、帝王心术着墨最多，并加入对当时政治经济制度、人伦道德的演义。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;165</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/社科新知/历史深处的忧虑.jpg" alt="历史深处的忧虑">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">社科新知</span>
                                <span class="green"></span>
                                <span class="card-classify">人文纪实</span>
                                <p class="card-title">历史深处的忧虑</p>
                                <p class="card-content ellipsis2">
                                    美国的面积和中国差不多。和大多数留学生及新移民一样，当我们一脚踏上这块广袤的陌生土地时，最初落脚点的选择是十分偶然的。我们落在了一个普通的地方，居住的环境平常而宁静。
                                    周围的美国人老老少少都在辛勤劳作，过着普通得不能再普通的生活。要想谋出一番好的光景，对他们也不是一件轻而易举的事情。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;85</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/社科新知/寻路中国.jpg" alt="寻路中国">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">社科新知</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">寻路中国</p>
                                <p class="card-content ellipsis2">
                                    我叫彼得·海斯勒，是《纽约客》驻北京记者。这本书讲述了我驾车漫游中国大陆的经历。
                                    2001年夏天，我考取了中国驾照，在此后的七年中，我驾车漫游于中国的乡村与城市。这七年也正是中国汽车业的高速发展期，单在北京一地，每天申领驾照的新人就有一千多，
                                    其中有好几年，乘用车销售额的年增长率超过了百分之五十。仅仅两年多的时间，中国政府在乡村所铺设的公路里程数，就超过了此前半个世纪的总量。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;51</span>
                            </div>
                        </li>
                    </ul>
                    <%--                    社科新知结束--%>
                    <%--                    职场发展开始--%>
                    <ul>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/职场发展/定位.jpg" alt="定位">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">互联网</span>
                                <span class="green"></span>
                                <span class="card-classify">职场发展</span>
                                <p class="card-title">定位</p>
                                <p class="card-content ellipsis2">20多年前，美国《广告时代》杂志约请年轻的营销专家里斯和特劳特撰写一系列有关营销和广告新思维的文章，总标题就是“定位的时代”。系列文章刊载之后，引起全行业的轰动，定位成了营销界人人谈论的热闹话题，经作者之手送出的文章就达12万份之多，由此开创了营销理论全面创新的时代。</p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;6月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;200</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/职场发展/苏世民：我的经验与教训.jpg" alt="">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">职场发展</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">苏世民：我的经验与教训</p>
                                <p class="card-content ellipsis2">
                                    这是一部投资、管理类图书，是一部关于成功创业的书，还是一部处世哲学。
                                    苏世民创立的黑石集团是全球私募股权资产管理公司和房地产管理公司的巨头。截至2019年第三季度，黑石管理的资金总额超过5500亿美元。
                                    黑石集团人均利润是高盛的9倍，过去30余年平均回报率高达30%以上。美国排名前50的公司和养老基金中，70%以上都有黑石的投资。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;12月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;274</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/职场发展/基业长青.jpg" alt="基业长青">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">职场发展</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">基业长青</p>
                                <p class="card-content ellipsis2">
                                    如何建立一个伟大且长盛不衰的公司？有思想的人们早已经厌倦了“年度流行语”般稍纵即逝的管理概念，他们渴望获得能够经受时间考验的管理思想。
                                    正如柯林斯和波勒斯所写：“这不是一本描写能力卓越、高瞻远瞩的领导人的书，也与高瞻远瞩的产品概念、高瞻远瞩的产品或高瞻远瞩的市场分析无关，甚至不谈及拥有某种公司展望。这本书所谈的问题更为重要、长久和真实。这是一本有关高瞻远瞩公司的书。”
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;12月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;134</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/职场发展/奈飞文化手册.jpg" alt="奈飞文化手册">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">职场发展</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">奈飞文化手册</p>
                                <p class="card-content ellipsis2">
                                    一本对奈飞文化进行深入解读的力作。2009年，奈飞公开发布了一份介绍企业文化的PPT文件，在网上累计下载量超过1500万次，
                                    被Facebook的CFO谢丽尔·桑德伯格称为“硅谷重要文件”。本书是奈飞前CHO，PPT的主要创作者之一帕蒂·麦考德对这份PPT文件的深度解读。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;12月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;111</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/职场发展/掌控习惯.jpg" alt="掌控习惯">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">职场发展</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">掌控习惯</p>
                                <p class="card-content ellipsis2">
                                    为什么“习惯改变命运”？因为个人40%~50%的行为取决于无意识的习惯。
                                    习惯形成需要4步：提示→渴求→反应→奖赏。提示触发渴求，渴求激发反应，而反应则提供满足渴求的奖赏，并最终与提示相关联。这4个步骤一起形成了一个神经反馈回路——提示、渴求、反应、奖赏；提示、渴求、反应、奖赏——并最终让你养成自然而然的习惯，由此构成完整的习惯循环。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;12月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;199</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/职场发展/影响力.jpg" alt="影响力">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">职场发展</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">影响力</p>
                                <p class="card-content ellipsis2">
                                    自出版以来，《影响力》就一直是畅销佳作。由于它的影响，说服得以成为一门科学。无论你是普通人还是为某一产品或事业观点游说的人，这都是一本基本的必读书，是你理解他人心理的基石。
                                    心理学家罗伯特·西奥迪尼为我们解释了为什么有些人具有说服力，而我们总是容易上当受骗。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;12月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;241</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/职场发展/卓有成效的管理者.jpg" alt="卓有成效的管理者">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">职场发展</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">卓有成效的管理者</p>
                                <p class="card-content ellipsis2">
                                    “现代管理学之父”彼得·德鲁克提出，在知识社会中“管理者”的全新定义——
                                    “每一个愿意凭借专业、积极贡献、勇于担当责任的人都是管理者，即使他没有所谓的职权，
                                    只要他能为组织做出贡献。所有负责行动和决策而又有助于提高组织工作效能的人，都要像管理者一样工作和思考。”
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;12月前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;122</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/职场发展/金字塔原理.jpg" alt="金字塔原理">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">职场发展</span>
                                <span class="green"></span>
                                <span class="card-classify">
                                    视频书
                                </span>
                                <p class="card-title">金字塔原理</p>
                                <p class="card-content ellipsis2">
                                    《金字塔原理》介绍了一种能清晰地展现思路的高效方法，是训练思考、使表达呈现逻辑性的实用宝典。金字塔原理能将零散的观点有序组织起来，化繁为简，适合所有需要精进思考、分析、表达能力的读者。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;1年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;543</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/职场发展/不拘一格.jpg" alt="不拘一格">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">职场发展</span>
                                <span class="green"></span>
                                <span class="card-classify">互联网</span>
                                <p class="card-title">不拘一格</p>
                                <p class="card-content ellipsis2">
                                    网飞，一家市值超2000亿美元，全球付费订阅用户超1.9亿，业务版图遍布近200个国家和地区的商业巨头。
                                    作为创始人兼 CEO，里德·哈斯廷斯引领网飞实现了成功转型和强势增长，并坦言这得益于一套违反直觉的管理原则：
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;1年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;237</span>
                            </div>
                        </li>
                        <li class="recommend-card">
                            <div class="card-img">
                                <img src="./images/recommend/职场发展/高效能人士的7个习惯.jpg" alt="高效能人士的7个习惯">
                                <span class="iconfont icon-zhuanjibofang"></span>
                            </div>
                            <div>
                                <span class="blue"></span>
                                <span class="card-classify">职场发展</span>
                                <span class="green"></span>
                                <span class="card-classify">视频书</span>
                                <p class="card-title">高效能人士的7个习惯</p>
                                <p class="card-content ellipsis2">
                                    “以终为始”的一个原则基础是“任何事都是两次创造而成”。 我们做任何事都是先在头脑中构思，即智力上的或第一次的创造( Mental/First Creation)，然后付诸实践，即体力上的或第二次的创造( Physical/Second Creation). 以终为始的原则适用范围极广。明白了两次创造的道理，把制定目标看得与实践本身同样重要，影响圈就会日益扩大，反之就会日益缩小。 换句话说，习惯一谈的是“你是创造者”，习惯二谈的是“第一次创造”。
                                </p>
                                <span class="iconfont icon-yarn"></span>
                                <span class="iconfont icon-time">&nbsp;2年前</span>
                                <span class="iconfont icon-yanjing1">&nbsp;332</span>
                            </div>
                        </li>
                    </ul>
                    <%--                    职场发展结束--%>
                </div>
                <%--                好书推荐列表结束--%>
            </div>

            <%--    我的订单开始--%>
            <div class="order section" id="order">
                <a href="#">
                    <img src="./images/我的订单.png" alt="我的订单" class="order-title">
                </a>
            </div>
            <%--    我的订单结束--%>
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