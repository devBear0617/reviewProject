<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
			<table class="mytable">
				<tr>
					<td colspan="4" class="mytitle">내가 쓴 게시글</td>
				</tr>
				
				<c:forEach items="${myBoard}" var="myBoard">
					<tr onclick="location.href='/review/movie/detail_view/${myBoard.board_num}'">
						<td>
							<img src="${myBoard.thumbnail}" height="70px" width="70px">
						</td>
						<td>
							${myBoard.board_title} <br>
							
						</td>
						<td>score: ${myBoard.lemon_grade}</td>
						<td>${myBoard.member_id}</td>
						<td><c:if test="${empty myBoard.board_up_date}">${myBoard.board_date}</c:if>
							<c:if test="${not empty myBoard.board_up_date}">${myBoard.board_up_date}</c:if></td>
					</tr>
				</c:forEach>
				
			</table>
		</div>
		
		<br><br>

</body>
</html>