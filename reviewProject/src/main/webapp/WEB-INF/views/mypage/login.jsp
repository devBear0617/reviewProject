<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login_page</title>

<script type="text/javascript"
	src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>

<script type="text/javascript">
	console.log(sessionStorage.getItem("address"));
	function searchIDPW() {
		window
				.open("/review/mypage/findInfo", "ID / PW 찾기",
						"width=430, height=340, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	};
</script>

<style type="text/css">
input:focus {
	outline: none;
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
	var msg = '${loginFail}';
	console.log(msg);
	if (msg) {
		alert(msg);
	}
</script>

</head>
<jsp:include page="/WEB-INF/views/share/Login_header.jsp" />
<body>
	<div class="center">
		<div style="height: 100px;"></div>
		<!-- 테스트 로그인 기능 -->
		<form action="/review/mypage/login" method="POST" id="loginMember">
			<table class="center">
				<tr
					style="text-align: center; background: linear-gradient(to right, #ffe400, #abf200);">
					<td colspan="2"><h1>로그인 PAGE</h1></td>
				</tr>
				<tr>
					<td colspan="2"><br></td>
				</tr>
				<tr style="text-align: center;">
					<td style="width: 90px; height: 30px;">아이디</td>
					<td style="width: 200px; height: 30px;"><input type="text"
						name="member_id" placeholder="이메일 또는 아이디"
						style="width: 200px; height: 20px;"></td>
				</tr>

				<tr style="text-align: center;">
					<td style="width: 90px; height: 30px;">비밀번호</td>
					<td style="width: 200px; height: 30px;"><input type="password"
						name="member_pw" style="width: 200px; height: 20px;"></td>
				</tr>
				<tr>
					<td colspan="2"><br></td>
				<tr>
				<tr>
					<td colspan="2"><input type="submit" value="로그인"
						style="background-image: url('/review/mypage/resources/image/REMON_smallbar.png'); color: white; width: 300px; height: 30px; border-radius: 10px; border-style: none;"></td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				<tr>
					<!-- location.href='/review/mypage/findInfo' -->
					<td colspan="2"><input type="button" value="아이디 /비번 찾기"
						onclick="searchIDPW()"
						style="background-image: url('/review/mypage/resources/image/REMON_smallbar.png'); color: white; width: 300px; height: 30px; border-radius: 10px; border-style: none;"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="회원 가입"
						onclick="location.href='/review/mypage/join'"
						style="background-image: url('/review/mypage/resources/image/REMON_smallbar.png'); color: white; width: 300px; height: 30px; border-radius: 10px; border-style: none;"></td>
				</tr>

			</table>
			<!-- 전페이지 저장 -->
			<input type="hidden" name="address" value="${address}">
			<%-- ${address} --%>
		</form>
	</div>
	<div style="height: 10px;"></div>
	<div id="naver_id_login" style="text-align: center">
		<a href="${url}"> <img width="223"
			src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" />
		</a>
	</div>
	<div style="height: 200px;"></div>
</body>
<jsp:include page="/WEB-INF/views/share/footer.jsp" />
</html>