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
					<td colspan="4" class="mytitle">내가 좋아요 한 게시글</td>
				</tr>
				
				
				<c:forEach items="${myLike}" var="myLike">
					<tr onclick="location.href='/review/movie/detail_view/${myLike.board_num}'">
			
						<td>
							<img src="${myLike.boardVO.thumbnail}" height="70px" width="70px">
						</td>
						<td>
							${myLike.boardVO.board_title} <br>
							
						</td>
						<td>score: ${myLike.boardVO.lemon_grade}</td>
						
						<td>${myLike.boardVO.member_id}</td>
						<td><c:if test="${empty myLike.boardVO.board_up_date}">${myLike.boardVO.board_date}</c:if>
							<c:if test="${not empty myLike.boardVO.board_up_date}">${myLike.boardVO.board_up_date}</c:if></td>
					</tr>
				</c:forEach>
				
				
				
			</table>
		</div>
		
		<br><br>

</body>
</html>