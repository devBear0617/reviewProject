<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>PW찾기</h2>
<br>
<form action="/review/mypage/findInfo/searchPW" method="POST" >
	아이디를 입력하시오 : 
	<input type="text" name="member_id">
	<br>
	이름을 입력하시오 : 
	<input type="text" name="member_name">
	<br>
	이메일을 입력하시오 : 
	<input type="text" name="member_email">
	<input type="submit" value="확인">
</form>

</body>
</html>