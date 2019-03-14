<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>정보 변경.</h1>

<form action="/review/mypage/updateMember" method="post" id="updateMember">
ID : ${user.member_id}<input type="hidden" name="member_id" value="${user.member_id}"><br>
PW : <input type="password" name="member_pw"><br>
NAME : ${user.member_name}<input type="hidden" name="member_name" value="${user.member_name}"><br>
EMAIL : ${user.member_email}

<br>

<input type="submit" value="확인">
<input type="reset" value="리셋">
</form>



</body>
</html>