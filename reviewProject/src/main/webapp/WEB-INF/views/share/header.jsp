<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 상단바, 로고 -->
	<div>
		<c:if test="${empty sessionScope.member_id}">
			<input type="button" value="로그인" 
				onclick="location.href='/review/mypage/login'">
		</c:if>
	
		<c:if test="${not empty sessionScope.member_id}">
			${user.member_name} (${user.member_id})님 login.<br>
			<input type="button" value="로그아웃" 
				onclick="location.href='/review/mypage/logout'">
			<input type="button" value="mypage"
				onclick="location.href='/review/mypage/mypageCheck'">
		</c:if>	
	</div>
	
<!-- 검색 바 -->
	<div class = 'moveBT' data-target="#searchMain">
		<form action="/review/search/main/" id="searchMain">
			<input type="text" id="query" name="query">	
			<button>test - 검색</button>
		</form>
	</div>

</body>
</html>