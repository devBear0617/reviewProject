<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function wClose() {
		window.open('', '_self').close();
	};
</script>
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
		<h3>
			해당 정보를 이메일로 전송하였습니다! <br>확인해주세요.
		</h3>
		<hr>
		<table class="center">
			<tr>
				<td><input type="button" value="ID 찾기" class="btn_st1"
					onclick="location.href='/review/mypage/findInfo/searchID'"></td>
			</tr>
			<tr>
				<td><input type="button" value="PW 찾기" class="btn_st1"
					onclick="location.href='/review/mypage/findInfo/searchPW'"></td>
			</tr>
			<tr>
				<td><input type="button" value="닫기" class="btn_st1"
					onclick="wClose()"></td>
			</tr>
		</table>
	</div>
	<br>
</body>
</html>