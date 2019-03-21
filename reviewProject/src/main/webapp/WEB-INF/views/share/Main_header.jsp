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
		style="background: background: -webkit-linear-gradient(to right, #abf200, #ffe400); background: linear-gradient(to right, #abf200, #ffe400); width: 1200px; height: 90px;">

		<!-- 마이페이지 -->
		<!-- 로그인 필요 시 -->
		<div style="float: right; margin-top: 20px; margin-right: 30px;">
			<c:if test="${empty sessionScope.member_id}">
				<a href="/review/mypage/join"><img alt="REMON_LOGO"
					src="/review/movie/resources/image/REMON_Join_icon(white).png"
					style="height: 50px;"></a>
				<a href="/review/mypage/login"><img alt="REMON_LOGO"
					src="/review/movie/resources/image/REMON_Login_icon(white).png"
					style="height: 50px;"></a>
			</c:if>
		</div>

		<!-- 로그인 했을 때 -->
		<c:if test="${not empty sessionScope.member_id}">
			<div style="float: right; margin-right: 10px; margin-top: 20px;">
				<div style="float: left; margin-left: 10px;">
					<a href="/review/mypage/logout"><img alt="REMON_LOGO"
						src="/review/movie/resources/image/REMON_Logout_icon(white).png"
						style="height: 50px;"></a>
				</div>
				<div style="float: left; margin-left: 10px;">
					<%-- <c:if test="${empty member_pic}">
						<a href="/review/mypage/mypageCheck"><img alt="REMON_LOGO"
							src="/review/movie/resources/image/REMON_mypage_icon(white).png"
							style="height: 50px;"></a>
					</c:if>
					<c:if test="${not empty member_pic}"> --%>
						<a href="/review/mypage/mypageCheck"><img alt="REMON_LOGO"
							src="/review/movie/resources/memberImage/${member_pic}"
							style="height: 50px;"></a>
					<%-- </c:if> --%>
				</div>
			</div>
		</c:if>
	</div>
</body>
</html>