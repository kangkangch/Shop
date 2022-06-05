<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="header" class="head_nav">
    <div id="header_title">
        <div id="header_title_blank"></div>
        <ul>
            <li><a href="client/goodsServlet?action=page">电子商城</a></li>
            <li><a href="recommendServlet?action=recommend" id="recommend">个性推荐</a></li>
        </ul>
    </div>
    <div id="blank">
    </div>
    <div id="jump_message">
        <span style="width: 300px">欢迎您，${sessionScope.username}</span>
        <ul>
            <li><a href="pages/cart/cart.jsp">购物车</a></li>
            <li><a href="orderServlet?action=queryByUserId">我的订单</a></li>
            <li><a href="userServlet?action=logout">退出登录</a></li>
        </ul>
        <div id="jump_message_blank"></div>
    </div>
</div>