<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录记录页面</title>
    <%@include file="/pages/common/head.jsp"%>
</head>
<body>
    <%@include file="/pages/common/top_nav.jsp" %>
    <div id="a"></div>

    <div id="main">
        <div id="main_inner" style="overflow-y: hidden">
            <c:if test="${requestScope.page.items.size()==0}">
                <div>
                    <span>没有登录记录</span>
                </div>
            </c:if>
            <c:if test="${requestScope.page.items.size()!=0}">
                <table >
                    <thead>
                    <tr>
                        <td>ip</td>
                        <td>地址</td>
                        <td>时间</td>
                        <td>操作</td>
                        <td>对象</td>
                        <td>编号</td>
                    </tr>
                    </thead>
                    <c:forEach items="${requestScope.page.items}" var="item">
                        <tr>
                            <td>${item.ip}</td>
                            <td>${item.address}</td>
                            <td>${item.date}</td>
                            <td>${item.operation}</td>
                            <td>${item.role}</td>
                            <td>${item.roleId}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
    </div>

    <%@include file="/pages/common/page_nav.jsp"%>
    <%@include file="/pages/common/footer.jsp"%>
</body>
</html>
