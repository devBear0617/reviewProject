<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login_page</title>
<style type="text/css">
.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
</style>
</head>
<jsp:include page="../share/Login_header.jsp" />
<body>
	<div class="center">
		<!-- 테스트 로그인 기능 -->
		<form action="/review/mypage/login" method="POST" id="loginMember">
			<br> <br> <br> <br> <br>
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
					<td style="width: 200px; height: 30px;">
						<input type="text" name="member_id" placeholder="이메일 또는 아이디"
						style="width: 200px; height: 20px;"></td>
				</tr>

				<tr style="text-align: center;">
					<td style="width: 90px; height: 30px;">비밀번호</td>
					<td style="width: 200px; height: 30px;"><input type="password"
						name="member_pw" style="width: 200px; height: 20px;"></td>
				</tr>
				<tr></tr>
				<tr>
					<td colspan="2"><input type="submit" value="로그인"
						style="background-image: url('resources/image/REMON_smallbar.png'); color: white; width: 300px; height: 30px; border-radius: 10px; border-style: none;"></td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				<tr></tr>
				<tr>
					<td colspan="2"><input type="button" value="회원 가입"
						onclick="location.href='/review/mypage/join'"
						style="background-image: url('resources/image/REMON_smallbar.png'); color: white; width: 300px; height: 30px; border-radius: 10px; border-style: none;"></td>
				</tr>

			</table>
			<br> <br> <br> <br> <br> <br> <br>
			<br>
		</form>
	</div>
</body>
<jsp:include page="../share/footer.jsp" />
</html>