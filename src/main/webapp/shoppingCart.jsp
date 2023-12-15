<%@ page import="com.zzt.goodreads.entity.Order" %>
<%@ page import="com.zzt.goodreads.entity.OrderItem" %>
<%@ page import="com.zzt.goodreads.service.OrderService" %>
<%@ page import="com.zzt.goodreads.service.OrderItemService" %>
<%@ page import="com.zzt.goodreads.service.BookService" %>
<%@ page import="com.zzt.goodreads.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <title>我的购物车</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: "微软雅黑";
            list-style: none;
            color: #C6C6C6;
            text-decoration: none;
            font-size: 14px;
        }

        body {
            background: #000000;
            height: 100%;
        }

        .header {
            font-size: 12px;
            border-bottom: 2px solid #66C5FF;
            background-color: #262830;
            z-index: 20;
            height: 100px;
        }

        .header .container {
            width: 1226px;
            margin-right: auto;
            margin-left: auto;
        }

        .header .container .header-logo {
            width: 93px;
        }

        .header-logo img {
            width: 210px;
            height: 101px;
            background-size: 125px 72px;
            padding-left: 20%;
            display: inline;

        }

        .header-title {
            margin-top: 26px;
            font-size: 12px;
        }

        .header-title h2 {
            display: inline;
            position: absolute;
            right: 20%;
            top: 5%;
            color: #E0E0E0;
        }


        .link {
            padding: 0 5px;
            color: #757575;
            text-decoration: none;
        }

        .hid {
            overflow: hidden;
        }

        .left {
            float: left;
        }

        .box_head {
            position: relative;
            margin: 0;
            height: 50px;
            font-size: 30px;
            font-weight: 400;
        }

        .box_head span {
            position: absolute;
            top: -20px;
            left: 372px;
            height: 40px;
            width: 482px;
            line-height: 40px;
            text-align: center;
            display: block;
            font-size: 30px;
        }

        #box {
            width: 1240px;
            margin: 20px auto;
        }

        #box ul {
            margin-right: -14px;
            overflow: hidden;
        }

        #box li {
            width: 234px;
            float: left;
            margin-right: 14px;
            padding: 24px 0 20px;
            background: #262830;
            text-align: center;
            position: relative;
            cursor: pointer;
            margin-bottom: 14px;
        }

        .pro_img {
            width: 150px;
            height: 150px;
            margin: 0 auto 18px;
        }

        .pro_name {
            display: block;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
            font-weight: 400;
        }

        .pro_name a {
            color: rgb(255, 255, 255)
        }

        .pro_price {
            color: #66C5FF;
            margin: 10px;
        }

        .pro_rank {
            color: #c6c6c6;
            margin: 10px;
        }

        #box li:hover .add_btn {
            display: block;
        }

        #box li:hover .pro_rank {
            opacity: 0;
        }

        #box li .add_btn:hover {
            background-color: #66C5FF;
            color: rgb(255, 255, 255);
        }



        .add_btn {
            height: 22px;
            position: absolute;
            width: 122px;
            bottom: 28px;
            left: 50%;
            margin-left: -61px;
            line-height: 22px;
            display: none;
            color: #66C5FF;
            font-size: 12px;
            border: 1px solid #66C5FF;
        }

        .car {
            width: 1240px;
            margin: 20px auto;
            background: #262830;
        }

        .car .check {
            width: 50px;

        }

        .car .check i {
            color: #fff;
            display: inline-block;

            width: 18px;
            height: 18px;
            line-height: 18px;
            border: 1px solid #000000;
            margin-left: 24px;
            background-color: #E0E0E0;
            font-size: 16px;
            text-align: center;
            vertical-align: middle;
            position: relative;
            top: -1px;
            cursor: pointer;
            font-family: "iconfont";
        }

        .i_acity {

            border-color: #66C5FF !important;
            background-color: #66C5FF !important;
        }

        .car .img {
            width: 190px;
        }

        .car .img img {
            display: block;
            width: 80px;
            height: 80px;
            margin: 3px auto;
        }

        .car .name {
            width: 300px;
        }

        .car .name span {
            line-height: 1;
            margin-top: 8px;
            margin-bottom: 8px;
            font-size: 18px;
            font-weight: normal;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }

        .car .price {
            width: 144px;
            text-align: right;
            padding-right: 84px;
        }

        .car .price span {
            color: #66C5FF;
            font-size: 16px;
        }

        .car .number {
            width: 150px;
        }

        .car .subtotal {
            width: 130px;

        }

        .car .ctrl {
            width: 105px;
            padding-right: 25px;
            text-align: center;
        }

        .car .ctrl a {
            font-size: 20px;
            cursor: pointer;
            display: block;
            width: 26px;
            height: 26px;
            margin: 30px auto;
            line-height: 26px;
        }

        .car .ctrl a:hover {
            color: #FFF;
            background: #66C5FF;
            border-radius: 50%;
        }

        .head_row {
            height: 70px;
            line-height: 70px;
        }

        .head_row,
        .row {
            border-bottom: solid 1px #000000;
        }

        .row {
            height: 86px;
            line-height: 86px;
            padding: 15px 0;
            margin: 0px;
        }

        #sum_area {
            width: 1240px;
            height: 60px;
            background: #262830;
            margin: 20px auto;
        }

        #sum_area #pay {
            width: 250px;
            height: 60px;
            text-align: center;
            float: right;
            line-height: 60px;
            font-size: 19px;
            background: #66C5FF;
            color: white;
        }

        #sum_area #pay_amout {
            width: 250px;
            height: 60px;
            text-align: center;
            float: right;
            line-height: 60px;
            font-size: 16px;
            color: #66C5FF;
        }

        #sum_area #pay_amout #price_num {
            width: 100px;
            height: 60px;
            font-size: 25px;
            color: #66C5FF;
            /*	float: left;*/
        }

        .item_count_i {
            height: 85px;
            width: 10%;
            /*border: 1px solid black;*/
            float: left;
            margin-right: 25px;
        }

        .num_count {
            width: 150px;
            height: 40px;
            border: 1.2px solid #E0E0E0;
            float: right;
            margin-top: 21px;

        }

        .count_i {
            width: 30%;
            height: 40px;
            line-height: 40px;
            float: left;
            text-align: center;
            font-size: 21px;
            color: #747474;
        }

        .count_i:hover {
            width: 30%;
            height: 40px;
            line-height: 40px;
            float: left;
            text-align: center;
            font-size: 21px;
            color: #747474;
            background: #E0E0E0;
            cursor: pointer;
        }

        .c_num {
            width: 40%;
            height: 40px;
            line-height: 40px;
            float: left;
            text-align: center;
            font-size: 16px;
            color: #747474;
        }

        .count_d {
            width: 30%;
            height: 40px;
            line-height: 40px;
            float: left;
            text-align: center;
            font-size: 25px;
            color: #747474;
        }

        .count_d:hover {
            width: 30%;
            height: 40px;
            line-height: 40px;
            float: left;
            text-align: center;
            font-size: 25px;
            color: #747474;
            background: #E0E0E0;
            cursor: pointer;
        }

        .i_acity2 {
            border-color: #66C5FF !important;
            background-color: #66C5FF !important;
        }
    </style>
</head>
<body>
<form action="/cart">
    <div class="header">
        <div class="container">
            <div class="header-logo">
                <img src="./images/GoodReads.png" alt="maomao">
            </div>
            <div class="header-title" id="J_miniHeaderTitle">
                <h2 id="h4" style="font-size: 30px;">我的购物车</h2>
            </div>
        </div>
    </div>


    <div id="car" class="car">

        <div class="head_row hid">
            <div class="check left"> <i onclick="checkAll()">√</i></div>
            <div class="img left"> 全选</div>
            <div class="name left">商品名称</div>
            <div class="price left">单价</div>
            <div class="number left">数量</div>
            <div class="subtotal left">小计</div>
            <div class="ctrl left">操作</div>
        </div>
    </div>
    <div id="sum_area">
        <div id="pay">去结算</div>
        <div id="pay_amout">合计：<span id="price_num">0</span>元</div>
    </div>
    <div id="box">
        <ul>
        </ul>
    </div>

</form>

</body>

<script>
    <%
       BookService bookService = new BookService();
       List<Book> books = bookService.selectAll();
        request.setAttribute("books", books);
    %>
    window.onload = function () {
        var aData = [
        <c:forEach items="${books}" var="book">
            {
            "imgUrl": "./images/cover/${book.bookCover}",
            "proName": "${book.bookName}",
            "proPrice": "${book.bookPrice}",
            "proComm": "${book.comment}"
        },
        </c:forEach>
            {
                "imgUrl": "images/cover/史记.webp",
                "proName": " 史记 ",
                "proPrice": "19.9",
                "proComm": "1.2"
            },
            {
                "imgUrl": "images/cover/百年孤独.webp",
                "proName": "  百年孤独 ",
                "proPrice": "45",
                "proComm": "0.6"
            },
            {
                "imgUrl": "images/cover/水浒传.webp",
                "proName": "  水浒传  ",
                "proPrice": "207",
                "proComm": "0.3"
            },
            {
                "imgUrl": "images/cover/子不语.webp",
                "proName": " 子不语 ",
                "proPrice": "199",
                "proComm": "7.2"
            }
        ];
        var oBox = document.getElementById("box");
        var oCar = document.getElementById("car");
        var oUl = document.getElementsByTagName("ul")[0];

        for (var i = 0; i < aData.length; i++) {
            var oLi = document.createElement("li");
            var data = aData[i];

            oLi.innerHTML += '<div class="pro_img"><img src="' + data["imgUrl"] + '" width="150" height="150"></div>';
            oLi.innerHTML += '<h3 id="h3" class="pro_name"><a rel="nofollow" href="#">' + data["proName"] + '</a></h3>';
            oLi.innerHTML += '<p class="pro_price">' + data["proPrice"] + '元</p>';
            oLi.innerHTML += '<p class="pro_rank">' + data["proComm"] + '万人好评</p>';
            oLi.innerHTML += '<div class="add_btn">加入购物车</div>';
            oUl.appendChild(oLi);

        }
        var aBtn = getClass(oBox, "add_btn");//获取box下的所有添加购物车按钮
        var number = 0;//初始化商品数量
        for (var i = 0; i < aBtn.length; i++) {
            number++;
            aBtn[i].index = i;
            aBtn[i].onclick = function () {
                var oDiv = document.createElement("div");
                var data = aData[this.index];
                oDiv.className = "row hid";
                oDiv.innerHTML += '<div class="check left"> <i class="i_check" id="i_check" onclick="i_check()" >√</i></div>';
                oDiv.innerHTML += '<div class="img left"><img src="' + data["imgUrl"] + '" width="80" height="80"></div>';
                oDiv.innerHTML += '<div class="name left"><span>' + data["proName"] + '</span></div>';
                oDiv.innerHTML += '<div class="price left"><span>' + data["proPrice"] + '元</span></div>';
                oDiv.innerHTML += '<div class="item_count_i"><div class="num_count"><div class="count_d">-</div><div class="c_num">1</div><div class="count_i">+</div></div> </div>'
                oDiv.innerHTML += '<div class="subtotal left"><span>' + data["proPrice"] + '元</span></div>'
                oDiv.innerHTML += '<div class="ctrl left"><a rel="nofollow" href="javascript:;">×</a></div>';
                oCar.appendChild(oDiv);
                var flag = true;
                var check = oDiv.firstChild.getElementsByTagName("i")[0];
                check.onclick = function () {
                    // console.log(check.className);
                    if (check.className == "i_check i_acity") {
                        check.classList.remove("i_acity");

                    } else {
                        check.classList.add("i_acity");
                    }
                    getAmount();
                }
                var delBtn = oDiv.lastChild.getElementsByTagName("a")[0];
                delBtn.onclick = function () {
                    var result = confirm("确定删除吗?");
                    if (result) {
                        oCar.removeChild(oDiv);
                        number--;
                        getAmount();
                    }
                }
                var i_btn = document.getElementsByClassName("count_i");
                for (var k = 0; k < i_btn.length; k++) {
                    i_btn[k].onclick = function () {
                        bt = this;
                        //获取小计节点
                        at = this.parentElement.parentElement.nextElementSibling;
                        //获取单价节点
                        pt = this.parentElement.parentElement.previousElementSibling;
                        //获取数量值
                        node = bt.parentNode.childNodes[1];
                        console.log(node);
                        num = node.innerText;
                        num = parseInt(num);
                        num++;
                        node.innerText = num;
                        //获取单价
                        price = pt.innerText;
                        price = price.substring(0, price.length - 1);
                        //计算小计值
                        at.innerText = price * num + "元";
                        //计算总计值
                        getAmount();
                    }
                }
                //获取所有的数量减号按钮
                var d_btn = document.getElementsByClassName("count_d");
                for (k = 0; k < i_btn.length; k++) {
                    d_btn[k].onclick = function () {
                        bt = this;
                        //获取小计节点
                        at = this.parentElement.parentElement.nextElementSibling;
                        //获取单价节点
                        pt = this.parentElement.parentElement.previousElementSibling;
                        //获取c_num节点
                        node = bt.parentNode.childNodes[1];
                        num = node.innerText;
                        num = parseInt(num);
                        if (num > 1) {
                            num--;
                        }
                        node.innerText = num;
                        //获取单价
                        price = pt.innerText;
                        price = price.substring(0, price.length - 1);
                        //计算小计值
                        at.innerText = price * num + "元";
                        //计算总计值
                        getAmount();
                    }
                }

                delBtn.onclick = function () {
                    var result = confirm("确定删除吗?");
                    if (result) {
                        oCar.removeChild(oDiv);
                        number--;
                        getAmount();
                    }
                }

            }
        }
    }

    function getClass(oBox, tagname) {
        var aTag = oBox.getElementsByTagName("*");
        var aBox = [];
        for (var i = 0; i < aTag.length; i++) {
            if (aTag[i].className == tagname) {
                aBox.push(aTag[i]);
            }
        }
        return aBox;
    }


    var index = false;
    function checkAll() {
        var choose = document.getElementById("car").getElementsByTagName("i");
        // console.log(choose);
        if (choose.length != 1) {
            for (i = 1; i < choose.length; i++) {
                if (!index) {
                    choose[0].classList.add("i_acity2")
                    choose[i].classList.add("i_acity");
                } else {
                    choose[i].classList.remove("i_acity");
                    choose[0].classList.remove("i_acity2")
                }
            }
            index = !index;
        }
        getAmount();
    }



    //进行价格合计
    function getAmount() {
        // console.log(ys);
        ns = document.getElementsByClassName("i_acity");
        console.log(ns);
        sum = 0;
        //选中框
        document.getElementById("price_num").innerText = sum;
        for (y = 0; y < ns.length; y++) {
            //小计
            amount_info = ns[y].parentElement.parentElement.lastElementChild.previousElementSibling;
            num = parseInt(amount_info.innerText);
            sum += num;
            document.getElementById("price_num").innerText = sum;
        }
    }

</script>
</html>
