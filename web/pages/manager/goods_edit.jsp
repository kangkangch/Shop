<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品编辑界面</title>
    <%@include file="/pages/common/head.jsp" %>


    <style>
        td {
            width: 100px;
        }
    </style>

    <script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
    <script type="text/javascript">
        var ip = "";
        var date = new Date();
        $(function () {
            //获取ip
            ip = returnCitySN.cip;
            $("#ip").val(ip);

            $("#submit_btn").click(function () {
                var name = $("#name").val();
                var price = $("#price").val();
                var sales = $("#sales").val();
                var stock = $("#stock").val();
                name = $.trim(name);
                price = $.trim(price);
                sales = $.trim(sales);
                stock = $.trim(stock);
                if (name == null || name == "") {
                    $("#errorMessage").text("名称不能为空！");
                    return false;
                }
                if (price == null || price == "") {
                    $("#errorMessage").text("价格不能为空！");
                    return false;
                } else {
                    if (parseInt(price) <= 0) {
                        $("#errorMessage").text("输入价格有误！");
                        return false;
                    }
                }
                if (sales == null || sales == "") {
                    $("#errorMessage").text("销量不能为空！");
                    return false;
                } else {
                    if (parseInt(sales) < 0) {
                        $("#errorMessage").text("输入销量有误！");
                        return false;
                    }
                }
                if (stock == null || stock == "") {
                    $("#errorMessage").text("库存不能为空！");
                    return false;
                } else {
                    if (parseInt(stock) < 0) {
                        $("#errorMessage").text("输入库存有误！");
                        return false;
                    }
                }
                if ($("#select_category").val() == "0") {
                    $("#errorMessage").text("商品类型不能为空！");
                    return false;
                }
                date = new Date();
                $("#date").val(date.toLocaleString());
            })
        })
    </script>
</head>
<body>
<%@include file="/pages/common/top_nav.jsp" %>
<div id="main">
    <div style="width: 400px;margin: 0 auto">
        <form action="manager/goodsServlet?action=${param.method}" method="post" enctype="multipart/form-data">

            <input type="hidden" name="id" value="${param.id}" id="id">
            <input type="hidden" name="sellerId" value="${param.sellerId}" id="sellerId">

            <div style="width: 400px;height: 100px;">
                <div style="font-size: 50px;text-align: center">编辑商品信息</div>
                <div id="errorMessage" class="errorMessage">${requestScope.msg}</div>
            </div>
            <div style="width: 400px;height: 200px;">
                <img src="${empty requestScope.goods.imgPath?"static/img/default.jpg":requestScope.goods.imgPath}"
                     style="height: 100%; width: auto; margin: 0 auto;display: block" id="photo">
            </div>
            <br>
            <div>
                <table>
                    <tbody>
                    <tr>
                        <td>名称：</td>
                        <td><input type="text" name="name" value="${requestScope.goods.name}" id="name"></td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td>价格：</td>
                        <td><input type="text" name="price" value="${requestScope.goods.price}" id="price"></td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td>销量：</td>
                        <td><input type="text" name="sales" value="${requestScope.goods.sales}" id="sales"></td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td>库存：</td>
                        <td><input type="text" name="stock" value="${requestScope.goods.stock}" id="stock"></td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td>类型：</td>
                        <td>
                            <select name="categoryId" id="select_category">
                                <option value="0">无选择</option>
                                <option value="1">食品</option>
                                <option value="2">服装</option>
                                <option value="3">日用品</option>
                                <option value="4">家具</option>
                                <option value="5">电子产品</option>
                                <option value="6">娱乐</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td>描述:</td>
                        <td><input type="text" name="goodsInfo" value="${requestScope.goods.goodsInfo}" id="goodsInfo">
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td>图片：</td>
                        <td><input type="file" name="photo" style="width: 177px;cursor: pointer" id="choose_photo"></td>
                        <script type="text/javascript">

                            function ProcessFile(e) {
                                //创建文件对象
                                var file = document.getElementById('choose_photo').files[0];
                                var photo = document.getElementById("photo");
                                //如果有获取到东西
                                if (file) {
                                    //创建文件读取对象
                                    var reader = new FileReader();
                                    //加载完成后
                                    reader.onload = function (event) {
                                        var txt = event.target.result;
                                        photo.src = txt;
                                    };
                                }
                                reader.readAsDataURL(file);
                            }

                            function contentLoaded() {
                                document.getElementById('choose_photo').addEventListener('change',
                                    ProcessFile, false);
                            }

                            window.addEventListener("DOMContentLoaded", contentLoaded, false);

                        </script>
                    </tr>
                    </tbody>
                </table>
                <br>

                <input class="login-btn" type="submit" name="submit" value="修改" id="submit_btn">

            </div>


            <input type="hidden" name="ip" id="ip">
            <input type="hidden" name="date" id="date">
            <input type="hidden" name="role" value="商家">
            <input type="hidden" name="roleId" value="${param.sellerId}">
            <input type="hidden" name="operate" value="${param.method=="addWithPhoto"?"添加":"修改"}">
            <input type="hidden" name="target" id="target" value="商品${requestScope.goods.id}">


        </form>
    </div>
</div>

<div id="b"></div>
<%@include file="/pages/common/footer.jsp" %>
</body>
</html>
