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

<h1>검색결과</h1>
<table border='1'>
	<tr>
		<td>글넘</td>
		<td>글제</td>
		<td>글쓴</td>
	</tr>
		<c:forEach items="${board}" var="board">
			<tr>
				<td>${board.board_num}</td>
				<td>${board.board_title}</td>
				<td>${board.member_id}</td>
			</tr>
		</c:forEach>
</table>

<a href="/review">홈</a>

</body>
</html>