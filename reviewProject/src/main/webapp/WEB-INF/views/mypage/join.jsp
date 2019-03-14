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
		<td>Picture</td>
		<td><input type="file" name="file"></td>
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