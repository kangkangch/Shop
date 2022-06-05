<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录界面</title>
    <%@include file="/pages/common/head.jsp" %>

    <script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
    <script type="text/javascript">
        var ip = "";
        var address = "";
        var date = new Date();
        $(function () {
            //获取ip
            ip = returnCitySN.cip;
            $("#ip").val(ip);

            //获取地址
            address = returnCitySN.cname;
            $("#address").val(address);

            $("#submit").click(function () {
                var usernameText = $("#username").val();
                var usernamePatt = /^\w{3,8}$/;
                if (!usernamePatt.test(usernameText)) {
                    $("#errorMessage").text("用户名不合法！")
                    return false;
                } else {
                    //获取时间
                    date = new Date();
                    $("#date").val(date.toLocaleString());
                }
            })
        })
    </script>

</head>
<body>
<%@include file="/pages/common/nav/login_nav.jsp" %>


<div id="main" class="login-container">
    <div class="login-wrapper">
        <div class="login-header">
            <div>商家登录</div>
            <div id="errorMessage" class="errorMessage">${requestScope.msg}</div>
        </div>
        <form action="sellerServlet" method="post" id="login_form" class="login-input">
            <input type="hidden" name="action" value="login">
            <div>
                <input type="text" name="name" id="username" placeholder="请输入名称"
                       value="${cookie.sellerName.value}"></td>

                <input type="password" name="password" id="password" placeholder="请输入密码">

            </div>

            <input class="login-btn" type="submit" value="登录" id="submit">

            <%--            需要获取ip、地址、时间，通过js获取--%>
            <input type="hidden" name="ip" id="ip">
            <input type="hidden" name="address" id="address">
            <input type="hidden" name="date" id="date">

            <%--用户登录--%>
            <input type="hidden" name="operation" value="登录">
            <input type="hidden" name="role" value="商家">

            <%--        数据库里面还有一个参数，登录的商家id，没法直接传--%>

        </form>
    </div>
</div>

<%@include file="/pages/common/footer.jsp" %>
</body>
</html>