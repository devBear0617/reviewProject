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

alreadyWrittenBoard

<br>

현재 로그인 ID : ${user.member_id}

<br><br>

내가 쓴 게시글
<table border='1'>
	<tr>
		<td>board_NUM</td>
		<td>제목</td>
		<td>날짜</td>
	</tr>
	<c:forEach items="${myBoard}" var="myBoard">
		<tr>
			<td>${myBoard.board_num}</td>
			<td>${myBoard.board_title}</td>
			<td>
				<c:if test="${empty myBoard.board_up_date}">
					<fmt:formatDate value="${myBoard.board_date}" pattern="yyyy-MM-dd hh:mm" />
				</c:if>
				<c:if test="${not empty myBoard.board_up_date}">
					<fmt:formatDate value="${myBoard.board_up_date}" pattern="yyyy-MM-dd hh:mm" />
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>

<br>

내가 쓴 댓글
<table border='1'>
	<tr>
		<td>reply_num</td>
		<td>댓글 내용</td>
		<td>댓글 날짜</td>
	</tr>
	<c:forEach items="${myReply}" var="myReply">
		<tr>
			<td>${myReply.reply_num}</td>
			<td>${myReply.reply_content}</td>
			<td>
				<c:if test="${empty myReply.reply_up_date}">
					<fmt:formatDate value="${myReply.reply_date}" pattern="yyyy-MM-dd hh:mm" />
				</c:if>
				<c:if test="${not empty myReply.reply_up_date}">
					<fmt:formatDate value="${myReply.reply_up_date}" pattern="yyyy-MM-dd hh:mm" />
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>

<br>

내가 좋아요 한 게시글
<table border='1'>
	<tr>
		<td>board_num</td>
		<!-- <td>제목</td>
		<td>글쓴이</td> -->
	</tr>
	<c:forEach items="${myLike}" var="myLike">
		<tr>
			<td>${myLike.board_num}</td>
		</tr>
	</c:forEach>
</table>


<br><br>

</body>
</html>