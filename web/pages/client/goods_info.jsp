<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>商品详情页面</title>
    <%@include file="/pages/common/head.jsp" %>

    <script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
</head>
<body>

<script>
    // 统计用户 访问网站步骤记录
    var tjSecond = 0;
    var tjRandom = 0;
    window.setInterval(function () {
        tjSecond++;
    }, 1000);
    // 随机数
    tjRandom = (new Date()).valueOf();
    // 用户第一次访问页面记录部分数据
    window.onload = function () {
        var refer = getReferrer();
        var tjArr = localStorage.getItem("jsArr") ? localStorage.getItem("jsArr") : '[]';
        var dataArr = {
            'tjRd': tjRandom,
            'url': location.href,
            'refer': refer,
        };
        tjArr = eval('(' + tjArr + ')');
        tjArr.push(dataArr);
        var tjArr1 = JSON.stringify(tjArr);
        localStorage.setItem("jsArr", tjArr1);
    };
    // 用户继续访问根据上面提供的key值补充数据
    window.onbeforeunload = function () {
        var tjArrRd = eval('(' + localStorage.getItem("jsArr") + ')');
        var tjI = tjArrRd.length - 1;
        var outTime = new Date();
        var inTime = new Date();
        inTime.setTime(outTime.getTime() - (tjSecond * 1000));
        outTime = outTime.toLocaleString();
        inTime = inTime.toLocaleString();
        if (tjArrRd[tjI].tjRd == tjRandom) {
            tjArrRd[tjI].time = tjSecond;
            tjArrRd[tjI].timeIn = inTime;
            tjArrRd[tjI].timeOut = outTime;
            var tjArr1 = JSON.stringify(tjArrRd);
            localStorage.setItem("jsArr", tjArr1);
        }
        var browse = {
            "userId": $("#userId").val(),
            "goodsId": $("#goodsId").val(),
            "categoryId": $("#categoryId").val(),
            "beginTime": String(inTime),
            "endTime": String(outTime),
            "time": String(tjArrRd[tjI].time),
        };
        if ($("#userId").val() !== 0 && $("#userId").val() !== '0') {
            $.ajax({
                type: "POST",
                url: "browseServlet",
                data: browse,     //参数
                dataType: 'text',
                success: function (result) {
                    localStorage.setItem('成功', result.d);
                },
                error: function (obj, msg, e) {   //异常
                    localStorage.setItem('失败', e.d);
                }
            });
        }
    };

    function getReferrer() {
        var referrer = '';
        try {
            referrer = window.top.document.referrer;
        } catch (e) {
            if (window.parent) {
                try {
                    referrer = window.parent.document.referrer;
                } catch (e2) {
                    referrer = '';
                }
            }
        }
        if (referrer === '') {
            referrer = document.referrer;
        }
        return referrer;
    }

    $(function () {
        $(".addToCart").click(function () {
            if (${sessionScope.username != null}) {
                var stock = $(this).attr("stock");
                if (stock > 0) {
                    alert("成功加入购物车");
                } else if (stock <= 0) {
                    alert("商品暂时缺货！");
                    return false;
                }
            } else {
                alert("请先登录！");
                return false;
            }
        })
    })


</script>

<%@include file="/pages/common/top_nav.jsp" %>
<div id="main">
    <div id="main_inner">
        <table>
            <caption>
                商品${requestScope.item.name}详情
            </caption>
        </table>
        <div class="goodsInfo">
            <div id="image" class="image"><img src="${requestScope.item.imgPath}"></div>
            <div class="goodsInfo-warp">
                <div class="title">${requestScope.item.name}</div>
                <div class="price">${requestScope.item.price}元</div>
                <div class="sales">
                    <span class="label">销量</span>
                    <span class="count">${requestScope.item.sales}</span>
                </div>
                <div class="type">
                    <span class="label">分类 </span>
                    <span>
                        <c:if test="${requestScope.item.categoryId==1}">食品</c:if>
                        <c:if test="${requestScope.item.categoryId==2}">服装</c:if>
                        <c:if test="${requestScope.item.categoryId==3}">日用品</c:if>
                        <c:if test="${requestScope.item.categoryId==4}">家具</c:if>
                        <c:if test="${requestScope.item.categoryId==5}">电器</c:if>
                        <c:if test="${requestScope.item.categoryId==6}">娱乐</c:if>
                    </span>
                </div>
                <div class="stock">
                    <span class="label">库存 </span>
                    <span>${requestScope.item.stock}</span>
                </div>
                <div class="info">
                    <span class="label">商品描述 </span><br><br>
                    <span>${requestScope.item.goodsInfo}</span>
                </div>
                <div style="display: flex">
                    <c:if test="${not empty sessionScope.user && empty sessionScope.manager && empty sessionScope.seller}">
                        <a class="addToCart submit-btn" name="submit"
                           href="cartServlet?action=addItem&id=${requestScope.item.id}&stock=${requestScope.item.stock}"
                           stock="${requestScope.item.stock}">加入购物车</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<input type="hidden" id="userId" value="${sessionScope.user.id}">
<input type="hidden" id="goodsId" value="${requestScope.item.id}">
<input type="hidden" id="categoryId" value="${requestScope.item.categoryId}">
<%@include file="/pages/common/footer.jsp" %>
</body>
</html>
