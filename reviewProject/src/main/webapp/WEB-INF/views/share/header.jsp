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

.no_background {
	background: none;
	width: 400px;
	align-content: center;
}
</style>
</head>
<body>
	<div class="center">

		<table class="center"
			style="background: background: -webkit-linear-gradient(to right, #abf200, #ffe400); background: linear-gradient(to right, #abf200, #ffe400); width: 1200px; height: 90px;">
			<tr>
				<td class="no_background">
					<!-- 로고 -->
					<div class="logo"
						style="float: left; margin-top: 10px; margin-left: 20px;">
						<a href="/review"><img alt="REMON_LOGO"
							src="/review/movie/resources/image/REMON_logo(white_bigsize).png"
							style="height: 50px;"></a>
					</div>
				</td>
				<td class="no_background">
					<!-- 검색 바 -->
					<div class='moveBT' data-target="#searchMain">
						<form action="/review/search/main/" id="searchMain">
							<input type="text" id="query" name="query"
								style="width: 300px; height: 30px; border-radius: 20px; border-style: none;">
							<button
								style="width: 50px; height: 30px; border-radius: 20px; border-style: none; background-color: yellow;">검색</button>
						</form>
					</div>
				</td>
				<td class="no_background">
					<!-- 마이페이지 --> <!-- 로그인 필요 시 -->
					<div style="float: right; margin-top: 10px; margin-right: 20px;">
						<c:if test="${empty sessionScope.member_id}">
							<a href="/review/mypage/join"><img alt="REMON_LOGO"
								src="/review/movie/resources/image/REMON_Join_icon(white).png"
								style="height: 50px;"></a>
							<a href="/review/mypage/login"><img alt="REMON_LOGO"
								src="/review/movie/resources/image/REMON_Login_icon(white).png"
								style="height: 50px;"></a>
						</c:if>
					</div> <!-- 로그인 했을 때 --> <c:if test="${not empty sessionScope.member_id}">
						<div style="float: right; margin-right: 10px; margin-top: 10px;">

							<div style="float: left; margin-left: 10px;">
								<a href="/review/mypage/logout"><img alt="REMON_LOGO"
									src="/review/movie/resources/image/REMON_Logout_icon(white).png"
									style="height: 50px;"></a>
							</div>
							<div style="float: left; margin-left: 10px;">
								<%-- <c:if test="${empty user.member_pic}">
									<a href="/review/mypage/mypageCheck"><img alt="REMON_LOGO"
										src="/review/movie/resources/image/REMON_mypage_icon(white).png"
										style="height: 50px;"></a>
								</c:if>
								<c:if test="${not empty user.member_pic}"> --%>
								<div style="height: 50px; width: 50px; border-radius: 50px;">
									<a href="/review/mypage/mypageCheck"><img alt="REMON_LOGO"
										src="/review/movie/resources/memberImage/${user.member_pic}"
										style="height: auto; width: 50px;"></a>
								</div>
								<%-- </c:if> --%>
							</div>
						</div>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>