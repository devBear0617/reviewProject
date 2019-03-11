<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>가입.</h1>
	
<form action="/review/mypage/join" method="POST" id="joinMember" enctype="multipart/form-data">
<table border="1">
	<tr>
		<td>ID</td>
		<td><input type="text" name="member_id"></td>
	</tr>
	
	<tr>
		<td>PW</td>
		<td><input type="password" name="member_pw"></td>
	</tr>
	
	<tr>
		<td>NAME</td>
		<td><input type="text" name="member_name"></td>
	</tr>
	
	<tr>
		<td>EMAIL</td>
		<td><input type="text" name="member_email"></td>
	</tr>
	
	<tr>
		<td>Picture</td>
		<td><input type="file" name="member_pic"></td>
	</tr>
	
	<tr>
		<td><input type="submit" value="가입"></td>
		<td><input type="reset" value="취소"></td>
	</tr>

</table>
</form>

<br>

<input type="button" value="홈"
				onclick="location.href='/review/'">
	
</body>
</html>