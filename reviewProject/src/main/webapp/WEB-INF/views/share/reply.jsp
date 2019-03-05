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
	<div class="center">
		<div class="center">
			<c:forEach items="${board.replyList}" var="reply">
				<span>작성자 : ${reply.member_id} &nbsp;&nbsp;&nbsp;&nbsp; |</span>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<span>${reply.reply_content}&nbsp;&nbsp; |</span>
				<span> <fmt:formatDate value="${reply.reply_date}"
						pattern="yyyy-MM-dd hh:mm" /></span>
				<hr>
				<br>
			</c:forEach>
		</div>
		<div style="background-color: #F2F2F2;">
			<br>
			<form action="/review/movie/insert_Reply/${board.board_num}"
				method="post" id="insert_Reply">
				&nbsp; &nbsp;댓글 작성 &nbsp; <input type="text" name="reply_content"
					value="리플 수정하기 기능 추가 필요!"
					style="width: 700px; height: 30px; border-radius: 20px; border-style: none;">
				&nbsp; &nbsp;<input type="submit" value="확인"> &nbsp;<input
					type="reset" value="취소">
			</form>
			<br>
		</div>
	</div>
</body>
</html>



