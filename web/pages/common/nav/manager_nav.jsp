<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="header" class="head_nav">
    <div id="header_title">
        <div id="header_title_blank"></div>
        <ul>
            <c:if test="${not empty sessionScope.manager}">
                <li><a href="pages/manager/manager.jsp">后台管理</a></li>
            </c:if>
            <c:if test="${not empty sessionScope.seller}">
                <li><a href="pages/seller_login/seller.jsp">商家首页</a></li>
            </c:if>
        </ul>
    </div>
    <div id="blank"></div>
    <div id="jump_message">
        <ul>
            <c:if test="${not empty sessionScope.manager}">
                <span style="width: 300px">欢迎您，${sessionScope.manager.name}</span>
                <li><a href="manager/goodsServlet?action=page">商品管理</a></li>
                <li><a href="orderServlet?action=page">订单管理</a></li>
                <li><a href="sellerServlet?action=page">商家管理</a></li>
                <li><a href="loginInfoServlet?action=page">登录记录</a></li>
                <li><a href="operationServlet?action=page">操作记录</a></li>
                <li><a href="managerServlet?action=logout">退出登录</a></li>
            </c:if>
            <c:if test="${not empty sessionScope.seller}">
                <span>欢迎您，${sessionScope.seller.name}</span>
                <li><a href="manager/goodsServlet?action=page&sellerId=${sessionScope.seller.id}">商品管理</a></li>
                <li><a href="orderServlet?action=queryBySellerId">销售记录</a></li>
                <li><a href="sellerServlet?action=logout">退出登录</a></li>
            </c:if>
        </ul>
        <div id="jump_message_blank"></div>
    </div>
</div>