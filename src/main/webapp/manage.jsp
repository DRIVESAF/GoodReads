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
<h1>图书管理</h1>

    <div class="nav">
        <h3 class="title">
            <a href="javascript:" class="active">图书管理</a>
            <a href="manager-user.jsp">用户管理</a>
        </h3>
    </div>

    <!--搜索表单-->
    <div class="search">
        <form action="/book">
        <div class="author">
            <input placeholder="作者">
        </div>

        <div class="bookName">
            <input placeholder="书名" name="bookName">
        </div>
            &nbsp;&nbsp;&nbsp;
        <button>查询</button>
            <form action="/deleteBook">
                &nbsp;&nbsp;&nbsp;<button>删除</button>
            </form>
        </form>

    </div>

    <!--按钮-->

    <input id="show-Popup" onclick="showPopup()" type="button" value="新增">
    <form action="/addBook">
        <div id="overlay">
            <div class="popup">
                <p class="popup_title">添加书籍</p>
                <div class="container">
                    <div class="form-group">
                        <label for="name" style="display:inline-block;width:100px;text-align:left">作者：</label>
                        <input type="text" class="form-control" id="name" name="author" placeholder="请输入作者">
                    </div>

                    <div class="form-group">
                        <label for="book" style="display:inline-block;width:100px;text-align:left">书名：</label>
                        <input type="text" class="form-control" id="book" name="bookName" placeholder="请输入书名">
                    </div>

                    <div class="form-group">
                        <label for="price" style="display:inline-block;width:100px;text-align:left">价格：</label>
                        <input type="text" class="form-control" id="price" name="bookPrice" placeholder="请输入价格"/>
                    </div>

                    <div class="form-group">
                        <label for="stock" style="display:inline-block;width:100px;text-align:left">库存：</label>
                        <input type="text" class="form-control" id="stock" name="stock" placeholder="请输入库存"/>
                    </div>

                    <div class="form-group">
                        <label for="stock" style="display:inline-block;width:100px;text-align:left">类型：</label>
                        <input type="text" class="form-control" id="type" name="type" placeholder="请输入类型"/>

                    </div>
                </div>
                <div class="popup_btn">
                    <input class="cancelBtn" onclick="hidePopup()" type="button" value="取消">

                    <button class="confirmBtn"  >确认</button>
                </div>
            </div>
        </div>
    </form>

<form action="/book">
    <!--添加数据对话框表单-->
    <table>
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
                        《${book.bookName}》
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
        <% } %>
        </tbody>
    </table>
</form>

</body>
<script type="text/javascript">
    var a  = document.getElementsByClassName("a")
    var b = document.getElementsByClassName("b")
    var overlay = document.getElementById("overlay");

    function showPopup(){
        overlay.style.display = "block";
    }
    function hidePopup(){
        overlay.style.display = "none";
    }

</script>
</html>
