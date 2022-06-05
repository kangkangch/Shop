<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="header" class="head_nav">
    <div id="header_title">
        <div id="header_title_blank"></div>
        <ul>
            <c:choose>
                <c:when test="${not empty sessionScope.seller}">
                    <li><a href="client/goodsServlet?action=page">商城首页</a></li>
                </c:when>
                <c:when test="${not empty sessionScope.manager}">
                    <li><a href="client/goodsServlet?action=page">商城首页</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="client/goodsServlet?action=page">电子商城</a></li>
                    <li><a href="recommendServlet?action=recommend" id="recommend">个性推荐</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
    <script type="text/javascript">
        $("#recommend").click(function () {
            if (${sessionScope.username!=null}) {//如果登录了
            } else {//如果没登陆
                if (confirm("登录后才能为您推荐商品哦!") == true) {
                    location.href = "${basePath}pages/user/login.jsp";
                    return false;
                } else {
                    return false;
                }
            }
        })
    </script>

    <div id="jump_message">
        <ul>
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <span>欢迎您，${sessionScope.username}</span>
                    <li><a href="pages/cart/cart.jsp">购物车</a></li>
                    <li><a href="orderServlet?action=queryByUserId">我的订单</a></li>
                    <li><a href="userServlet?action=logout">退出登录</a></li>
                </c:when>
                <c:when test="${not empty sessionScope.manager}">
                    <span style="width: 300px">欢迎您，${sessionScope.manager.name}</span>
                    <li><a href="orderServlet?action=page">订单管理</a></li>
                    <li><a href="sellerServlet?action=page">商家管理</a></li>
                    <li><a href="loginInfoServlet?action=page">登录记录</a></li>
                    <li><a href="operationServlet?action=page">操作记录</a></li>
                    <li><a href="browseServlet?action=page">浏览记录</a></li>
                    <li><a href="managerServlet?action=logout">退出登录</a></li>
                </c:when>
                <c:when test="${not empty sessionScope.seller}">
                    <span>欢迎您，${sessionScope.seller.name}</span>
                    <li><a href="manager/goodsServlet?action=page&sellerId=${sessionScope.seller.id}">商品管理</a></li>
                    <li><a href="browseServlet?action=browseBySellerId&sellerId=${sessionScope.seller.id}">浏览记录</a></li>
                    <li><a href="orderServlet?action=queryBySellerId">销售记录</a></li>
                    <li><a href="sellerServlet?action=logout">退出登录</a></li>
                </c:when>
                <c:otherwise>
                    <ul>
                        <li><a href="pages/user/register.jsp">用户注册</a></li>
                        <li><a href="">登录</a>
                            <div>
                                <ul>
                                    <li><a href="pages/user/login.jsp">用户登录</a></li>
                                    <li><a href="pages/seller_login/login.jsp">商家登录</a></li>
                                    <li><a href="pages/manager_login/login.jsp">管理登录</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </c:otherwise>
            </c:choose>
        </ul>
        <div id="jump_message_blank"></div>
    </div>
</div>
