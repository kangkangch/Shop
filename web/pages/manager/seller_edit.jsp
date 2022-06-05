<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商家编辑界面</title>
    <%@include file="/pages/common/head.jsp"%>

    <script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
    <script type="text/javascript">
        var ip = "";
        var date = new Date();
        $(function (){
            //获取ip
            ip = returnCitySN.cip;
            $("#ip").val(ip);

            $("#submit_btn").click(function (){
                var nameText = $("#name").val();
                var namePatt = /^\w{3,8}$/;
                if(!namePatt.test(nameText)){
                    $("#errorMessage").text("名称不合法！只能输入长度在3-8之间的数字、字母、下划线")
                    return false;
                }
                var passwordText = $("#password").val();
                var passwordPatt = /^\w{3,8}$/;
                if (!passwordPatt.test(passwordText)) {
                    $("#errorMessage").text("密码不合法！只能输入长度在3-8之间的数字、字母、下划线");
                    return false;
                }
                var name = $("#name").val();
                var password = $("#password").val();
                name = $.trim(name);
                password = $.trim(password);
                if(name == null || name==""){
                    $("#errorMessage").text("名称不能为空！");
                    return false;
                }
                if(password == null || password ==""){
                    $("#errorMessage").text("密码不能为空！");
                    return false;
                }
                //获取时间
                date = new Date();
                $("#date").val(date.toLocaleString());
            })
        })
    </script>
</head>
<body>
    <%@include file="/pages/common/top_nav.jsp" %>

    <div id="a"></div>

    <div id="main">
        <div class="login-wrapper">
            <form class="login-input" action="sellerServlet?action=${param.method}" method="post">
                <div>
                    <div class="login-header">商家信息</div>
                    <div id="errorMessage" class="errorMessage">${requestScope.msg}</div>
                </div>

                <input type="hidden" name="id" value="${requestScope.seller.id}" id="id">
                <div>
                    新名称:
                    <input placeholder="商家名称" type="text" name="name" value="${requestScope.seller.name}" id="name"> <br><br>
                    新密码:
                    <input placeholder="商家密码" type="text" name="password" value="${requestScope.seller.password}" id="password"> <br>
                </div>
                <input type="hidden" name="salesVolume" value="${requestScope.seller.salesVolume}" id="salesVolume">

                <input type="hidden" name="ip" id="ip">
                <input type="hidden" name="date" id="date">
                <input type="hidden" name="role" value="管理员">
                <input type="hidden" name="roleId" value="1">
                <input type="hidden" name="operate" value="${param.method=="add"?"添加":"修改"}">
                <input type="hidden" name="target" value="商家${requestScope.seller.id}">

                <input class="login-btn" type="submit" name="submit" value="修改" id="submit_btn">

            </form>
        </div>
    </div>

    <div id="b"></div>
    <%@include file="/pages/common/footer.jsp"%>
</body>
</html>
