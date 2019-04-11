<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.reply_btn {
	width: 700px;
	height: 30px;
	border-radius: 20px;
	border-style: none;
}

.reply_btn_st {
	width: 50px;
	height: 30px;
	border-radius: 20px;
	border-style: none;
}

.updateReplyForm {
	width: 50px;
	height: 30px;
	border-radius: 20px;
	border-style: none;
}

.deleteReply {
	width: 50px;
	height: 30px;
	border-radius: 20px;
	border-style: none;
}

.imgform {
	height: 30px;
	width: auto;
	margin-top: 30px;
}

.reply_td_st1 {
	width: 150px;
	border-right: 1px solid gray;
}

.reply_td_st2 {
	width: 600px;
	border-right: 1px solid gray;
}

.reply_td_st3 {
	width: 200px;
	border-right: 1px solid gray;
}

.reply_td_st4 {
	width: 200px;
}

.reply_td_st5 {
	wwidth: 50px;
}

.reply_content {
	width: 600px;
	height: 30px;
	border-radius: 20px;
	border-style: none;
}

.reply_update_td_st1 {
	width: 150px;
	height: 40px;
	border-right: 1px solid white;
	font-size: small;
}

.reply_update_td_st2 {
	width: 1050px;
	text-align: left;
}

.reply_UpdateContent {
	width: 800px;
	height: 20px;
	border-style: none;
}
</style>
<script type="text/javascript"
	src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

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

//댓글 수정
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
	<div>
		&nbsp;&nbsp;<span style="font-size: large; font-weight: bold;">댓글
			| REPLY</span>&nbsp;<span style="margin-left: 1000px;"> <img
			alt="reply" src="/review/resources/image/REMON_comment_icon.png"
			class="imgform">
		</span> <span>${replyCount}</span>
	</div>
	<br>
	<div class="center">
		<div class="center">
			<hr>
			<c:forEach items="${replyList}" var="reply">

				<table class="center">
					<tr>
						<td class="reply_td_st1">${reply.member_id}</td>
						<td class="reply_td_st2"><div class="reply_content">${reply.reply_content}</div></td>
						<td class="reply_td_st3"><c:if
								test="${empty reply.reply_up_date}">
								<fmt:formatDate value="${reply.reply_date}"
									pattern="yyyy-MM-dd hh:mm" />
							</c:if> <c:if test="${not empty reply.reply_up_date}">
								<fmt:formatDate value="${reply.reply_up_date}"
									pattern="yyyy-MM-dd hh:mm" />
							</c:if></td>
						<td class="reply_td_st4"><c:if
								test="${sessionScope.member_id == reply.member_id}">
								<input type="hidden" class="reply_num"
									value="${reply.reply_num}">
					&nbsp;&nbsp;&nbsp; <input type="button" class="updateReplyForm"
									onclick="updateReplyForm(${reply.reply_num})" value="수정">
					&nbsp;&nbsp;&nbsp; <input type="button" class="deleteReply"
									onclick="deleteReply(${reply.reply_num})" value="삭제">
							</c:if></td>
						<td class="reply_td_st5"></td>
					</tr>
					<c:if test="${reply.reply_num == rnum}">
						<tr style="background-color: #F2F2F2;">
							<td class="reply_update_td_st1">댓글 수정</td>
							<td colspan="4" class="reply_update_td_st2">&nbsp;&nbsp; <input
								type="text" class="reply_UpdateContent"
								value="${reply.reply_content}"> &nbsp;&nbsp;<input
								type="button" id="btUpdateReply" class="reply_btn_st"
								onclick="updateReply(${reply.reply_num})" value="수정">
							</td>
						</tr>
					</c:if>
				</table>
			</c:forEach>
		</div>
		<div style="height: 20px;"></div>
		<div style="background-color: #F2F2F2;">
			<br>&nbsp;&nbsp;댓글 작성 &nbsp;
			<c:choose>
				<c:when test="${sessionScope.member_id != null}">
					<input type="text" class="reply_content btn" placeholder="댓글 입력"> &nbsp;&nbsp;&nbsp; 
				<input type="button" id="btReply" class="reply_btn_st"
						onclick="insertReply()" value="확인">
				</c:when>
				<c:otherwise>
					<input type="text" class="reply_btn"
						placeholder="댓글을 작성하시려면 로그인이 필요합니다." readonly>
				</c:otherwise>
			</c:choose>
			<br> <br>
		</div>
	</div>
</body>
</html>



