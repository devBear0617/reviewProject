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
					<td colspan="3" class="mytitle">내가 쓴 댓글</td>
				</tr>
				
				<c:forEach items="${myReply}" var="myReply">
					<tr onclick="location.href='/review/movie/detail_view/${myReply.board_num}'">
						<td>
							<img src="${myReply.boardVO.thumbnail}" height="70px" width="70px">
						</td>
						<td>
							${myReply.boardVO.board_title} <br>
							&nbsp;&nbsp;┗${myReply.reply_content}
						</td>
						<td>score: ${myReply.boardVO.lemon_grade}</td>
						<td>${myReply.boardVO.member_id}</td>
						<td><c:if test="${empty myReply.boardVO.board_up_date}">${myReply.boardVO.board_date}</c:if>
							<c:if test="${not empty myReply.boardVO.board_up_date}">${myReply.boardVO.board_up_date}</c:if></td>
					</tr>
				</c:forEach>
				
			</table>
		</div>
		
		<br><br>

</body>
</html>