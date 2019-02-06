<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

	<c:forEach items="${board.replyList}" var="reply">
		<span>${reply.reply_num}</span>
		<span>${reply.member_id}</span>
		<span>${reply.reply_content}</span>
		<br>
	</c:forEach>
