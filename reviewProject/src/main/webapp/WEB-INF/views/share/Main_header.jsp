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

.main_header_div1 {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	background: background: -webkit-linear-gradient(to right, #abf200, #ffe400);
	background: linear-gradient(to right, #abf200, #ffe400);
	width: 1200px;
	height: 90px;
}

.main_header_div2 {
	float: right;
	margin-top: 20px;
	margin-right: 30px;
}

.main_header_div3 {
	float: right;
	margin-right: 10px;
	margin-top: 20px;
}

.main_header_div3_1 {
	float: left;
	margin-left: 10px;
}

.header_image_btn {
	height: 50px;
}

.header_member_btn {
	height: 50px;
	width: 50px;
	border-radius: 50px;
}
</style>

<script type="text/javascript"
	src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	var link = document.location.href;
	console.log(link);
	function addSender() {
		sessionStorage.setItem("address", link);
	};
</script>

</head>
<body>
	<div class="main_header_div1">

		<!-- 마이페이지 -->
		<!-- 로그인 필요 시 -->
		<div class="main_header_div2">
			<c:if test="${empty sessionScope.member_id}">
				<a href="/review/mypage/join" onclick="addSender();"><img
					alt="REMON_LOGO"
					src="/review/movie/resources/image/REMON_Join_icon(white).png"
					class="header_image_btn"></a>
				<a href="/review/mypage/login" onclick="addSender();"> <img
					alt="REMON_LOGO"
					src="/review/movie/resources/image/REMON_Login_icon(white).png"
					class="header_image_btn"></a>
			</c:if>
		</div>

		<!-- 로그인 했을 때 -->
		<c:if test="${not empty sessionScope.member_id}">
			<div class="main_header_div3">
				<div class="main_header_div3_1">
					<a href="/review/mypage/logout"><img alt="REMON_LOGO"
						src="/review/movie/resources/image/REMON_Logout_icon(white).png"
						class="header_image_btn"></a>
				</div>
				<div class="main_header_div3_1">
					<a href="/review/mypage/mypageCheck"><img alt="REMON_LOGO"
						src="/review/movie/resources/memberImage/${member_pic}"
						class="header_member_btn"></a>
				</div>
			</div>
		</c:if>
	</div>
</body>
</html>