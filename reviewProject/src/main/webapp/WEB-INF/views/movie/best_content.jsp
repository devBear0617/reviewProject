<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var emptyCheck = $('#emptyCheck').val();
	if(emptyCheck == "Empty")
		$(".best_contentList").empty();	
})
</script>
<style type="text/css">
/* 그리드 레이아웃 자료 : https://www.youtube.com/watch?v=jDD2uMJ_xNg */
.wrapper2 {
	display: grid;
	grid-template-columns: 300px 300px 300px;
	grid-template-rows: 300px 0px 0px;	
	grid-column-gap: 5px;
	grid-row-gap: 5px;
	justify-content: center;
}

.wrapperCenter {
	float: none;
	margin: 0 auto;
}

.items {
	padding: 10px;
	background-color: white;
	background-size: 100%;
	border: 1px solid #F2F2F2;
}

.items:nth-child(odd) {
	background-color: #F2F2F2;
	background-size: 100%;
	border: 1px solid #F4F4F4;
}

.center {
	margin-left: auto;
	margin-right: auto;
}

.td_class1 {
	width: 400px;
}
</style>
<br>
<div class="center">
	<table class="center" style="font-size: small;">
		<tr>		
			<td class="td_class1">
				<c:choose>
					<c:when test="${not empty movie_nm}">
						인기 리뷰 ( ${movie_nm} )
					</c:when>
					<c:otherwise>
						인기 리뷰 (전 체)
					</c:otherwise>
				</c:choose>	
			</td>
		</tr>
	</table>
</div>
<input type = "hidden" value = "${emptyCheck}" id ="emptyCheck">
<br>
<div class="wrapper2">
	<c:forEach items="${board_list}" var="board">
		<div class="items"
			onclick="move('/review/movie/detail_view/${board.board_num}')"
			style="background-color: rgba(255, 255, 255, 0.7);">
			<table>
				<tr>
					<td style="text-align: left; padding-left: 10px;" colspan="2">
						${board.member_id}</td>
					<td style="font-size: small; text-align: right;" colspan="1">조회수
						: ${board.board_readcount}&nbsp;</td>
				</tr>
				<tr>
					<td style="" colspan="3">
						<div
							style="background: url('${board.thumbnail}');height: 170px; font-size: large; font-weight: bold;">
							<div
								style="background-color: rgba(255, 255, 255, 0.7); padding-top: 10px;">
								<span style="color: black;">${board.board_title}</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td style="font-size: small; text-align: right;" colspan="3">점수:
						${board.lemon_grade}&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3"><hr></td>
				</tr>
				<tr>
					<td style="font-size: small; padding-right: 30px;"><div
							style="display: inline-block; padding-top: 5px;">
							<div style="float: left;">
								<img alt="likeit"
									src="/review/resources/image/REMON_like_icon.png"
									style="width: 20px; margin-left: -20px;">
								${board.likeit_count}
							</div>
							<div style="float: left; margin-left: 30px;">
								<img alt="likeit"
									src="/review/resources/image/REMON_comment_icon.png"
									style="width: 20px; margin-left: -20px;">
								${board.reply_count}
							</div>
						</div></td>
					<td style="font-size: small; text-align: right;" colspan="2">${board.board_date}&nbsp;</td>
				</tr>
			</table>
		</div>
	</c:forEach>
</div>
