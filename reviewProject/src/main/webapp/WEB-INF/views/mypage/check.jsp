<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn_st1 {
	background-image: url('resources/image/REMON_smallbar.png');
	color: white;
	width: 300px;
	height: 30px;
	border-radius: 10px;
	border-style: none;
}

.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
</style>

<script type="text/javascript"
	src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function back() {
	window.history.go(-2);
}
</script>

</head>
<jsp:include page="../share/Login_header.jsp" />
<body>
	<div style="height: 200px;"></div>
	<div class="center">
		<table class="center">
			<tr>
				<td><h2>REMON의 회원가입을 축하합니다.</h2>
				<h4>지금 바로 REMON에서 리뷰를 해보세요~!</h4></td>
			</tr>
			<tr>
				<td><hr></td>
			</tr>
			<tr>
				<td><input type="button" value="홈으로 가기"
					onclick="location.href='/review/'" class="btn_st1"></td>
			</tr>
			<tr>
				<td><input type="button" value="로그인하기"
					onclick="location.href='/review/mypage/loginHome'" class="btn_st1"></td>
			</tr>
			<tr>
				<td><input type="button" value="이전페이지"
					onclick="back()" class="btn_st1"></td>
			</tr>
		</table>
	</div>
	<div style="height: 200px;"></div>
</body>
<jsp:include page="../share/footer.jsp" />
</html>