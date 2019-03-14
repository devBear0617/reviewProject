<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.td_st1 {
	width: 90px;
	height: 30px;
	text-align: center;
}

.td_st2 {
	width: 200px;
	height: 30px;
	text-align: center;
}

.text_st1 {
	width: 200px;
	height: 20px;
}

.btn_st1 {
	background-image: url('resources/image/REMON_smallbar.png');
	color: white;
	width: 300px;
	height: 30px;
	border-radius: 10px;
	border-style: none;
}

.btn_st2 {
	background-image: url('resources/image/REMON_smallbar.png');
	color: white;
	width: 300px;
	height: 30px;
	border-radius: 10px;
	border-style: none;
	width: 90px;
	height: 30px;
	text-align: center;
}
</style>
</head>
<jsp:include page="../share/Login_header.jsp" />
<body>

	<div class="center">
		<form action="/review/mypage/join" method="POST" id="joinMember"
			enctype="multipart/form-data">
			<div style="height: 100px;"></div>
			<table class="center">
				<tr
					style="text-align: center; background: linear-gradient(to right, #ffe400, #abf200);">
					<td colspan="2"><h1>회원가입 PAGE</h1></td>
				</tr>
				<tr>
					<td colspan="2"><br></td>
				<tr>
				<tr>
					<td class="td_st1">ID</td>
					<td class="td_st2"><input type="text" name="member_id"
						class="text_st1"></td>
				</tr>

				<tr>
					<td class="td_st1">PW</td>
					<td class="td_st2"><input type="password" name="member_pw"
						class="text_st1"></td>
				</tr>

				<tr>
					<td class="td_st1">NAME</td>
					<td class="td_st2"><input type="text" name="member_name"
						class="text_st1"></td>
				</tr>

				<tr>
					<td class="td_st1">EMAIL</td>
					<td class="td_st2"><input type="text" name="member_email"
						class="text_st1"></td>
				</tr>

				<tr>
					<td class="td_st1">Picture</td>
					<td class="td_st2"><input type="file" name="member_pic" ></td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="가입"
						class="btn_st1"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="reset" value="취소" class="btn_st1"></td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>

			</table>
		</form>
	</div>
	<div class="center">
		<input type="button" value="홈" onclick="location.href='/review/'"
			class="btn_st2">
	</div>
	<div style="height: 100px;"></div>

</body>
<jsp:include page="../share/footer.jsp" />
</html>