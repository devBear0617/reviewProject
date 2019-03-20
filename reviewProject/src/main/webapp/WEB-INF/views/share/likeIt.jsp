<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type = "text/javascript" src = "/review/resources/script/jquery-3.3.1.min.js"></script>
<script type = "text/javascript">

// 로그인x
$('#need_login').click(function(){
	var login = confirm("좋아요를 표시하려면 로그인이 필요합니다. \n로그인 페이지로 이동하시겠습니까?");
	if(login){
		location.href = '/review/mypage/login';
	}else{	
		return false;
	}
});

//좋아요-
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
// 좋아요+
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

<br>
<!-- 로그인 x -->
<c:if test="${empty sessionScope.member_id}">
	<span id="need_login"> <img alt="likeit" src="/review/movie/resources/image/REMON_like_icon.png" class="imgform"></span> 	
</c:if>

<!-- 로그인 o -->
<c:if test="${not empty sessionScope.member_id}">
 	<c:if test="${likeCheck == 1}">
<!--  		<input type="button" id="likeObt" value="좋아요 ♥"> -->
 		<span id="likeObt"> <img alt="likeit" src="/review/movie/resources/image/REMON_like_icon_full.png" class="imgform"></span> 
 		<!-- <span id="likeObt"> <img alt="likeit" src="/review/movie/resources/image/" class="imgform"></span> -->
 	</c:if>
 	<c:if test="${likeCheck != 1}">
 		<span id="likeXbt"> <img alt="likeit" src="/review/movie/resources/image/REMON_like_icon.png" class="imgform"></span> 	
 	</c:if> 	
</c:if>
	<span>${likeCount}</span>
</body>
</html>