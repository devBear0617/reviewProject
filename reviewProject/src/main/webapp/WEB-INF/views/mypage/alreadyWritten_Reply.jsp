<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.AW_st1 {
	width: 10px;
}

.AW_st2 {
	width: 70px;
}

.AW_st3 {
	width: 500px;
	text-align: left;
}

.AW_st4 {
	width: 120px;
}

.AW_st5 {
	width: 100px;
	text-align: right;
}

.AW_st6 {
	width: 100px;
}

.AW_st {
	width: 900px;
}
</style>
</head>

<script type="text/javascript">
	function written_paging(pnum) {
		$.ajax({
			type : "GET",
			url : "/review/mypage/alreadyWritten/alreadyWritten_Reply",
			data : {
				"pnum" : pnum
			},
			dataType : 'html',
			success : function(html) {
				$(".alreadyWritten_Reply").empty();
				$(".alreadyWritten_Reply").append(html);
			}
		})
	}
</script>

<body>
	<div>
		<table class="AW_st">
			<tr>
				<td colspan="6" class="mytitle">내가 쓴 댓글</td>
			</tr>
			<tr>
				<td class="AW_st" colspan="6"><br></td>
			</tr>
			<c:forEach items="${myReply}" var="myReply">
				<tr
					onclick="location.href='/review/movie/detail_view/${myReply.board_num}'">
					<td class="AW_st1"></td>
					<td class="AW_st2"><img src="${myReply.boardVO.thumbnail}"
						style="height: 70px; width: 70px; border-radius: 20px;"></td>
					<td class="AW_st3" style="">&nbsp;<span
						style="font-size: large;">${myReply.boardVO.board_title}</span> <br>&nbsp;&nbsp;┗<span
						style="color: green;">${myReply.reply_content}</span></td>
					<td class="AW_st4">score: ${myReply.boardVO.lemon_grade}</td>
					<td class="AW_st5" style="">&nbsp;&nbsp;<img
						src="/review/movie/resources/memberImage/${myReply.memberVO.member_pic}"
						style="width: 30px; height: 30px; border-radius: 30px;">
						${myReply.boardVO.member_id}
					</td>
					<td class="AW_st6">&nbsp;<c:if
							test="${empty myReply.boardVO.board_up_date}">${myReply.boardVO.board_date}</c:if>
						<c:if test="${not empty myReply.boardVO.board_up_date}">${myReply.boardVO.board_up_date}</c:if></td>
				</tr>
				<tr>
					<td class="AW_st" colspan="6"><hr></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="paging">
		<c:if test="${pagination.startPage ne 0}">
			<c:if test="${pagination.prevPage ne 0}">
				<a href="#" onClick="written_paging('${pagination.prevPage}')">[이전]</a>
			</c:if>
			<c:forEach var="pnum" begin="${pagination.startPage}"
				end="${pagination.endPage}">
				<c:choose>
					<c:when test="${pnum eq  pagination.curPage}">
						<span style="font-weight: bold;"><a href="#"
							onClick="written_paging('${pnum}')">${pnum}</a></span>
					</c:when>
					<c:otherwise>
						<a href="#" onClick="written_paging('${pnum}')">${pnum}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if
				test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
				<a href="#" onClick="written_paging('${pagination.nextPage}')">[다음]</a>
			</c:if>
		</c:if>
	</div>
	<br>
	<br>
</body>
</html>