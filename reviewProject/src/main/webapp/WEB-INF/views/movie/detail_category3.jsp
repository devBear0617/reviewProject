<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="/review/resources/script/jquery-3.3.1.min.js"></script>
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
						$('.detail2_category').find('#de_ca_type').addClass(
								de_ca_type);
						$('.detail2_category').find('#de_ca_type').addClass(cd);
					},
					error : function(error) {
						console.log(error);
					}
				})
	}
	function getMRList(e) {
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
	<input type="hidden" class="de_ca_type">
	<c:forEach var="mNm" items="${movieNm}" varStatus="status">
		<div class="de_caM ${movieCd[status.index]}"
			onclick="moreCaMovie(this)">${mNm}</div>
	</c:forEach>
	<hr width="1100px">
	<div class="paging">
		<c:if test="${pagination.prevPage ne 0}">
			<a href="#" onClick="fn_paging('${pagination.prevPage}')">◀</a>
		</c:if>
		<c:forEach var="pnum" begin="${pagination.startPage}"
			end="${pagination.endPage}">
			<c:choose>
				<c:when test="${pnum eq  pagination.curPage}">
					<span style="font-weight: bold;"><a href="#"
						onClick="fn_paging('${pnum}')">${pnum}</a></span>
				</c:when>
				<c:otherwise>
					<a href="#" onClick="fn_paging('${pnum}')">${pnum}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<a href="#" onClick="fn_paging('${pagination.nextPage}')">▶</a>
	</div>
</div>
<div class="movieInfo"></div>