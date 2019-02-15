<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>새글 작성</h1>

	<form action="/review/movie/board_write" method="POST" id="board_write">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="board_title"></td>
			</tr>

			<tr>
				<td>
					<textarea name="board_content" rows="17" cols="4"></textarea>
				</td>
			</tr>
			
			<tr>
				<td><input type="submit" value="작성"></td>
				<!-- <td><input type="" value="취소"></td> 취소시 이전 페이지로  -->
			</tr>

		</table>
	</form>

	<br>

	<input type="button" value="홈" onclick="location.href='/review/movie/main'">

</body>
</html>