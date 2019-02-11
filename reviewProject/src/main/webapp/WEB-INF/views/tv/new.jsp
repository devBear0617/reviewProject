<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/review/tv/new" method="POST" id="new">
<table>
	<tr>
		<td>제목</td>
		<td><input type="text" name="b_title"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><input type="text" name="b_content"></td>
	</tr>
</table>
<input type="submit" value="check"> ///
<input type="reset" value="reset">
</form>

</body>
</html>