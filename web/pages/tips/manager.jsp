<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>需要管理员权限</title>
    <%@include file="/pages/common/head.jsp"%>
    <meta http-equiv="refresh" content="2;URL=${basePath}index.jsp">
</head>
<body>
<div id="main" style="text-align: center">
    <div style="display: flex;flex-direction: column;justify-content: center; width: 100%; height: 100%">
        <div style="width: 300px;height: 300px;margin: 0 auto">请先登录管理员或商家账号！ <br><br> 将在2秒后回到商品页</div>
    </div>
</div>

</body>
</html>
