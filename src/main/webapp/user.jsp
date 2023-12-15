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
<div id="header">
    <!-- 导航栏 -->
    <div class="nav-box">
        <ul class="item-box fl">
            <li class="nav-item" style="padding: 0 16px 0 0;"><a href="${pageContext.request.contextPath}/index">猫猫阅读首页</a></li>
            <li class="nav-item"><a href="index.jsp#hot">热销书籍</a></li>
            <li class="nav-item"><a href="index.jsp#classify">书籍分类</a></li>
            <li class="nav-item new"><a href="index.jsp#recommend">好书推荐</a></li>
        </ul>

        <div class="search fl">
            <div>
                <input type="text">
                <span class="iconfont icon-sousuo"></span>
            </div>

        </div>

    </div>
</div>
<!-- header 区域结束 -->

<div class="main">
    <div class="bg-other user-head-info">
        <div class="user-info clearfix" style="padding-bottom: 48px;">
            <div class="user-pic">
                <div class="user-pic-bg">
                    <img class="img" src="./images/avatar/${user.avatar}">
                </div>
            </div>
            <div class="user-info-right">
                <h3 class="user-name clearfix">
                    <span>${user.userName}</span>
                </h3>

                <p class="about-info">
                    <span>${user.email}</span>
                </p>
            </div>
            <div class="study-info clearfix">

                <div class="item follows"><a href="${pageContext.request.contextPath}/login.jsp" class="set-btn">
                    <i class="iconfont icon-a-shezhi-shucaidanshezhi"></i>退出登录</a></div>

            </div>
        </div>
    </div>

    <div class="wrap">
        <div class="slider">
            <ul>
                <li class="li-active">
                    <a href="#" class="active">
                        <i class="iconfont icon-liebiao color"></i><span>基础信息</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="iconfont icon-dingdan"></i><span>我的订单</span>
                    </a>
                </li>

                <li>
                    <a href="#">
                        <i class="iconfont icon-guanzhu"></i><span>我的关注</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="iconfont icon-shoucang"></i><span>我的收藏</span>
                    </a>
                </li>
            </ul>

        </div>
    </div>

    <div class="u-container">
        <div class="c-tab clearfix">
            <div class="user-total" >
                <form action="/user" method="post">
                    <a href="" class="sort-item active">个人基本信息</a>
                    <div class="user user-info1">
                        <label>账户名：</label>
                        <input type="text" value="${user.userName}" name="userName">
                        <label>账户ID：</label>
                        <input type="text" value="${user.userId}" name="userId">
                    </div>
                    <div class="user  user-info2">
                        <label>姓名：</label>
                        <input type="text" value="${user.name}" name="name">
                        <label>邮箱：</label>
                        <input type="text" value="${user.email}" name="email">
                    </div>
                    <div class="user-info3">
                        <label>手机号：</label>
                        <input type="text" value="${user.phone}" name="phone">
                        <label>地址：</label>
                        <input type="text" value="${user.address}" name="address">
                    </div>
                    <button class="user-submit">保存</button>
                </form>
            </div>
        </div>
        <div class="all-course-main">
            <div class="not-conts">
            </div>
            <div class="recomment-body">
                <div>
                    <div class="title-box">
                        <span>书籍推荐</span>
                        <a href="#" class="more">
                            查看更多>>
                        </a>
                    </div>
                    <ul>
                        <li> <a href="" class="recommend-item">
                            <div class="img l"> <img width="240px" height="180px" src="./images/cover/教父.webp">
                            </div>
                            <div class="content">
                                <p class="title">《教父》</p>
                                <div class="info">

                                    <span class="iconfont icon-guanzhu">&nbsp;2365</span>
                                    <span class="iconfont icon-shuping">&nbsp;99</span>
                                    <span class="iconfont icon-liulanliang">6542</span>
                                </div>
                            </div>
                        </a>
                        </li>
                        <li> <a href="" class="recommend-item">
                            <div class="img l"> <img width="240px" height="180px" src="./images/cover/霍乱时期的爱情.webp">
                            </div>
                            <div class="content">
                                <p class="title">《霍乱时期的爱情》</p>
                                <div class="info">

                                    <span class="iconfont icon-guanzhu">&nbsp;1235</span>
                                    <span class="iconfont icon-shuping">&nbsp;63</span>
                                    <span class="iconfont icon-liulanliang">3256</span>
                                </div>
                            </div>
                        </a>
                        </li>
                        <li> <a href="" class="recommend-item">
                            <div class="img l"> <img width="240px" height="180px"  src="./images/cover/活着.webp">
                            </div>
                            <div class="content">
                                <p class="title">《活着》</p>
                                <div class="info">

                                    <span class="iconfont icon-guanzhu">&nbsp;1659</span>
                                    <span class="iconfont icon-shuping">&nbsp;30</span>
                                    <span class="iconfont icon-liulanliang">4521</span>
                                </div>
                            </div>
                        </a>
                        </li>
                        <li> <a href="" class="recommend-item">
                            <div class="img l"> <img width="240px" height="180px" src="./images/cover/梦的解析.webp">
                            </div>
                            <div class="content">
                                <p class="title">《梦的解析》</p>
                                <div class="info">

                                    <span class="iconfont icon-guanzhu">&nbsp;986</span>
                                    <span class="iconfont icon-shuping">&nbsp;12</span>
                                    <span class="iconfont icon-liulanliang">2265</span>
                                </div>
                            </div>
                        </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    const slider = document.querySelectorAll(".slider ul a");
    const sliderli = document.querySelectorAll(".slider ul li")
    const color = document.querySelectorAll(".slider a i")

    for (let i = 0; i < slider.length; i++) {
        slider[i].onclick = function () {
            for (let j = 0; j < slider.length; j++) {
                slider[j].className = "";
                sliderli[j].className = "";
                color[j].classList.remove("color")
            }
            // 给当前选中的a和ul添加样式
            slider[i].className = "active";
            sliderli[i].className = "li-active";
            color[i].classList.add("color")

        }
    }

</script>

</body>
</html>
