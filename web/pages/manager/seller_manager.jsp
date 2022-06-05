<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商家管理界面</title>
    <%@include file="/pages/common/head.jsp" %>

    <script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
    <script type="text/javascript">
        var ip = "";
        var date = new Date();
        $(function () {
            //获取ip
            ip = returnCitySN.cip;
            $("#ip").val(ip);
            $(".delete_ip").val(ip);

            $(".submit").click(function () {
                date = new Date();
                $(".delete_date").val(date.toLocaleString());
                return confirm("你确定要删除编号为【" + $(this).parent().parent().parent().find("td:first").text() + "】的商家吗？")
            })

            $(".input_content").change(function () {
                //获取输入框的value属性（也就是输入内容
                var value = $(".input_content").attr("value");
                //赋值给表单项target的value属性
                $("#target").attr("value", value)
                // alert("target的值为"+$("#target").attr("value"));
            })

            $("#sellerSearch").click(function () {
                date = new Date();
                $("#date").val(date.toLocaleString());
            })
        })
    </script>

</head>
<body>
<%@include file="/pages/common/top_nav.jsp" %>
<div class="search-header-wrapper">
    <div class="search-header">
        <h1 id="logo">
            <a href="client/goodsServlet?action=page"></a>
        </h1>
        <div class="search bar2">
            <form action="sellerServlet" method="post">
                <input type="hidden" name="action" value="pageByName">
                <input type="text" id="sellerName" name="sellerName" value="${requestScope.sellerName}"
                       class="input_content" placeholder="通过商家名称查找商家">

                <input type="hidden" name="ip" id="ip">
                <input type="hidden" name="date" id="date">
                <input type="hidden" name="role" value="管理员">
                <input type="hidden" name="roleId" value="1">
                <input type="hidden" name="operate" value="查询">
                <input type="hidden" name="target" id="target">

                <button class="submit-btn" type="submit" value="查询" id="sellerSearch"></button>
            </form>
        </div>
    </div>
</div>

<div id="main">
    <div id="main_inner">
        <div style="margin: 0 auto ; width: 600px;">
            <table>
                <c:if test="${requestScope.page.items.size()==0}">
                    <div style="height: 100px;line-height: 100px;text-align: center">
                        找不到搜索的商家，请检查所输入的商家名称
                    </div>
                </c:if>
                <c:if test="${requestScope.page.items.size()!=0}">
                    <thead>
                    <tr>
                        <td>商家编号</td>
                        <td>商家名称</td>
                        <td>商家密码</td>
                        <td>销售额</td>
                        <td colspan="2">操作</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.page.items}" var="seller">
                        <tr>
                            <td>${seller.id}</td>
                            <td>${seller.name}</td>
                            <td>${seller.password}</td>
                            <td>${seller.salesVolume}元</td>
                            <td><a href="sellerServlet?action=getSeller&method=update&sellerId=${seller.id}">编辑</a></td>
                            <td>
                                <form action="sellerServlet" method="post">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="sellerId" value="${seller.id}">

                                    <input type="hidden" name="ip" class="delete_ip">
                                    <input type="hidden" name="date" class="delete_date">
                                    <input type="hidden" name="role" value="管理员">
                                    <input type="hidden" name="roleId" value="1">
                                    <input type="hidden" name="operate" value="删除">
                                    <input type="hidden" name="target" value="商家${goods.id}">
                                    <input type="submit" name="submit" class="submit" value="删除"
                                           style="background-color:transparent;border:0px;font-size:16px;font-weight: bold;cursor: pointer">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </c:if>
            </table>
        </div>
        <div class="addItem">
            <a  href="pages/manager/seller_edit.jsp?method=add">添加商家</a>
        </div>

    </div>

</div>

<%@include file="/pages/common/page_nav.jsp" %>

<%@include file="/pages/common/footer.jsp" %>
</body>
</html>