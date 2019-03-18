<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$('#moreList').click(function () {
	var start_content = ${start_content};
	var end_content = ${end_content};
	var data = {
			"start_content" : start_content,
			"end_content" : end_content
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

.td_class1 {
	width: 400px;
}
</style>
</head>
<body>
	<br>
	<!-- 최신순, 좋아요순, 별점순 바 -->
	<div class="center">
		<table class="center" style="font-size: small;">
			<tr>
				<td class="td_class1">최신순</td>
				<td class="td_class1">좋아요순</td>
				<td class="td_class1">별점순</td>
			</tr>
		</table>
	</div>

	<br>

	<div class="wrapper">
		<c:forEach items="${board_list}" var="board">
			<div class="items" onclick="move('./detail_view/${board.board_num}')"
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
					</tr>
					<tr>
						<td colspan="2"><hr></td>
					</tr>
					<tr>
						<td style="font-size: small; padding-right: 30px;"><img
							alt="likeit" src="../resources/image/REMON_like_icon.png"
							style="width: 20px; margin-left: -20px;"></td>
						<td style="font-size: x-small;">${board.board_date}</td>
					</tr>
				</table>
			</div>
		</c:forEach>
	</div>
	<div style="height: 20px;"></div>
	<c:if test="${end_content < movieBoardCount}">
		<div id = moreList ><img alt="REMON_LOGO"
					src="/review/movie/resources/image/REMON_more.png"
					style="height: 20px;"></div>
	</c:if>
</body>
</html>