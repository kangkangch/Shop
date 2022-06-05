<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册界面</title>
    <%@include file="/pages/common/head.jsp" %>
    <script type="text/javascript">
        $(function () {
            $("#submit").click(function () {
                var usernameText = $("#username").val();
                var usernamePatt = /^\w{3,8}$/;
                if (!usernamePatt.test(usernameText)) {
                    $("#errorMessage").text("用户名不合法！只能输入长度在3-8之间的数字、字母、下划线")
                    return false;
                }
                var passwordText = $("#password").val();
                var passwordPatt = /^\w{3,8}$/;
                if (!passwordPatt.test(passwordText)) {
                    $("#errorMessage").text("密码不合法！只能输入长度在3-8之间的数字、字母、下划线");
                    return false;
                }

                var checkPasswordText = $("#checkPassword").val();
                //2 和密码相比较
                if (checkPasswordText != passwordText) {
                    $("#errorMessage").text("确认密码和密码不一致！");
                    return false;
                }

                var emailText = $("#email").val();
                var emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
                if (!emailPatt.test(emailText)) {
                    $("#errorMessage").text("邮箱格式不合法！");
                    return false;
                }

                $("#errorMessage").text("");

            })

        })
    </script>
</head>
<body>
<%@include file="/pages/common/nav/login_nav.jsp" %>

<div id="main" class="login-container">
    <div class="login-wrapper">
        <div>
            <div class="login-header">用户注册</div>
            <div id="errorMessage" class="errorMessage">${requestScope.msg}</div>
        </div>
        <form class="login-input" action="userServlet" method="post">
            <input type="hidden" name="action" value="register">
            <div>
                <input type="text" name="username" id="username" placeholder="用户名">
                <input type="password" name="password" id="password" placeholder="密码"></td>
                <input type="password" name="checkPassword" id="checkPassword" placeholder="确认密码">
                <input type="text" name="email" id="email" placeholder="邮箱"></td>
            </div>
                <input class="login-btn" type="submit" value="注册" id="submit">
        </form>
    </div>
</div>


<%@include file="/pages/common/footer.jsp" %>
</body>
</html>