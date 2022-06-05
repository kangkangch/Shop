<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>浏览记录管理</title>
    <%@include file="/pages/common/head.jsp" %>
    <script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
</head>
<body>
<%@include file="/pages/common/top_nav.jsp" %>
<div class="search-header-wrapper">
    <div class="search-header">
        <h1 id="logo">
            <a href="client/goodsServlet?action=page"></a>
        </h1>
        <div class="search bar2">
            <form action="browseServlet" method="post">
                <input type="hidden" name="action" value="pageByUserId">
                <input type="text" id="userId" name="userId"
                       class="input_content" placeholder="通过用户ID查找记录">
                <button class="submit-btn" type="submit" value="查询" id="goods_search"></button>
            </form>
        </div>
    </div>
</div>
<div id="main">
    <div id="main_inner">
        <c:if test="${empty requestScope.page.items}">
            <div>暂时还没有浏览记录</div>
        </c:if>
        <c:if test="${not empty requestScope.page.items}">

            <table>
                <caption>用户浏览记录</caption>
                <thead>
                <tr>
                    <td>用户id</td>
                    <td>商品id</td>
                    <td>商品类别</td>
                    <td>开始时间</td>
                    <td>结束时间</td>
                    <td>持续时间</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.page.items}" var="item">
                    <tr>
                        <td>${item.userId}</td>
                        <td>${item.goodsId}</td>
                        <td>
                            <c:if test="${item.categoryId==1}">食品</c:if>
                            <c:if test="${item.categoryId==2}">服装</c:if>
                            <c:if test="${item.categoryId==3}">日用品</c:if>
                            <c:if test="${item.categoryId==4}">家具</c:if>
                            <c:if test="${item.categoryId==5}">电器</c:if>
                            <c:if test="${item.categoryId==6}">娱乐</c:if>
                        </td>
                        <td>${item.beginTime}</td>
                        <td>${item.endTime}</td>
                        <td>${item.time}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</div>
<%--分页区域--%>
<%@include file="/pages/common/page_nav.jsp" %>

<%--底部区域--%>
<%@include file="/pages/common/footer.jsp" %>
</body>
</html>
