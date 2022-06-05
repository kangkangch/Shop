<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>订单页面</title>
    <%@ include file="/pages/common/head.jsp" %>
    <style>
        td {
            width: 200px;
        }
    </style>
</head>
<body>
<%@include file="/pages/common/top_nav.jsp" %>
<div id="main">
    <div id="main_inner">
        <c:if test="${empty requestScope.orders}">
            <div style="margin:50px auto auto auto;width: 600px;height: 50px;text-align: center">
                暂时还没有购买过商品，先去浏览一下商品吧！
                <a href="index.jsp">浏览商品</a>
            </div>
        </c:if>
        <c:if test="${not empty requestScope.orders}">
            <table style="margin: 0 auto">
                <thead>
                <tr>
                    <td>订单号</td>
                    <td>时间</td>
                    <td>金额</td>
                    <td>详情</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.orders}" var="order">
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.createTime}</td>
                        <td>${order.price}</td>
                        <td><a href="orderServlet?action=queryForOrderItemByOrderId&orderId=${order.id}">查看详情</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</div>
<%--静态包含页脚内容--%>
<%@include file="/pages/common/footer.jsp" %>


</body>
</html>