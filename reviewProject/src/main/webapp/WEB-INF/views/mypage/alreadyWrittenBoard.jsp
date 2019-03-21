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
		<td>조회수</td>
	</tr>
	<c:forEach items="${myBoard}" var="myBoard">
		<tr>
			<td>${myBoard.board_num}</td>
			<td><a href="/review/movie/detail_view/${myBoard.board_num}">${myBoard.board_title}</a></td>
			<td>
				<c:if test="${empty myBoard.board_up_date}">
					<fmt:formatDate value="${myBoard.board_date}" pattern="yyyy-MM-dd hh:mm" />
				</c:if>
				<c:if test="${not empty myBoard.board_up_date}">
					<fmt:formatDate value="${myBoard.board_up_date}" pattern="yyyy-MM-dd hh:mm" />
				</c:if>
			</td>
			<td>${myBoard.board_readcount}</td>
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
			<td>
				글제목 : ${myReply.boardVO.board_title} / 작성자 : ${myReply.boardVO.member_id} / 
				작성일 : <c:if test="${empty myReply.boardVO.board_up_date}">${myReply.boardVO.board_date}</c:if>
				<c:if test="${not empty myReply.boardVO.board_up_date}">${myReply.boardVO.board_up_date}</c:if>
				<br>
				<a href="/review/movie/detail_view/${myReply.board_num}">${myReply.reply_content}</a>
			</td>
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
		<td>제목</td>
		<td>글쓴이</td>
		<td>작성일자</td>
	</tr>
	<c:forEach items="${myLike}" var="myLike">
		<tr>
			<td>${myLike.board_num}</td>
			<td>
				<a href="/review/movie/detail_view/${myLike.board_num}">${myLike.boardVO.board_title}</a>
			</td>
			<td>${myLike.boardVO.member_id}</td>
			<td>
				<c:if test="${empty myLike.boardVO.board_up_date}">${myLike.boardVO.board_date}</c:if>
				<c:if test="${not empty myLike.boardVO.board_up_date}">${myLike.boardVO.board_up_date}</c:if>			
			</td>
		</tr>
	</c:forEach>
</table>


<br><br>

</body>
</html>