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
	//상세한 내용은 상의 후 결정해야 함 - 테스트용
	/* var board_num = $(e).children(".b_num").text();
	var url = "./detail_view/" + board_num;
	location.href = url; */
	
	/* location.replace(str); <페이지를 바꿔버림>*/

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
	
<!-- forEach - 리뷰 -->	
<%-- 	<div>
		<!-- 테스트용  -->
		<table border="1">
		<c:forEach items="${board_list}" var="board">
			<tr onclick="move(this)">
				<td class="b_num">${board.board_num}</td>
				<td>${board.b_movieVO.b_movie_num}</td>
				<td>${board.board_title}</td>
				<td>${board.board_content}</td>
				<td>${board.board_date}</td>
				<td>${board.member_id}</td>
			</tr>
		</c:forEach>
		</table>
		
		<br><br> --%>
		
		<%-- <div class="wrapper">
			<c:forEach items="${board_list}" var="board">
			<div>
				<table border="1">
					<tr onclick="move(this)">
						<td class="b_num" hidden>${board.board_num}</td>
						<td>
							제목 : ${board.board_title}<br>
							작성자 : ${board.member_id}<br>
							date : ${board.board_date}
						</td>
					</tr>
				</table>
			</div>
			</c:forEach>
		</div> --%>
		
<%-- 		<div class="wrapper">
			<c:forEach items="${board_list}" var="board">
				<div class="items">
					<table>
					<tr onclick="move(this)">
						<td class="b_num" hidden>${board.board_num}</td>
						<td>제목 : ${board.board_title}</td>
					</tr>
					<tr>
						<td>${board.member_id}</td>
					</tr>
					<tr>
						<td>${board.board_date}</td>
					</tr>
					</table>
				</div>
			</c:forEach>
		</div> --%>
		
 		<div class="wrapper">
			<c:forEach items="${board_list}" var="board">
			<div class="items" onclick="move('./detail_view/${board.board_num}')">
				<%-- ${board.board_title} <br>
				${board.member_id} <br>
				${board.board_date} --%>
				<table>
					<tr>
						<td>${board.board_title}</td>
					</tr>
					<tr height="120">
						<td>${board.member_id}</td>
					</tr>
					<tr>
						<td>${board.board_date}</td>
					</tr>
				</table>
			</div>
			</c:forEach>
		</div>
	
	<!-- </div> -->

</body>
</html>



<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type = "text/javascript" src = "resources/script/jquery-2.1.1.js"></script>
<script type="text/javascript">
function move(e){
	//상세한 내용은 상의 후 결정해야 함 - 테스트용
	var board_num = $(e).children(".b_num").text(); 
	var url = "./detail_view/" + board_num;
	location.href = url;
}
</script>   
<!-- 최신순, 좋아요순, 별점순 바 -->
	<div>
		<ul>
			<li>최신순</li>
			<li>좋아요순</li>
			<li>별점순순</li>
			<!-- if 오름 내림 차순 선택가능. -->
		</ul>
	</div>
	
<!-- forEach - 리뷰 -->	
	<div>
		<!-- 테스트용  -->
		<table border="1">
		<c:forEach items="${board_list}" var="board">
			<tr onclick="move(this)">
				<td class="b_num">${board.board_num}</td>
				<td>${board.b_movieVO.b_movie_num}</td>
				<td>${board.board_title}</td>
				<td>${board.board_content}</td>
				<td>${board.board_date}</td>
				<td>${board.member_id}</td>
			</tr>
		</c:forEach>
		</table>
	</div> --%>
