<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type = "text/javascript" src = "/review/resources/script/jquery-2.1.1.js"></script>
<script type = "text/javascript">
// 뎃글 작성
console.log("exe js");

$('#btReply').click(function () {
	console.log("bt clicked!");
	$.ajax({
		url: '/review/movie/detail_view/${board.board_num}/reply',
		type: 'POST',
		dataType: 'text',
		data: {
			reply_content: $('#reply_content').val()
		},
		success: function (html) {
			console.log('on cb');
			/* 
			$.ajax({
			type : "GET",
			url : "/review/movie/detail_view/${board.board_num}/reply",
			cache : false,
			dataType : 'html',
			success : function(html) {
				$(".reply").empty();
				$(".reply").append(html);
				}
			}) */
			$(".reply").empty();
			$(".reply").append(html);
			
		}
	});
});

// 댓글 수정


// 댓글 삭제
$('#deleteReply').click(function () {
	console.log("bt clicked!");
	$.ajax({
		url: '/review/movie/detail_view/${board.board_num}/deleteReply',
		type: 'POST',
		dataType: 'text',
		data: {
			reply_num: $('#reply_num').val()
		},
		success: function (html) {
			console.log('on cb');
			$.ajax({
				type : "GET",
				url : "/review/movie/detail_view/${board.board_num}/reply",
				cache : false,
				dataType : 'html',
				success : function(html) {
					$(".reply").empty();
					$(".reply").append(html);
					}
				}) 
			/* $(".reply").empty();
			$(".reply").append(html); */
			
		}
	});
});

</script>

</head>
<body>

<h4>댓글</h4>

댓글count : ${replyCount} 
<br>

<c:forEach items="${board.replyList}" var="reply">
	<span>작성자 : ${reply.member_id} &nbsp;&nbsp;&nbsp;&nbsp; |</span>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<span>${reply.reply_content}&nbsp;&nbsp; |</span>
	<span><fmt:formatDate value="${reply.reply_date}" pattern="yyyy-MM-dd hh:mm"/>&nbsp;&nbsp; |</span>
	<span>
		<c:if test="${sessionScope.member_id == reply.member_id}">
			&nbsp;&nbsp; <input type="hidden" id="reply_num" name="reply_num" value="${reply.reply_num}">${reply.reply_num}
			&nbsp;&nbsp; <input type="button" id="updateReply" value="수정">
			&nbsp;&nbsp; <input type="button" id="deleteReply" name="deleteReply" value="삭제">
		</c:if>
	</span>
	<br>
</c:forEach>

<c:if test="${sessionScope.member_id != null}">
	<%-- <form action="/review/movie/insert_Reply/${board.board_num}" method="post" id="insert_Reply"> --%>
		Reply 작성 <textarea id="reply_content" name="reply_content" placeholder="댓글 입력"></textarea>
		<br>
		<input type="button" id="btReply" name="btReply" value="확인">
	<!-- </form>  -->
</c:if>



</body>
</html>


	
