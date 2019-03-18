<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function fn_paging(pnum) {
	var de_category_type = $('#de_ca_type').attr('class').split(" ");
	var de_ca_type = de_category_type[0];
	var cd = de_category_type[1];
	$.ajax({
		type : 'POST',
		url : "./moreCaMovie",
		data : {
			'de_ca_type' : de_ca_type,
			'cd' : cd,
			'pnum' : pnum
		},
		success : function(html) {
			$('.detail2_category').empty();
			$('.detail2_category').append(html);
			$('.detail2_category').find('#de_ca_type').addClass(de_ca_type);
			$('.detail2_category').find('#de_ca_type').addClass(cd);
		},
		error : function(error) {
			console.log(error);
		}
	})
}
function getMRList(e){
	//console.log($(e).attr('class'));
	var movie_cd = $(e).attr('class').split(" ")[1];
	var movie_nm = $(e).html();
	
	$.ajax({
		type : 'POST',
		url : "./oneContentView",
		data : {
			'movie_cd' : movie_cd,
			'movie_nm' : movie_nm
		},
		success : function(html) {
			$('.movieInfo').empty();
			$('.movieInfo').append(html);
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
	<input type="hidden" id="de_ca_type" class="">
	<c:forEach var="mNm" items="${movieNm}" varStatus="status">
		<div class="de_caM ${movieCd[status.index]}" onclick="getMRList(this)">${mNm}</div>
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
<div class="movieInfo"></div>