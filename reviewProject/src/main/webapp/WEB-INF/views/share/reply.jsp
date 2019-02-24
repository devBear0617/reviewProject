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

<c:forEach items="${board.replyList}" var="reply">
	<span>작성자 : ${reply.member_id} &nbsp;&nbsp;&nbsp;&nbsp; |</span>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<span>${reply.reply_content}&nbsp;&nbsp; |</span>
	<span>${reply.reply_date}</span>
	<br>
</c:forEach>
<form action="/review/movie/insert_Reply/${board.board_num}" method="post" id="insert_Reply">
Reply 작성 <input type="text" name="reply_content" value="리플 수정하기 기능 추가 필요!">
<br><input type="submit" value="확인"><input type="reset" value="취소">
</form> 

</body>
</html>


	
