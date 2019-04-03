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
	window.open('','_self').close();
};

</script>

</head>
<body>

해당  정보를 이메일로 전송하였습니다. 확인해주세요.
<br>
<input type="button" value="ID 찾기"
	onclick="location.href='/review/mypage/findInfo/searchID'">
					
<input type="button" value="PW 찾기"
	onclick="location.href='/review/mypage/findInfo/searchPW'">
	
<input type="button" value="닫기"
						onclick="wClose()">

</body>
</html>