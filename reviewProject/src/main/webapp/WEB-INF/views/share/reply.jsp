<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type = "text/javascript" src = "/review/resources/script/jquery-2.1.1.js"></script>
<script type = "text/javascript">

console.log("reply script");

// 댓글 작성
$('.btReply').click(function () {
	console.log("insert bt");
	$.ajax({
		url: '/review/movie/detail_view/${board.board_num}/reply',
		type: 'POST',
		dataType: 'text',
		data: {
			reply_content: $('.reply_content').val()
		},
		success: function (html) {
			console.log('success');
			$(".reply").empty();
			$(".reply").append(html);
		}
	});
});

// 댓글 수정


// 댓글 삭제
$('.deleteReply').click(function (e) {
	console.log("delete bt");
	$.ajax({
		url: '/review/movie/detail_view/${board.board_num}/deleteReply',
		type: 'POST',
		dataType: 'text',
		data: {
			reply_num: $('.reply_num').val()
		},
		success: function (html) {
			console.log('success');
			$(".reply").empty();
			$(".reply").append(html); 
		}
	});
});

</script>
</head>
<body>
<img alt="reply" src="/review/resources/image/REMON_comment_icon.png" class="imgform">
<span>${replyCount}</span> 
<br>
<div class="center">
	<div class="center">
		<c:forEach items="${replyList}" var="reply">
			<span>작성자 : ${reply.member_id} &nbsp;&nbsp;&nbsp;&nbsp; |</span> &nbsp;&nbsp;&nbsp;&nbsp;
			<span>${reply.reply_content}&nbsp;&nbsp; |</span>
			<span> <fmt:formatDate value="${reply.reply_date}" pattern="yyyy-MM-dd hh:mm" /></span>
			<span>
				<c:if test="${sessionScope.member_id == reply.member_id}">
				&nbsp;&nbsp; <input type="hidden" class="reply_num" value="${reply.reply_num}">${reply.reply_num}
				&nbsp;&nbsp; <input type="button" class="updateReply" value="수정">
				&nbsp;&nbsp; <input type="button" class="deleteReply" value="삭제">
				</c:if>
			</span>
			<br>
		</c:forEach>
	</div>
	<div style="background-color: #F2F2F2;">
		<br>&nbsp;&nbsp;댓글 작성 &nbsp;
		<c:choose>
			<c:when test="${sessionScope.member_id != null}">
				<input type="text" class="reply_content" placeholder="댓글 입력" 
						style="width: 700px; height: 30px; border-radius: 20px; border-style: none;"> &nbsp; &nbsp;
				<input type="button" class="btReply" value="확인">
			</c:when>
			<c:otherwise>
				<input type="text" placeholder="댓글을 작성하시려면 로그인이 필요합니다." 
					style="width: 700px; height: 30px; border-radius: 20px; border-style: none;" readonly >
			</c:otherwise>		
		</c:choose>
		<br>
		<br>
	</div>
</div>
</body>
</html>



