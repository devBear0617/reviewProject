<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tv_content</title>
</head>
<body>

<table border="1">
	<tr>
		<td>제목</td>
		<td>${board.board_title}</td>
	</tr>
	
	<tr>
		<td>내용</td>
		<td>${board.board_content}</td>
	</tr>

</table>

<input type="button" value="main" onclick="location.href='/review/tv/main'">

</body>
</html>