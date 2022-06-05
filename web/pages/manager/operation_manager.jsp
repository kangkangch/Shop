<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 12423
  Date: 2022/4/25
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>操作记录页面</title>
    <%@include file="/pages/common/head.jsp" %>


    <style>
        td {
            width: 200px;
        }
    </style>

</head>
<body>
<%@include file="/pages/common/top_nav.jsp" %>
<div id="a"></div>

<div id="main">
    <div id="main_inner" style="overflow-y: hidden">
        <c:if test="${requestScope.page.items.size()==0}">
            <div>
                <span>没有操作记录</span>
            </div>
        </c:if>
        <c:if test="${requestScope.page.items.size()!=0}">
            <table>
                <thead>
                <tr>
                    <td>ip</td>
                    <td>时间</td>
                    <td>操作者</td>
                    <td>编号</td>
                    <td>操作</td>
                    <td>目标</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.page.items}" var="item">
                    <tr>
                        <td>${item.ip}</td>
                        <td>${item.date}</td>
                        <td>${item.role}</td>
                        <td>${item.roleId}</td>
                        <td>${item.operate}</td>
                        <td>${item.target}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</div>

<%@include file="/pages/common/page_nav.jsp" %>

<%@include file="/pages/common/footer.jsp" %>

</body>
</html>
