<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function fn_ca_paging(pnum) {
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
	var movie_cd = $(e).attr('class').split(" ")[1];
	var movie_nm = $(e).html();
	console.log("detail_category3.jsp / getMRList / movie_nm : "+movie_nm);
	$.ajax({
		type : 'POST',
		url : "./movieInfoView",
		data : {
			'movie_cd' : movie_cd,
			'movie_nm' : movie_nm
		},
		success : function(html) {
			$('.movie_info').empty();
			$('.movie_info').append(html);
			
			$.ajax({
				type : 'POST',
				url : "./oneContentView",
				data : {
					"sort_id" : "sort_time",
					'movie_nm' : movie_nm,
					'start_content' : 0,
					'end_content' : 9,
					'pnum' : 1
				},
				success : function(html) {
					$('.contentList').empty();
					$('.contentList').append(html);
				},
				error : function(error) {
					console.log(error);
				}
			})
			
			$.ajax({
				type : 'POST',
				url : "./bestContent",
				data : {
					"sort_id" : "sort_likeit",
					'movie_nm' : movie_nm,
					'start_content' : 0,
					'end_content' : 3					
				},
				success : function(html) {
					$('.best_contentList').empty();
					$('.best_contentList').append(html);
				},
				error : function(error) {
					console.log(error);
				}
			})
		},
		error : function(error) {
			console.log(error);
		}
	})
}

$( document ).ready(function() {
	var idx0 = $('.de_caM').first();
	getMRList(idx0);
})
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
	text-decoration: none;
	font-size: large;
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
</style>
<div class="de_ca_3">
	<input type="hidden" id="de_ca_type" class="">
	<c:forEach var="mNm" items="${movieNm}" varStatus="status">
		<div class="de_caM ${movieCd[status.index]}" onclick="getMRList(this)">${mNm}</div>
	</c:forEach>
	<hr style="width: 1100px;">
	<div class="paging">
		<c:if test="${pagination.prevPage ne 0}">
			<a href="#" onClick="fn_ca_paging('${pagination.prevPage}')">◀</a>
		</c:if>
		<c:forEach var="pnum" begin="${pagination.startPage}"
			end="${pagination.endPage}">
			<c:choose>
				<c:when test="${pnum eq  pagination.curPage}">
					<span style="font-weight: bold;"><a href="#"
						onClick="fn_ca_paging('${pnum}')">${pnum}</a></span>
				</c:when>
				<c:otherwise>
					<a href="#" onClick="fn_ca_paging('${pnum}')">${pnum}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<a href="#" onClick="fn_ca_paging('${pagination.nextPage}')">▶</a>
		<%-- <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
	</c:if> --%>
	</div>
</div>