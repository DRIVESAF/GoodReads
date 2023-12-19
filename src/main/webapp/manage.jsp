<%@ page import="com.zzt.goodreads.service.BookService" %>
<%@ page import="com.zzt.goodreads.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <title>管理员首页-图书管理</title>
    <link rel="stylesheet" href="css/manage.css">
    <link rel="stylesheet" href="css/pull.css">
</head>

<body class="w">
<form action="/book">
    <div class="nav">
        <h3 class="title">
            <a href="javascript:" class="active">书籍管理</a>
            <a href="javascript:">用户管理</a>
            <a href="javascript:">书籍分类管理</a>
            <a href="javascript:">订单管理</a>
        </h3>
    </div>

    <!--搜索表单-->
    <div class="search">

        <div class="author">
            <input placeholder="作者">
        </div>

        <div class="bookName">
            <input placeholder="书名" name="bookName">
        </div>
        <button>查询</button>
        <input type="button" value="删除" class="del">
    </div>

    <!--按钮-->

    <input id="show-Popup" onclick="showPopup()" type="button" value="新增">
    <div id="overlay">
        <div class="popup">
            <p class="popup_title">添加用户</p>
            <p class="popup_content">
            <div class="container">
                <form action="${pageContext.request.contextPath}/addUserServlet" method="post">
                    <div class="form-group">
                        <label for="name">用户名：</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="请输入用户名">
                    </div>

                    <div class="form-group">
                        <label for="uid">年龄：</label>
                        <input type="text" class="form-control" id="uid" name="uid" placeholder="请输入年龄">
                    </div>

                    <div class="form-group">
                        <label for="phone">手机号：</label>
                        <input type="text" class="form-control" name="phone" id="phone" placeholder="请输入手机号"/>
                    </div>

                    <div class="form-group">
                        <label for="email">邮箱：</label>
                        <input type="text" class="form-control" name="email"  id="email" placeholder="请输入邮箱地址"/>
                    </div>

                    <div class="form-group">
                        <label >是否为管理员：</label>
                        <input type="radio" name="true" value="true" checked="checked"/>是
                        <input type="radio" name="false" value="false" />否
                    </div>
                </form>
            </div>
            </p>
            <div class="popup_btn">
                <input class="cancelBtn" onclick="hidePopup()" type="button" value="取消">
                <input class="confirmBtn" onclick="hidePopup()" type="button" value="确认">
            </div>
        </div>
    </div>

    <!--添加数据对话框表单-->
    <table width="600" border="1" cellspacing="0">
        <thead>
        <tr>
            <th>编号</th>
            <th>作者</th>
            <th>书名</th>
            <th>价格</th>
            <th>书籍类型</th>
            <th>库存</th>
        </tr>


        </thead>
        <tbody id="tbMain">
        <%
            BookService bookService = new BookService();
            Book book = (Book) request.getSession().getAttribute("book");
            request.setAttribute("book", book);

            List<Book> books = bookService.selectAll();
            request.setAttribute("books", books);
        %>
        <% if(book == null) { %>
        <c:forEach items="${books}" var="book">
            <tr class="a">
                <td>
                        ${book.bookId}
                </td>
                <td>
                        ${book.author}
                </td>
                <td>
                        ${book.bookName}
                </td>
                <td>
                        ${book.bookPrice}
                </td>
                <td>
                        ${book.bookType}
                </td>
                <td>
                        ${book.bookStork}
                </td>

            </tr>
        </c:forEach>
        <%} else {%>
        <tr class="b">
            <td>
                ${book.bookId}
            </td>
            <td>
                ${book.author}
            </td>
            <td>
                ${book.bookName}
            </td>
            <td>
                ${book.bookPrice}
            </td>
            <td>
                ${book.bookType}
            </td>
            <td>
                ${book.bookStork}
            </td>

        </tr>
        <%} %>
        </tbody>
    </table>
</form>

</body>
<script type="text/javascript">
    var btnDel = document.getElementsByClassName("dele")
    var a  = document.getElementsByClassName("a")
    var b = document.getElementsByClassName("b")
    window.onload = function () {
        btnDel.οnclick = function () {
           <%
             bookService.delete(book);
           %>

        }
    }

    function showPopup(){
        var overlay = document.getElementById("overlay");
        overlay.style.display = "block";
    }
    function hidePopup(){
        var overlay = document.getElementById("overlay");
        overlay.style.display = "none";
    }
</script>
</html>
