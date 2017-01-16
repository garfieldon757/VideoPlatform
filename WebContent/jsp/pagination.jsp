<c:if test="${ page - 4 > 0 }">
    <li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=1">首页</a></li>
    <li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=2">2</a></li>
	<li><a href="">...</a></li>
	<li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=${page-2}">${page - 2}</a></li>
	<li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=${page-1}">${page - 1}</a></li>
</c:if>
<c:if test="${ ( page - 3 > 0 )  and  (  page - 4 == 0 ) }">
	<li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=${page-3}">${page - 3}</a></li>
	<li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=${page-2}">${page - 2}</a></li>
	<li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=${page-1}">${page - 1}</a></li>
</c:if>
<c:if test="${ ( page - 2 > 0 )  and  (  page - 3 == 0 ) }">
    <li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=${page-2}">${page - 2}</a></li>
	<li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=${page-1}">${page - 1}</a></li>
</c:if>
<c:if test="${  ( page - 1 > 0 )  and  (  page - 2 == 0 ) }">
	<li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=${page-1}">${page - 1}</a></li>
</c:if>
<li class="active"><a href="">${page}</a></li>
<c:if test="${  (page + 1 <= totalPageNum)  and  (page + 2 > totalPageNum) }">
	<li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=${page+1}">${page + 1}</a></li>
</c:if>
<c:if test="${ (page + 2 <= totalPageNum) and (page + 3 > totalPageNum) }">
    <li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=${page+1}">${page + 1}</a></li>
	<li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=${page+2}">${page + 2}</a></li>
</c:if>
<c:if test="${ (page + 3 <= totalPageNum) and (page + 4 > totalPageNum) }">
	<li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=${page+1}">${page+1}</a></li>
	<li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=${page+2}">${page+2}</a></li>
	<li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=${page+3}">${page+3}</a></li>
</c:if>
<c:if test="${ page + 4 <= totalPageNum }">
    <li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=${page+1}">${page + 1}</a></li>
	<li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=${page+2}">${page + 2}</a></li>
	<li><a href="">...</a></li>
	<li><a href="videoSearchInit?videoCategoryID=${videoCategoryID}&page=<fmt:formatNumber type="number" value="${videoListSize/16}" maxFractionDigits="0"/>">尾页</a></li>
</c:if>