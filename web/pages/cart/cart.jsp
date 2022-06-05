<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <%@include file="/pages/common/head.jsp" %>


    <script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
    <script type="text/javascript">
        var ip = "";
        var date = new Date();
        var stock = $(this).attr("stock");
        $(function () {
            //获取ip
            ip = returnCitySN.cip;
            $("#ip").val(ip);

            $("#submit_order").click(function () {
                stock = $(this).attr("stock");
                if (Number($(".updateCount")).val() <= 0) {
                    alert("购买数量错误！");
                    return false;
                }
                if (Number($(".updateCount").val()) > Number(stock)) {// 如果输入的值比库存还多
                    alert("库存不足!本货物库存只有" + stock + "件");
                    this.value = this.defaultValue;
                    return false;
                }
                date = new Date();
                $("#date").val(date.toLocaleString());
            })

            $("a.delete").click(function () {
                //this表示当前响应事件的dom对象
                return confirm("你确定要删除【" + $(this).parent().parent().find("td:first").text() + "】吗？")
            })
            $("#clearCart").click(function () {
                //this表示当前响应事件的dom对象
                return confirm("你确定要清空购物车吗？")
            })

            $(".updateCount").change(function () {
                stock = $(this).attr("stock");
                if (this.value <= 0) {
                    alert("购买数量错误！");
                    this.value = this.defaultValue;
                } else {
                    if (Number(this.value) > Number(stock)) {// 如果输入的值比库存还多
                        alert("本货物库存只有" + stock + "件");
                        this.value = this.defaultValue;
                    } else {
                        if (confirm("你确定要把【" + $(this).parent().parent().find("td:first").text() + "】的数量改为【" + this.value + "】吗？")) {
                            var id = $(this).attr("itemId");
                            location.href = ("${basePath}cartServlet?action=updateCount&id=" + id + "&count=" + this.value);
                        } else {
                            this.value = this.defaultValue;
                        }
                    }
                }

            })
        })
    </script>
</head>
<body>

<div id="a"></div>
<%@include file="/pages/common/top_nav.jsp" %>
<div id="main">
    <c:if test="${empty sessionScope.cart.items}">
        <div style="margin:50px auto auto auto;width: 600px;height: 50px;text-align: center">
            当前购物车为空！
            <a href="index.jsp">浏览商品</a>
        </div>
    </c:if>

    <div id="b">
        <c:if test="${not empty sessionScope.cart.items}">
            <div class="cart-warp">
                <div class="cart-head">
                    <span class="cart-switch">购物车（${sessionScope.cart.totalCount}件商品）</span>
                    <div class="cart-sum">
                        <span class="pay-text">已加入购物车总金额</span>
                        <strong class="price">${sessionScope.cart.totalPrice}元</strong>
                    </div>
                </div>
                <div class="cart-info">
                    <table>
                        <caption>
                            购物车
                            <a id="clearCart" class="cart-submit-btn" href="cartServlet?action=clear">清空</a>
                            <form style="float: right" action="orderServlet" method="post">
                                <input type="hidden" name="action" value="addOrder">
                                <input type="hidden" name="ip" class="submit_ip" id="ip">
                                <input type="hidden" name="date" class="submit_date" id="date">
                                <input type="hidden" name="role" value="用户">
                                <input type="hidden" name="roleId" value="${sessionScope.user.id}">
                                <input type="hidden" name="operate" value="提交">
                                <input type="hidden" name="target" value="订单">

                                <input class="cart-submit-btn" type="submit" id="submit_order" value="去结账">
                            </form>
                        </caption>
                        <thead>
                        <tr>
                            <td>商品名称</td>
                            <td>数量</td>
                            <td>单价</td>
                            <td>金额</td>
                            <td>操作</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sessionScope.cart.items}" var="entry">
                            <tr>
                                <td>${entry.value.name}</td>
                                <td>
                                    <input itemId="${entry.value.id}" stock="${entry.value.stock}" type="text"
                                           class="updateCount" value="${entry.value.count}">
                                </td>
                                <td>${entry.value.price}</td>
                                <td>${entry.value.totalPrice}</td>
                                <td><a href="cartServlet?action=deleteItem&id=${entry.value.id}"
                                       class="delete">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:if>
    </div>
</div>
<%@include file="/pages/common/footer.jsp" %>
</body>
</html>
