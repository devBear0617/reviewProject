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

<script type="text/javascript"
	src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function wClose() {
	window.open('','_self').close();
}

</script>

</head>
<body>
	<div class="find_st">
		<h3>생성 되지 않았거나 잘못된 정보입니다.</h3>
		<hr>
		<br>
		<table class="center">
			<tr>
				<td><input type="button" value="이전"
					onclick="location.href='/review/mypage/findInfo'" class="btn_st1"></td>
			</tr>
			<tr>
				<td><input type="button" value="닫기"
					onclick="wClose()" class="btn_st1"></td>
			</tr>
		</table>
		<br>
		<hr>
		<div style="height: 20px;"></div>
	</div>
</body>
</html>