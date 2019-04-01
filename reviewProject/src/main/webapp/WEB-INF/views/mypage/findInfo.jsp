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
	background-image: url('resources/image/REMON_smallbar.png');
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
		<h3>ID/PW 찾기</h3>
		<hr>
		<table class="center">
			<tr>
				<td>ID를 찾으시겠습니까?</td>
			</tr>
			<tr>
				<td><input type="button" value="ID 찾기"
					onclick="location.href='/review/mypage/findInfo/searchID'"
					class="btn_st1"></td>
			</tr>
			<tr>
				<td>비밀번호를 찾으시겠습니까?</td>
			</tr>
			<tr>
				<td><input type="button" value="PW 찾기"
					onclick="location.href='/review/mypage/findInfo/searchPW'"
					class="btn_st1"></td>
			</tr>
		</table>
	</div>
	<br>
</body>
</html>