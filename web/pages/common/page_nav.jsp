<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${requestScope.page.items.size()!=0}">
    <div id="page_nav">
        <div class="center">
            <ul class="pagination">
                <c:if test="${requestScope.page.pageNo > 1}">
                    <li><a href="${requestScope.page.url}&pageNo=1">首页</a></li>
                    <li><a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo-1}">上一页</a></li>
                </c:if>
                <c:choose>
                    <c:when test="${requestScope.page.pageTotal <= 5}">
                        <c:forEach begin="1" end="${requestScope.page.pageTotal}" var="i">
                            <c:if test="${requestScope.page.pageNo == i}">
                                <li><a class="active" href="#">${i}</a></li>
                            </c:if>
                            <c:if test="${requestScope.page.pageNo != i}">
                                <li><a href="${requestScope.page.url}&pageNo=${i}">${i}</a></li>
                            </c:if>
                        </c:forEach>
                    </c:when>
                    <c:when test="${requestScope.page.pageTotal > 5}">
                        <c:choose>
                            <c:when test="${requestScope.page.pageNo <= 3}">
                                <c:forEach begin="1" end="5" var="i">
                                    <c:if test="${requestScope.page.pageNo == i}">
                                        <li><a class="active" href="#">${i}</a></li>
                                    </c:if>
                                    <c:if test="${requestScope.page.pageNo != i}">
                                        <li><a href="${requestScope.page.url}&pageNo=${i}">${i}</a></li>
                                    </c:if>
                                </c:forEach>
                            </c:when>
                            <c:when test="${requestScope.page.pageNo >= requestScope.page.pageTotal-2}">
                                <c:forEach begin="${requestScope.page.pageTotal-4}" end="${requestScope.page.pageTotal}"
                                           var="i">
                                    <c:if test="${requestScope.page.pageNo == i}">
                                        <li><a class="active" href="#">${i}</a></li>
                                    </c:if>
                                    <c:if test="${requestScope.page.pageNo != i}">
                                        <li><a href="${requestScope.page.url}&pageNo=${i}">${i}</a></li>
                                    </c:if>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:forEach begin="${requestScope.page.pageNo-2}" end="${requestScope.page.pageNo+2}"
                                           var="i">
                                    <c:if test="${requestScope.page.pageNo == i}">
                                        <li><a class="active" href="#">${i}</a></li>
                                    </c:if>
                                    <c:if test="${requestScope.page.pageNo != i}">
                                        <li><a href="${requestScope.page.url}&pageNo=${i}">${i}</a></li>
                                    </c:if>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                </c:choose>


                <c:if test="${requestScope.page.pageNo < requestScope.page.pageTotal}">
                    <li><a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo+1}">下一页</a></li>
                    <li><a href="${requestScope.page.url}&pageNo=${requestScope.page.pageTotal}">末页</a></li>
                </c:if>
            </ul>
            <div>
                共${requestScope.page.pageTotalCount}条记录，共${requestScope.page.pageTotal}页，到第
                <input name="pn" id="pn_input" value="${param.pageNo==null?1:param.pageNo}">页
                <input id="searchPageBtn" type="button" value="确定" class="pav_btn">
            </div>
        </div>
        <script>
            $(function () {
                $("#searchPageBtn").click(function () {
                    var pageNo = $("#pn_input").val();
                    if (pageNo <= ${requestScope.page.pageTotal} && pageNo > 0) {
                        location.href = "${pageScope.basePath}${requestScope.page.url}&pageNo=" + pageNo;
                    } else {
                        alert("输入页码不在有效范围内！");
                    }
                })
            })
        </script>
    </div>
</c:if>