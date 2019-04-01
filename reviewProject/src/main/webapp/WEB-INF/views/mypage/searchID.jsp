<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.find_st {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	width: 400px;
	height: 300px;
	border: 1px solid #F2F2F2;
}

table {
	width: 300px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.btn_st1 {
	background-image: url('../resources/image/REMON_smallbar.png');
	color: white;
	width: 300px;
	height: 30px;
	border-radius: 10px;
	border-style: none;
}
</style>
</head>
<body>
	<div class="find_st">
		<h3>ID찾기</h3>
		<hr>
		<br>
		<form action="/review/mypage/findInfo/searchID" method="POST">
			<table class="center">
				<tr>
					<td>이&nbsp;&nbsp;름 :</td>
					<td><input type="text" name="member_name"
						style="width: 200px;"></td>
				</tr>
				<tr>
					<td>이메일 :</td>
					<td><input type="text" name="member_email"
						style="width: 200px;"></td>
				</tr>
			</table>
			<br>
			<hr>
			<div style="height: 20px;"></div>
			<input type="submit" value="확인" class="btn_st1">
		</form>
	</div>
	<br>
</body>
</html>