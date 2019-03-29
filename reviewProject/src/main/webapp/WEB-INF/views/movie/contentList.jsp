<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
var movie_nm = $('.movieinfo_2').html();
console.log(movie_nm);
function fn_paging(pnum) {
	$.ajax({
		type : 'POST',
		url : "./oneContentView",
		data : {
			'pnum' : pnum,
			'movie_nm' : movie_nm 
		},
		success : function(html) {
			$('.contentList').empty();
			$('.contentList').append(html);
		},
		error : function(error) {
			console.log(error);
		}
	})
}
$('.sort').click(function () {
	console.log(movie_nm);
	var data = {
			"sort_id" : $(this).attr('id'),
			'movie_nm' : movie_nm
	}
	$.ajax({
		type : "POST",
		url : "./oneContentView",
		cache : false,
		data : data,
		success : function(html) {			
		    $('.contentList').empty();
			$('.contentList').append(html);
		}
	}); 
});
</script>
<style type="text/css">
.wrapper {
	display: grid;
	grid-template-columns: 200px 200px 200px;
	grid-template-rows: 200px 200px 200px;
	grid-column-gap: 5px;
	grid-row-gap: 5px;
	justify-content: center;
	border: 1px solid #F2F2F2;
}

.wrapperCenter {
	float: none;
	margin: 0 auto;
}

.items {
	padding: 10px;
	background-color: white;
	background-size: 100%;
	border: 1px solid gray;
}

.items:nth-child(odd) {
	background-color: gray;
	background-size: 100%;
	border: 1px solid white;
}

.center {
	margin-left: auto;
	margin-right: auto;
}

.td_class1{
	width: 400px;
}
</style>   
<div class="center">
	<input type= "hidden" id = "sort_id" value = "${sort_id}">
	<table class="center" style="font-size: small;">
		<tr>
			<td class="td_class1"><span class="sort" id="sort_time">최신순</span></td>
			<td class="td_class1"><span class="sort" id="sort_likeit">좋아요순</span></td>
			<td class="td_class1"><span class="sort" id="sort_grade">별점순</span></td>
		</tr>
	</table>
</div>
<br>
<div class="wrapper">
<c:forEach items="${board_list}" var="board">
	<div class="items" onclick="move('/review/movie/detail_view/${board.board_num}')"
		style="background-image:URL(${board.thumbnail});">
		<table>
			<tr>
				<td style="font-size: small; text-align: left;" colspan="4">${board.member_id}</td>
			</tr>
			<tr>
				<td style="height: 100px;" colspan="4">${board.board_title}</td>
				<td>조회수 : ${board.board_readcount}</td>
			</tr>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
			<tr>
				<td style="font-size: small; padding-right: 30px;">
					<span><img alt="likeit" src="/review/resources/image/REMON_like_icon.png" 
						style="width: 20px; margin-left: -20px;">
					${board.likeit_count}</span>
				</td>
				<td style="font-size: small; padding-right: 30px;">
					<span><img alt="likeit" src="/review/resources/image/REMON_comment_icon.png" 
						style="width: 20px; margin-left: -20px;">
					${board.reply_count}</span>
				</td>
				<td style="font-size: small;">점수: ${board.lemon_grade}</td>
				<td style="font-size: x-small;">${board.board_date}</td>
			</tr>
		</table>
	</div>
</c:forEach>
</div>
<div style="height: 20px;"></div>
<div class="paging">
	<c:if test="${pagination.startPage ne 0}">
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
		<c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
			<a href="#" onClick="fn_paging('${pagination.nextPage}')">[다음]</a> 
		</c:if>
	</c:if>
</div>
