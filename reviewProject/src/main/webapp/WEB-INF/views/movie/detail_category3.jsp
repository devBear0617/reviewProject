<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/review/resources/script/jquery-2.1.1.js"></script>
<script type="text/javascript">
var de_category_type = $('.de_ca_type').attr('id');
function fn_paging(pnum) {
	$.ajax({
		type : 'POST',
		url : "./moreCaMovie",
		cache : false,
		data : {
			'de_category_type' : de_category_type,
			'pnum' : pnum
		},
		success : function(html) {
			$('.detail2_category').empty();
			$('.detail2_category').append(html);
		},
		error : function(error) {
			console.log(error);
		}
	})
}
</script>
<style type="text/css">
.de_caM{
	float:left; 
	width: 300px;
}
</style>
<div>
	<input type="hidden" class="de_ca_type">
	<c:forEach var="mNm" items="${movieNm}" varStatus="status">
		<div class="de_caM ${movieCd[status.index]}" onclick="moreCaMovie(this)">${mNm}</div>
	</c:forEach>
</div>
<div class="paging">
	<c:if test="${pagination.prevPage ne 0}">
		<a href="#" onClick="fn_paging('${pagination.prevPage}')">[이전]</a> 
	</c:if>
	<c:forEach var="pnum" begin="${pagination.startPage}" end="${pagination.endPage}">
		<c:choose>
			<c:when test="${pnum eq  pagination.curPage}">
				<span style="font-weight: bold;"><a href="#" onClick="fn_paging('${pnum}')">${pnum}</a></span> 
			</c:when>
			<c:otherwise>
				<a href="#" onClick="fn_paging('${pnum}')">${pnum}</a> 
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<a href="#" onClick="fn_paging('${pagination.nextPage}')">[다음]</a> 
	<%-- <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
	</c:if> --%>
</div>