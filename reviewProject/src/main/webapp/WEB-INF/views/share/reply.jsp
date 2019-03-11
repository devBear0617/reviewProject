<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 .btn{
 	width: 700px; 
 	height: 30px; 
 	border-radius: 20px; 
 	border-style: none;
 }
</style>
<script type = "text/javascript" src = "/review/resources/script/jquery-2.1.1.js"></script>
<script type = "text/javascript">

/*수정 내용
1. btReply : class -> id (이유 : class로 해도 상관없지만 댓글 등록버튼은 유일하여 id 사용하는 것이 더 좋음) 
2. 수정/삭제 : 선택자.click -> 함수  
(이유 : id로 할 경우 이전 선택자.click이 제대로 작동하지만 class로 할 경우 $(e).선택자().val() 식으로 접근 해야하므로 가독성 떨어짐
	  함수로 사용할 경우 확장성에 좋음 & reply_num 전달에 용이함)
	  
-추가
3. 작성 : 선택자.click -> 함수  (이유 : 위와 동일)
4. board_num, url : 변수로 설정 (이유 : 코드 간소화)
5. reply_content(확인버튼), 댓글을 작성하시려면 로그인이 필요합니다(로그인 요청 text)) : class - btn 추가 후 css로 분리 
(이유 : 코드 가독성 높이기 위함 & 코드 간소화)
*/
// 댓글 작성
var board_num = ${board_num};
var url = '/review/movie/detail_view/'+board_num;

function insertReply () {
	$.ajax({
		url: url +'/reply',
		type: 'POST',
		dataType: 'text',
		data: {
			reply_content: $('.reply_content').val()
		},
		success: function (html) {
			$(".reply").empty();
			$(".reply").append(html);
		}
	});
};

// 댓글 수정
function updateReplyForm (reply_num) {
	$.ajax({
		url: url +'/updateReplyForm',
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
function updateReply (reply_num) {
	$.ajax({
		url: url +'/updateReply',
		type: 'POST',
		dataType: 'text',
		data: {
			reply_num: reply_num,
			reply_UpdateContent: $('.reply_UpdateContent').val()
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
		url: url +'/deleteReply',
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
			<span> 
				<c:if test="${empty reply.reply_up_date}">
					<fmt:formatDate value="${reply.reply_date}" pattern="yyyy-MM-dd hh:mm" />
				</c:if>
				<c:if test="${not empty reply.reply_up_date}">
					<fmt:formatDate value="${reply.reply_up_date}" pattern="yyyy-MM-dd hh:mm" />
				</c:if>
			</span>
			<span>
				<c:if test="${sessionScope.member_id == reply.member_id}">
					&nbsp;&nbsp; <input type="hidden" class="reply_num" value="${reply.reply_num}">${reply.reply_num}
					&nbsp;&nbsp; <input type="button" class="updateReplyForm" onclick="updateReplyForm(${reply.reply_num})" value="수정">
					&nbsp;&nbsp; <input type="button" class="deleteReply" onclick="deleteReply(${reply.reply_num})" value="삭제">
					<br>
				
				</c:if>
			</span>
			<br>
			<c:if test="${reply.reply_num == rnum}">
				<input type="hidden" class="reply_num" value="${reply.reply_num}">${reply.reply_num}
				수정! : <input type="text" class="reply_UpdateContent" value="${reply.reply_content}">
				 &nbsp; &nbsp;<input type="button" id="btUpdateReply" onclick="updateReply()" value="수정!">
				<br><br>
			</c:if>
		</c:forEach>
	</div>
	<div style="background-color: #F2F2F2;">
		<br>&nbsp;&nbsp;댓글 작성 &nbsp;
		<c:choose>
			<c:when test="${sessionScope.member_id != null}">
				<input type="text" class="reply_content" placeholder="댓글 입력" > &nbsp; &nbsp;
				<input type="button" id="btReply" onclick="insertReply()" value="확인">
			</c:when>
			<c:otherwise>
				<input type="text" class="btn" placeholder="댓글을 작성하시려면 로그인이 필요합니다." readonly>
			</c:otherwise>		
		</c:choose>
		<br>
		<br>
	</div>
</div>
</body>
</html>



