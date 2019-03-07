<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
</style>
</head>
<body>
	<div class="center"
		style="background: background: -webkit-linear-gradient(to right, #abf200, #ffe400); background: linear-gradient(to right, #abf200, #ffe400); width: auto; height: 90px;">
		<!-- 로고 -->
		<div class="logo"
			style="float: left; margin-top: 20px; margin-left: 20px;">
			<a href="movie/detail_bar.jsp"><img alt="REMON_LOGO"
				src="/review/movie/resources/image/REMON_logo(white_bigsize).png"
				style="height: 50px;"></a>
		</div>

		<!-- 검색 바 -->
		<div class='moveBT' data-target="#searchMain"
			style="float: left; margin-top: 30px; margin-left: 350px; position: inherit;">
			<form action="/review/search/main/" id="searchMain">
				<input type="text" id="query" name="query"
					style="width: 300px; height: 30px; border-radius: 20px; border-style: none;">
				<button
					style="width: 50px; height: 30px; border-radius: 20px; border-style: none; background-color: yellow;">검색</button>
			</form>
		</div>

		<!-- 마이페이지 -->
		<!-- 로그인 필요 시 -->
		<div style="float: right; margin-top: 20px; margin-right: 30px;">
			<c:if test="${empty sessionScope.member_id}">
				<!-- <input type="button" value="로그인"
					onclick="location.href='/review/mypage/login'"
					style="height: 30px; width: 60px; border-radius: 20px; border-style: none; background-color: yellow;"> -->
				<a href="/review/mypage/login"><img alt="REMON_LOGO"
					src="/review/movie/resources/image/REMON_Login_icon(white).png"
					style="height: 50px;"></a>
			</c:if>
		</div>

		<!-- 로그인 했을 때 -->
		<c:if test="${not empty sessionScope.member_id}">
			<div style="float: right; margin-right: 10px; margin-top: 20px;">
				<%-- <div
					style="float: left; margin-left: 10px; margin-top: 10px; font-size: large;">${user.member_name}
					(${user.member_id})님</div> --%>

				<div style="float: left; margin-left: 10px;">
					<a href="/review/mypage/logout"><img alt="REMON_LOGO"
						src="/review/movie/resources/image/REMON_Logout_icon(white).png"
						style="height: 50px;"></a>
					<!-- <input type="button" value="로그아웃"
						onclick="location.href='/review/mypage/logout'"
						style="height: 30px; width: 60px; border-radius: 20px; border-style: none; background-image: url('../resources/image/REMON_Logout_icon(white).png');"> -->
				</div>
				<div style="float: left; margin-left: 10px;">
					<a href=/review/mypage/mypageCheck"><img alt="REMON_LOGO"
						src="/review/movie/resources/image/REMON_mypage_icon(white).png"
						style="height: 50px;"></a>
					<!-- <input type="button" value="mypage"
						onclick="location.href='/review/mypage/mypageCheck'"
						style="height: 30px; width: 60px; border-radius: 20px; border-style: none; background-image: url('../resources/image/REMON_mypage_icon(white).png');"> -->
				</div>
			</div>
		</c:if>
	</div>
</body>
</html>