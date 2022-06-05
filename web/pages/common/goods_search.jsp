<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="search-header-wrapper">
    <div class="search-header">
        <h1 id="logo">
            <a href="client/goodsServlet?action=page"></a>
        </h1>
        <div class="search bar2">
            <form action="client/goodsServlet" method="post">
                <input type="hidden" name="action" value="pageByName">
                <input type="text" id="goods_name" name="goods_name" value="${requestScope.goods_name}"
                       class="input_content" placeholder="搜索商品">

                <input type="hidden" name="ip" id="ip">
                <input type="hidden" name="date" id="date">
                <input type="hidden" name="role" value="用户">
                <input type="hidden" name="roleId" value="${sessionScope.user.id}">
                <input type="hidden" name="operate" value="查询">
                <input type="hidden" name="target" id="target">

                <button class="submit-btn" type="submit" id="goods_search"></button>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">

</script>