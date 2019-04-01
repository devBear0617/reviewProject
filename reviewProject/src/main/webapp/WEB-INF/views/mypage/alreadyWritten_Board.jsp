<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<tr height="40px;">
					<td hidden="true">board_NUM</td>
					<td class="myboard1">&nbsp;&nbsp;제목</td>
					<td class="myboard2">날짜</td>
					<td class="myboard3">조회수</td>
				</tr>
				<c:forEach items="${myBoard}" var="myBoard">
					<tr>
						<td hidden="true">${myBoard.board_num}</td>
						<td class="myboard1">&nbsp;&nbsp;<a
							href="/review/movie/detail_view/${myBoard.board_num}"
							class="a_tag">${myBoard.board_title}</a></td>
						<td class="myboard2"><c:if
								test="${empty myBoard.board_up_date}">
								<fmt:formatDate value="${myBoard.board_date}"
									pattern="yyyy-MM-dd hh:mm" />
							</c:if> <c:if test="${not empty myBoard.board_up_date}">
								<fmt:formatDate value="${myBoard.board_up_date}"
									pattern="yyyy-MM-dd hh:mm" />
							</c:if></td>
						<td class="myboard3">${myBoard.board_readcount}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

</body>
</html>