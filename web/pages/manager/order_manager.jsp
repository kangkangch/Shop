<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单管理界面</title>
    <%@include file="/pages/common/head.jsp" %>
</head>
<body>
<%@include file="/pages/common/top_nav.jsp" %>

<div id="main">
    <div id="main_inner" style="overflow-y: hidden">
        <table>
            <caption>订单</caption>
            <thead>
            <tr>
                <td>订单号</td>
                <td>时间</td>
                <td>金额</td>
                <td>详情</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.page.items}" var="order">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.createTime}</td>
                    <td>${order.price}</td>
                    <td><a href="orderServlet?action=queryForOrderItemByOrderId&orderId=${order.id}">查看详情</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<%@include file="/pages/common/page_nav.jsp" %>
<%@include file="/pages/common/footer.jsp" %>
</body>
</html>
