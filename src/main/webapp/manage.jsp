<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="./css/manage.css">
</head>

<body class="w">
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
    <span>书籍分类</span>
    <select class="sel">
        <option label="小说"></option>
        <option label="哲学"></option>
        <option label="科学"></option>
        <option label="历史"></option>
    </select>

    <div class="author">
        <input placeholder="作者" name="author">
    </div>

    <div class="bookName">
        <input placeholder="书名" name="bookName">
    </div>


    <button>查询</button>

</div>

<!--按钮-->

<div class="opr">
    <button class="add">新增</button>
</div>

<!--添加数据对话框表单-->
<table width="600" border="1" cellspacing="0">
    <thead>
    <tr>
        <th>编号</th>
        <th>作者</th>
        <th>书名</th>
        <th>库存</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="tbMain"></tbody>
</table>
</body>
<script type="text/javascript">

    //模拟一段JSON数据，实际要从数据库中读取
    var per = [
        { id: 0o01, author: '马里奥·普佐', bookname: '教父', sto: '1' },
        { id: 0o02, author: '加西亚·马尔克斯', bookname: '霍乱时期的爱情', sto: '1' },
        { id: 0o03, author: '王阳明', bookname: '传习录', sto: '1' }
    ];

    window.onload = function () {
        var tbody = document.getElementById('tbMain');

        for (var i = 0; i < per.length; i++) { //遍历一下json数据
            var trow = getDataRow(per[i]); //定义一个方法,返回tr数据
            tbody.appendChild(trow);
        }

    }

    function getDataRow(h) {
        var row = document.createElement('tr'); //创建行

        var idCell = document.createElement('td'); //创建第一列id
        idCell.innerHTML = h.id; //填充数据
        row.appendChild(idCell); //加入行  ，下面类似

        var authorCell = document.createElement('td');//创建第二列author
        authorCell.innerHTML = h.author;
        row.appendChild(authorCell);

        var booknameCell = document.createElement('td');//创建第三列bookname
        booknameCell.innerHTML = h.bookname;
        row.appendChild(booknameCell);

        var stoCell = document.createElement('td');//创建第四列sto
        stoCell.innerHTML = h.sto;
        row.appendChild(stoCell);

        //到这里，json中的数据已经添加到表格中，下面为每行末尾添加删除按钮

        var delCell = document.createElement('td');//创建第四列，操作列
        row.appendChild(delCell);
        var btnDel = document.createElement('input'); //创建一个input控件
        btnDel.setAttribute('type', 'button'); //type="button"
        btnDel.setAttribute('value', '删除');

        //删除操作
        btnDel.οnclick = function () {
            if (confirm("确定删除这一行嘛？")) {
                //找到按钮所在行的节点，然后删掉这一行
                this.parentNode.parentNode.parentNode.removeChild(this.parentNode.parentNode);
                //btnDel - td - tr - tbody - 删除(tr)
                //刷新网页还原。实际操作中，还要删除数据库中数据，实现真正删除
            }
        }
        delCell.appendChild(btnDel);  //把删除按钮加入td，别忘了

        return row; //返回tr数据
    }



</script>
</html>
