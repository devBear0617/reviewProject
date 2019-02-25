<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<td><fmt:formatDate value="${board.board_date}" pattern="yyyy-MM-dd hh:mm"/></td>
				<td>${board.member_id}</td>
			</tr>
		</c:forEach>
		</table>
	</div>
