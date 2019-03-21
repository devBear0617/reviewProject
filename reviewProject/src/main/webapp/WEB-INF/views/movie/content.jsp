<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$('.sort').click(function () {
	var data = {
			"sort_id" : $(this).attr('id'),
			"start_content" : ${start_content},
			"end_content" : 9
	}
	$.ajax({
		type : "POST",
		url : "./contentView",
		cache : false,
		dataType : 'html',
		data : data,
		success : function(html) {			
		    console.log('success');
			$(".content").empty();
			$(".content").append(html);
		}
	}); 
});

$('#moreList').click(function () {
	console.log("moreList bt");	
	var data = {
			"sort_id" : $('#sort_id').val(),
			"start_content" : ${start_content},
			"end_content" : ${end_content+9}
	}
	$.ajax({
		type : "POST",
		url : "./contentView",
		dataType : 'html',
		data : data,
		success : function(html) {
			$(".content").empty();
			$(".content").append(html);
		}
	});
});

function move(e){	
	location.href = e;
}
</script>

<style type="text/css">
/* 그리드 레이아웃 자료 : https://www.youtube.com/watch?v=jDD2uMJ_xNg */
.wrapper {
	display: grid;
	grid-template-columns: 200px 200px 200px;
	grid-template-rows: 200px 200px 200px;
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
	<br>
	<!-- 최신순, 좋아요순, 별점순 바 -->
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
				<!--  
	썸네일 임시로 div 배경으로 설정함 디자인상 변경필요하면  변경 ㄱㄱ   <img src="${board.thumbnail}"> 	
-->
				<table>
					<tr>
						<td style="font-size: small; text-align: left;" colspan="2">${board.member_id}</td>
					</tr>
					<tr>
						<td style="height: 100px;" colspan="2">${board.board_title}</td>
						
						<!-- readCount -->
						<br>
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
	<c:if test="${end_content < movieBoardCount}">
		<div  id = "moreList" >
			<img alt="REMON_LOGO" src="/review/movie/resources/image/REMON_more.png" style="height: 20px;">
		</div>
	</c:if>
