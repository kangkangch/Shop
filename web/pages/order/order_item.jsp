<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>订单详情页面</title>
    <%@ include file="/pages/common/head.jsp" %>
</head>
<body>
<%@include file="/pages/common/top_nav.jsp" %>
<div id="main">
    <div id="main_inner" style="overflow-y: hidden">
        <table>
            <thead>
            <tr>
                <td>商品编号</td>
                <td>商品名称</td>
                <td>用户编号</td>
                <td>卖家编号</td>
                <td>数量</td>
                <td>单价</td>
                <td>总价</td>
                <td>下单时间</td>
            </tr>
            </thead>
            <tbody>
            <c:if test="${not empty requestScope.page.items}">
                <c:forEach items="${requestScope.page.items}" var="orderItem">
                    <tr>
                        <td>${orderItem.goodsId}</td>
                        <td>${orderItem.name}</td>
                        <td>${orderItem.userId}</td>
                        <td>${orderItem.sellerId}</td>
                        <td>${orderItem.count}</td>
                        <td>${orderItem.price}</td>
                        <td>${orderItem.totalPrice}</td>
                        <td>${orderItem.createTime}</td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${not empty requestScope.item}">
                <c:forEach items="${requestScope.item}" var="orderItem">
                    <tr>
                        <td>${orderItem.goodsId}</td>
                        <td>${orderItem.name}</td>
                        <td>${orderItem.userId}</td>
                        <td>${orderItem.sellerId}</td>
                        <td>${orderItem.count}</td>
                        <td>${orderItem.price}</td>
                        <td>${orderItem.totalPrice}</td>
                        <td>${orderItem.createTime}</td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
    </div>
</div>
<%@include file="/pages/common/page_nav.jsp" %>
<%--静态包含页脚内容--%>
<%@include file="/pages/common/footer.jsp" %>
</body>
</html>