<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>推荐页面</title>
    <%@include file="/pages/common/head.jsp" %>

    <script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
    <script type="text/javascript">
        var ip = "";
        var date = new Date();
        $(function () {
            //获取ip
            ip = returnCitySN.cip;
            $("#ip").val(ip);

            $("#goods_search").click(function () {
                <%--if(${sessionScope.username == null} ){--%>
                <%--    alert("请先登录！");--%>
                <%--    return false;--%>
                <%--}else {--%>
                date = new Date();
                $("#date").val(date.toLocaleString());
                // }
            })

            $(".input_content").change(function () {
                //获取输入框的value属性（也就是输入内容
                var value = $(".input_content").attr("value");
                //赋值给表单项target的value属性
                $("#target").attr("value", value)
                // alert("target的值为"+$("#target").attr("value"));
            })

            $("button.addToCart").click(function () {
                if (${sessionScope.username != null}) {
                    var stock = $(this).attr("stock");
                    if (stock > 0) {
                        var goodsId = $(this).attr("goodsId");
                        location.href = ("${basePath}cartServlet?action=addItem&id=" + goodsId + "&stock=" + stock);
                        alert("成功加入购物车");
                    } else if (stock == 0) {
                        alert("商品暂时缺货！")
                    }
                } else {
                    alert("请先登录！");
                }
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

<main id="main">
    <div id="main_inner">
        <c:if test="${empty requestScope.list}">
            <div style="font-size: 30px;text-align: center">
                <span>您当前使用商城的信息还太少，先去
                    <a href="index.jsp" style="color: #0078d7;font-size: 30px">浏览一下</a>
                    吧</span>
            </div>
        </c:if>
        <c:if test="${not empty requestScope.list}">
            <table class="head_title">
                <caption>为您推荐的商品如下:</caption>
            </table>
            <div class="goods_list">
                <ul>
                    <c:forEach items="${requestScope.list}" var="goods">
                        <li>
                            <div class="goods_list">
                                <div class="goods_list_info">
                                    <div class="img_div">
                                        <img src="${goods.imgPath}" class="goods_img">
                                    </div>
                                    <div class="showBig" style="position: absolute;display: none">
                                        <img src="${goods.imgPath}" style="max-width: 300px;">
                                    </div>
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
                                                ${goods.price}元
                                        </div>
                                        <div class="goods_add">
                                            <button goodsId="${goods.id}" stock="${goods.stock}" class="addToCart">加入购物车
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
    </div>

</main>

<div id="b"></div>
<%@include file="/pages/common/footer.jsp" %>
</body>
</html>
