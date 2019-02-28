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

	<div style="background-image:url('resources/image/REMON_bar.png'); width:auto; height: 80px;">
		<!-- 로그인 -->

		<div style="float: right; margin-top: 10px;">
			<c:if test="${empty sessionScope.member_id}">
				<input type="button" value="로그인"
					onclick="location.href='/review/mypage/login'"
					style="width: 100px; height: 30px; border-radius: 30px; border-style: none; margin-top: 10px; margin-right: 10px;">
			</c:if>

			<c:if test="${not empty sessionScope.member_id}">
				<input type="button" value="로그아웃"
					onclick="location.href='/review/mypage/logout'"
					style="width: 100px; height: 30px; border-radius: 30px; border-style: none; margin-top: 10px; margin-right: 10px;">
				<input type="button" value="정보변경"
					onclick="location.href='/review/mypage/updateMember'"
					style="width: 100px; height: 30px; border-radius: 30px; border-style: none; margin-top: 10px; margin-right: 10px;">
			</c:if>


			<br>
			<br>
		</div>
	</div>
</body>
</html>