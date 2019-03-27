<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border='1'>
	<tr>
		<td>글넘</td>
		<!-- <td>글제 / <br> 내용</td>
		<td>글쓴</td>
		<td>날짜</td> -->
	</tr>
	<c:forEach items="${search_Result}" var="result">
		<tr>
			<td><a href="/review/movie/detail_view/${result}">${result}</a></td>
			<%-- <td>
				<img src="${board.thumbnail}" height="70px" width="70px">
				${board.board_title} / <br>
				<c:choose>
					<c:when test="${fn:length(board.board_content) > 50}">
						<c:out value="${fn:substring(board.board_content, 0, 49)}" />...
					</c:when>
					<c:otherwise>
            			<c:out value="${board.board_content}"/>
           			</c:otherwise> 
				</c:choose>
				</td>
			<td>${board.member_id}</td>
			<td><c:if test="${empty board.board_up_date}">${board.board_date}</c:if>
				<c:if test="${not empty board.board_up_date}">${board.board_up_date}</c:if></td>
		</tr> --%>
	</c:forEach>
</table>

</body>
</html>