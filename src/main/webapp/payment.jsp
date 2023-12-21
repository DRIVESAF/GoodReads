<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>支付页</title>
    <style>
        div {
            height: 36px;
            line-height: 36px;
            border: #eee solid 1px;
            margin: 10px;
        }
    </style>
    <script>


        //查找 cookie

        function cp_seek_cookie() {
            var cp_keynum = getCookie("cp_keynum");
            var find_result = document.getElementById("row hid");
            find_result.innerHTML = cp_keynum;
        }

        //获取 cookie 值的函数,创建一个函数用户返回指定 cookie 的值
        //cname:名称，你之前设置的名称
        function getCookie(cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i].trim();
                if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
            }
            return "";
        }

    </script>

</head>
<body>
<div onclick="cp_seek_cookie()">查找订单</div>
<div id="row hid"></div>
</body>
</html>