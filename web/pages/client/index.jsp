<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <%@include file="/pages/common/head.jsp" %>

    <script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
    <script type="text/javascript">
        var ip = "";
        var date = new Date();
        $(function () {
            //获取ip
            ip = returnCitySN.cip;
            $("#ip").val(ip);
            $("#info").click(function () {
                if (${sessionScope.username != null || sessionScope.manager != null || sessionScope.seller != null}) {
                } else {
                    alert("请先登录后再查看详细内容！");
                    return false;
                }
            })

            $(".addToCart").click(function () {
                if (${sessionScope.username != null}) {
                    var stock = $(this).attr("stock");
                    if (stock > 0) {
                        var goodsId = $(this).attr("goodsId");
                        location.href = ("${basePath}cartServlet?action=addItem&id=" + goodsId + "&stock=" + stock);
                        alert("成功加入购物车");
                    } else if (stock <= 0) {
                        alert("商品暂时缺货！")
                        return false;
                    }
                } else {
                    alert("请先登录！");
                    return false;
                }
            })

            $(".input_content").change(function () {
                //获取输入框的value属性（也就是输入内容
                var value = $(".input_content").attr("value");
                //赋值给表单项target的value属性
                $("#target").attr("value", value)
            })

            $("#goods_search").click(function () {
                date = new Date();
                $("#date").val(date.toLocaleString());
                // }
            })


            $(".goods_img")
                .mouseover(function (event) {
                    $(this).parent().next()
                        .show()
                        .css("left", event.pageX + 10)
                        .css("top", event.pageY + 10);
                })
                .mousemove(function (event) {
                    $(this).parent().next()
                        .css("left", event.pageX + 10)
                        .css("top", event.pageY + 10);
                })
                .mouseout(function () {
                    $(this).parent().next()
                        .hide();
                });

        })
    </script>
</head>
<body>
<%@include file="/pages/common/top_nav.jsp" %>

<%@include file="/pages/common/goods_search.jsp" %>

<%--主体区域--%>
<div id="main">
    <%--商品区域--%>
    <div id="main_inner">
        <c:if test="${requestScope.page.items.size() == 0}">
            <div style="text-align: center;font-size: 30px">
                <span>查不到对应的商品</span>
            </div>
        </c:if>
        <c:if test="${requestScope.page.items.size() != 0}">
            <table>
                <caption>
                    商城首页
                </caption>
            </table>
            <div class="goods_list">
                <ul>
                    <c:forEach items="${requestScope.page.items}" var="goods">
                        <li>

                            <div class="goods_list_info">
                                <a class="info" id="info" href="manager/goodsServlet?action=getGoodInfo&id=${goods.id}">
                                    <div class="img_div">
                                        <img src="${goods.imgPath}" class="goods_img">
                                    </div>
                                    <div class="showBig" style="position: absolute;display: none">
                                        <img src="${goods.imgPath}" style="max-width: 300px;">
                                    </div>
                                </a>
                                <div class="goods_info">
                                    <div class="goods_name title">
                                            ${goods.name}
                                    </div>
                                    <div class="goods_category">
                                        <span>类型：</span>
                                        <span>
                                            <c:if test="${goods.categoryId==1}">食品</c:if>
                                            <c:if test="${goods.categoryId==2}">服装</c:if>
                                            <c:if test="${goods.categoryId==3}">日用品</c:if>
                                            <c:if test="${goods.categoryId==4}">家具</c:if>
                                            <c:if test="${goods.categoryId==5}">电器</c:if>
                                            <c:if test="${goods.categoryId==6}">娱乐</c:if>
                                        </span>
                                    </div>
                                    <div class="goods_price price">
                                        价格：${goods.price}元
                                    </div>
                                    <div class="goods_test">
                                        <form action="cartServlet">
                                            <input type="hidden" name="action" value="addItem">
                                            <input type="hidden" name="id" value="${goods.id}" class="id">
                                            <input type="hidden" name="number"
                                                   value="${empty sessionScope.number?goods.stock:sessionScope.number}"
                                                   class="number">
                                            <input type="hidden" name="stock" value="${goods.stock}" class="stock">
                                            <input type="hidden" name="userId" value="${sessionScope.user.id}" class="userId">
                                            <c:if test="${empty sessionScope.manager && empty sessionScope.seller}">
                                                <input type="submit" name="submit" value="加入购物车" class="addToCart"
                                                       stock="${goods.stock}">
                                            </c:if>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
    </div>
</div>

<%--分页区域--%>
<%@include file="/pages/common/page_nav.jsp" %>


<%--底部区域--%>
<%@include file="/pages/common/footer.jsp" %>
</body>
</html>