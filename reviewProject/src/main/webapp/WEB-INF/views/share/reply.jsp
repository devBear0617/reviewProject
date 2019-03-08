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

/*수정 내용
1. btReply : class -> id (이유 : class로 해도 상관없지만 댓글 등록버튼은 유일하여 id 사용하는 것이 더 좋음) 
2. 수정/삭제 : 선택자.click -> 함수  
(이유 : id로 할 경우 이전 선택자.click이 제대로 작동하지만 class로 할 경우 $(e).선택자().val() 식으로 접근 해야하므로 가독성 떨어짐
	  함수로 사용할 경우 확장성에 좋음 & reply_num 전달에 용이함)
*/
// 댓글 작성
$('#btReply').click(function () {
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
function updateReply (reply_num) {
	$.ajax({
		url: '/review/movie/detail_view/${board.board_num}/deleteReply',
		type: 'POST',
		dataType: 'text',
		data: {
			reply_num: reply_num
		},
		success: function (html) {
			$(".reply").empty();
			$(".reply").append(html); 
		}
	});
};


// 댓글 삭제
function deleteReply (reply_num) {
	$.ajax({
		url: '/review/movie/detail_view/${board.board_num}/deleteReply',
		type: 'POST',
		dataType: 'text',
		data: {
			reply_num: reply_num
		},
		success: function (html) {
			$(".reply").empty();
			$(".reply").append(html); 
		}
	});
};

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
				&nbsp;&nbsp; <input type="button" class="updateReply" onclick="updateReply(${reply.reply_num})" value="수정">
				&nbsp;&nbsp; <input type="button" class="deleteReply" onclick="deleteReply(${reply.reply_num})" value="삭제">
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
				<input type="button" id="btReply" value="확인">
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



