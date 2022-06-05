<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>结算界面</title>
    <%@include file="/pages/common/head.jsp" %>
</head>
<body>
<%@include file="/pages/common/top_nav.jsp" %>
<div id="main">
    <div style="margin: 50px auto auto auto;width: 400px;height: 100px;text-align: center">
        你的订单已结算，订单号为：${sessionScope.orderId}</div>
</div>
<%@include file="/pages/common/footer.jsp" %>
</body>
</html>
