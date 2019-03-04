<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type = "text/javascript" src = "resources/script/jquery-2.1.1.js"></script>
<script type="text/javascript">

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
    grid-row-gap:5px;
}

.items{
	padding: 10px;
	background-color: white;
}

.items:nth-child(odd) {
	background-color: gray;
	
}

</style>

</head>
<body>

<!-- 최신순, 좋아요순, 별점순 바 -->
	<div>
		<ul>
			<li>최신순</li>
			<li>좋아요순</li>
			<li>별점순순</li>
			<!-- if 오름 내림 차순 선택가능. -->
		</ul>
	</div>

		
 		<div class="wrapper">
			<c:forEach items="${board_list}" var="board">
			<div class="items" onclick="move('./detail_view/${board.board_num}')">
				<table>
					<tr>
						<td>${board.board_num}</td>
					</tr>
					<tr>
						<td>${board.board_title}</td>
					</tr>
					<tr>
						<td>${board.member_id}</td>
					</tr>
					<tr>
						<td>${board.board_date}</td>
					</tr>
					<tr>
						<td><img src="${board.thumbnail}"></td>
					</tr>
				</table>
			</div>
			</c:forEach>
		</div>
	
	<!-- </div> -->

</body>
</html>

