<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type = "text/javascript" src = "/review/resources/script/jquery-2.1.1.js"></script>
<script type = "text/javascript">

$('#likeXbt').click(function () {
	$.ajax({
		url: '/review/movie/detail_view/${board.board_num}/likeItP',
		type: 'POST',
		dataType: 'html',
		success: function (html) {
			$(".likeIt").empty();
			$(".likeIt").append(html);
			
		}
	});
});

$('#likeObt').click(function () {
	$.ajax({
		url: '/review/movie/detail_view/${board.board_num}/likeItM',
		type: 'POST',
		dataType: 'html',
		success: function (html) {
			$(".likeIt").empty();
			$(".likeIt").append(html);
			
		}
	});
});

</script>

</head>
<body>

<h4>좋아요</h4>
좋아요 count : ${likeCount}

<br>

<!-- 로그인 x -->
<c:if test="${empty sessionScope.member_id}">
	<form action="/review/mypage/login" id="login">
		<input type="submit"  value="좋아요 ♡">
	</form>
</c:if>
<!-- 로그인 o -->
<c:if test="${not empty sessionScope.member_id}">
	
	<c:forEach items="${board.likeList}" var="like">
		<c:if test="${like.member_id == sessionScope.member_id}">
			<input type="button" id="likeObt" value="좋아요 ♥">
		</c:if>
		
		<%-- <c:if test="${like.member_id != sessionScope.member_id}">
			<input type="button" id="likeXbt" value="좋아요 ♡">
		</c:if> --%>
 	</c:forEach>
 	
 	
</c:if>

</body>
</html>