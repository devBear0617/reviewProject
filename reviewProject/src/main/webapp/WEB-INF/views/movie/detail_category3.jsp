<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="/review/resources/script/jquery-2.1.1.js"></script>
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
.de_caM {
	width: 220px;
	height: 60px;
	padding: 10px;
	float: left;
	text-align: center;
}

.paging {
	margin-left: auto;
	margin-right: auto;
	text-decoration: none; font-size : large;
	width: 1100px;
	padding: 10px;
	font-size: large;
}

.de_ca_3 {
	background: linear-gradient(to right, #E4F7BA, #FAF4C0);
	width: 1200px;
	display: inline-block;
	margin-left: auto;
	margin-right: auto;
}
}
</style>
<div class="de_ca_3">
	<input type="hidden" class="de_ca_type">
	<c:forEach var="mNm" items="${movieNm}" varStatus="status">
		<div class="de_caM ${movieCd[status.index]}"
			onclick="moreCaMovie(this)">${mNm}</div>
	</c:forEach>
	<div class="paging">
		<hr>
		<c:if test="${pagination.prevPage ne 0}">
			<a href="#" onClick="fn_paging('${pagination.prevPage}')">◀</a>
		</c:if>
		<c:forEach var="pnum" begin="${pagination.startPage}"
			end="${pagination.endPage}">
			<c:choose>
				<c:when test="${pnum eq  pagination.curPage}">
					<a href="#" onClick="fn_paging('${pnum}')"> <span
						style="font-weight: bold; text-decoration: none;">${pnum}</span></a>
				</c:when>
				<c:otherwise>
					<a href="#" onClick="fn_paging('${pnum}')">${pnum}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<a href="#" onClick="fn_paging('${pagination.nextPage}')">▶</a>
		<%-- <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
	</c:if> --%>
	</div>
	<br>

</div>