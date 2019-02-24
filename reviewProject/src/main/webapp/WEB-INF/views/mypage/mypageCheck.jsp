<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>마이페이지.</h1>
<h4>ID : ${user.member_id}</h4>
<h4>PW : ${user.member_pw}</h4>
<h4>NAME : ${user.member_name}</h4>

<input type="button" value="로그아웃" 
	onclick="location.href='/review/mypage/logout'">
<input type="button" value="정보변경"
	onclick="location.href='/review/mypage/updateMember'">


</body>
</html>