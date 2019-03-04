<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type = "text/javascript" src = "../resources/script/jquery-2.1.1.js"></script>
<script type = "text/javascript">

$(function(){
	
	$("#btReply").click(function(){
		reply();
	});
	
});

function reply() {
	data = $("#reply_content").val(); // 댓글 내용
	/* var board_num ="${board.board_num}"; // 게시물 번호
	var param = {"reply_content" : reply_content, "board_num":board_num}; //json형태 */
	$ajax({
		type : "POST",
		url : "/review/movie/detail_view/${board.board_num}/reply",
		dataType : 'html',
		data : data,
		success : function(html){ // 콜백함수
			$(".reply").append(html);
			/* alert("등록 완료"); */
		}
	
	});
}

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
	<span><c:if test="${sessionScope.member_id == board.member_id}">&nbsp;&nbsp; '수정'</c:if></span>
	<br>
</c:forEach>

<c:if test="${sessionScope.member_id != null}">
	<%-- <form action="/review/movie/insert_Reply/${board.board_num}" method="post" id="insert_Reply"> --%>
		Reply 작성 <textarea name="reply_content" placeholder="댓글 입력"></textarea>
		<br>
		<input type="button" id="btReply" name="btReply" value="확인">
	<!-- </form>  -->
</c:if>



</body>
</html>


	
