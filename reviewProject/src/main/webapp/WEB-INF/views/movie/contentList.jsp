<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/review/resources/script/pagenation.js"></script>
<script type="text/javascript" src="/review/resources/script/mr_sort.js"></script>
<style type="text/css">
.wrapper {
	display: grid;
	grid-template-columns: 300px 300px 300px;
	grid-template-rows: 300px 300px 300px;
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
<div class="center">
	<input type="hidden" id="sort_id" value="${sort_id}">
	<table class="center" style="font-size: small;">
		<tr>
			<td class="td_class1">
				<c:choose>
					<c:when test="${sort_id == 'sort_time'}">
						<span class="sort" id="sort_time"
							style="color: #31B404; text-decoration: underline; font-weight:bold;">최신순</span>
					</c:when>
					<c:otherwise>
						<span class="sort" id="sort_time">최신순</span>
					</c:otherwise>
				</c:choose>
			</td>
			<td class="td_class1">
				<c:choose>
					<c:when test="${sort_id == 'sort_likeit'}">
						<span class="sort" id="sort_likeit"
							style="color: #31B404; text-decoration: underline; font-weight:bold;">좋아요순</span>
					</c:when>
					<c:otherwise>
						<span class="sort" id="sort_likeit">좋아요순</span>
					</c:otherwise>
				</c:choose>			
			</td>
			<td class="td_class1">
				<c:choose>
					<c:when test="${sort_id == 'sort_grade'}">
						<span class="sort" id="sort_grade"
							style="color: #31B404; text-decoration: underline; font-weight:bold;">별점순</span>
					</c:when>
					<c:otherwise>
						<span class="sort" id="sort_grade">별점순</span>
					</c:otherwise>
				</c:choose>				
			</td>
		</tr>
	</table>
</div>
<br>
<div class="wrapper">
	<c:forEach items="${board_list}" var="board">
		<div class="items"
			onclick="move('/review/movie/detail_view/${board.board_num}')"
			style="background-color: rgba(255, 255, 255, 0.7);">
			<table>
				<tr>
					<td style="text-align: left; padding-left: 10px;" colspan="2">
						<div style="display: inline-block;">
							<div style="float: left;">
								<img
									src="/review/movie/resources/memberImage/${board.memberVO.member_pic}"
									style="width: 30px; height: 30px; border-radius: 50px;">
							</div>
							<div style="float: left;">&nbsp;&nbsp;${board.member_id}</div>
						</div>
					</td>
					<td style="font-size: small; text-align: right;" colspan="1">조회수
						: ${board.board_readcount}&nbsp;</td>
				</tr>
				<tr>
					<td style="" colspan="3">
						<div
							style="background: url('${board.thumbnail}');height: 170px; font-size: large; font-weight: bold;">
							<div style="background-color: rgba(255, 255, 255, 0.7);">
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
<div style="height: 20px;"></div>
<div class="paging">
	<c:if test="${pagination.startPage ne 0}">
		<c:if test="${pagination.prevPage ne 0}">
			<a href="#" onClick="fn_mr_paging('${pagination.prevPage}')">[이전]</a>
		</c:if>
		<c:forEach var="pnum" begin="${pagination.startPage}"
			end="${pagination.endPage}">
			<c:choose>
				<c:when test="${pnum eq  pagination.curPage}">
					<span style="font-weight: bold;">
						<a href="#" onClick="fn_mr_paging('${pnum}')">${pnum}</a>
					</span>
				</c:when>
				<c:otherwise>
					<a href="#" onClick="fn_mr_paging('${pnum}')">${pnum}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if
			test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
			<a href="#" onClick="fn_mr_paging('${pagination.nextPage}')">[다음]</a>
		</c:if>
	</c:if>
</div>
