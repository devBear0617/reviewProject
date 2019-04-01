<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	$.ajax({
		type : "GET",
		url : "/review/mypage/alreadyWritten/alreadyWritten_menuBoard",
		dataType : 'html',
		success : function(html) {
			$(".alreadyWritten_menuBoard").append(html);
		}
	})

	$.ajax({
		type : "GET",
		url : "/review/mypage/alreadyWritten/alreadyWritten_Board",
		dataType : 'html',
		success : function(html) {
			$(".alreadyWritten_Board").append(html);
		}
	})
	
});

function already_Board () {
	$.ajax({
		type : "GET",
		url : "/review/mypage/alreadyWritten/alreadyWritten_menuBoard",
		dataType : 'html',
		success : function(html) {
			$(".alreadyWritten_menuReply").empty();
			$(".alreadyWritten_menuLike").empty();
			$(".alreadyWritten_menuBoard").empty();
			
			$(".alreadyWritten_menuBoard").append(html);
		}
	});
	
	$.ajax({
		type : "GET",
		url : "/review/mypage/alreadyWritten/alreadyWritten_Board",
		dataType : 'html',
		success : function(html) {
			$(".alreadyWritten_Reply").empty();
			$(".alreadyWritten_Like").empty();
			$(".alreadyWritten_Board").empty();
			
			$(".alreadyWritten_Board").append(html);
		}
	});
};

function already_Reply () {
	$.ajax({
		type : "GET",
		url : "/review/mypage/alreadyWritten/alreadyWritten_menuReply",
		dataType : 'html',
		success : function(html) {
			$(".alreadyWritten_menuBoard").empty();
			$(".alreadyWritten_menuLike").empty();
			$(".alreadyWritten_menuReply").empty();
			
			$(".alreadyWritten_menuReply").append(html);
		}
	});
	
	$.ajax({
		type : "GET",
		url : "/review/mypage/alreadyWritten/alreadyWritten_Reply",
		dataType : 'html',
		success : function(html) {
			$(".alreadyWritten_Board").empty();
			$(".alreadyWritten_Like").empty();
			$(".alreadyWritten_Reply").empty();
			
			$(".alreadyWritten_Reply").append(html);
		}
	});
};

function already_Like () {
	$.ajax({
		type : "GET",
		url : "/review/mypage/alreadyWritten/alreadyWritten_menuLike",
		dataType : 'html',
		success : function(html) {
			$(".alreadyWritten_menuBoard").empty();
			$(".alreadyWritten_menuReply").empty();
			$(".alreadyWritten_menuLike").empty();
			
			$(".alreadyWritten_menuLike").append(html);
		}
	});
	
	$.ajax({
		type : "GET",
		url : "/review/mypage/alreadyWritten/alreadyWritten_Like",
		dataType : 'html',
		success : function(html) {
			$(".alreadyWritten_Board").empty();
			$(".alreadyWritten_Reply").empty();
			$(".alreadyWritten_Like").empty();
			
			$(".alreadyWritten_Like").append(html);
		}
	});
};

</script>

<style type="text/css">
.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.mytable {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	/* 	border: 1px solid #F2F2F2;
	border-collapse: separate; */
}

.myboard1 {
	width: 400px;
	text-align: left;
}

.myboard2 {
	width: 200px;
}

.myboard3 {
	width: 50px;
}

.myreply1 {
	width: 500px;
	text-align: left;
}

.myreply2 {
	width: 150px;
}

.mylikeit1 {
	width: 350px;
	text-align: left;
}

.mylikeit2 {
	width: 150px;
}

.mylikeit3 {
	width: 150px;
}

.mytitle {
	background: linear-gradient(to left, #ffe400, #abf200);
	height: 50px;
	color: white;
}

td {
	border-bottom: 1px solid #F2F2F2;
}

.a_tag {
	text-decoration: none;
	color: gray;
}
</style>
</head>
<jsp:include page="/WEB-INF/views/share/Login_header.jsp" />
<body>
	<div class="center">
		<div style="height: 50px;"></div>
		<div>
			<h2>${user.member_id}님의기록</h2>
		</div>
		<hr width="1100px;">
		
		<div id="con">
			<div id="menu" style="background-color:yellow; width:200px; float:left">
				<h2>메뉴</h2>
			
				<div class="alreadyWritten_menuBoard"></div>
				<div class="alreadyWritten_menuReply"></div>
				<div class="alreadyWritten_menuLike"></div>
			
			</div>

			<div id="content" style="width:700px; float:left;">
		
				<div class="alreadyWritten_Board"></div>
				<div class="alreadyWritten_Reply"></div>
				<div class="alreadyWritten_Like"></div>
		
			</div>
		
		<%-- <div>
			<table class="mytable">
				<tr>
					<td colspan="4" class="mytitle">내가 쓴 게시글</td>
				</tr>
				<tr height="40px;">
					<td hidden="true">board_NUM</td>
					<td class="myboard1">&nbsp;&nbsp;제목</td>
					<td class="myboard2">날짜</td>
					<td class="myboard3">조회수</td>
				</tr>
				<c:forEach items="${myBoard}" var="myBoard">
					<tr>
						<td hidden="true">${myBoard.board_num}</td>
						<td class="myboard1">&nbsp;&nbsp;<a
							href="/review/movie/detail_view/${myBoard.board_num}"
							class="a_tag">${myBoard.board_title}</a></td>
						<td class="myboard2"><c:if
								test="${empty myBoard.board_up_date}">
								<fmt:formatDate value="${myBoard.board_date}"
									pattern="yyyy-MM-dd hh:mm" />
							</c:if> <c:if test="${not empty myBoard.board_up_date}">
								<fmt:formatDate value="${myBoard.board_up_date}"
									pattern="yyyy-MM-dd hh:mm" />
							</c:if></td>
						<td class="myboard3">${myBoard.board_readcount}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br> --%>
		<%-- <div>
			<table class="mytable">
				<tr>
					<td colspan="3" class="mytitle">내가 쓴 댓글</td>
				</tr>
				<tr height="40px;">
					<td hidden="true">reply_num</td>
					<td class="myreply1">&nbsp;&nbsp;댓글</td>
					<td class="myreply2">날짜</td>
				</tr>
				<c:forEach items="${myReply}" var="myReply">
					<tr>
						<td hidden="true">${myReply.reply_num}</td>
						<td class="myreply1">&nbsp;&nbsp;글제목 :
							${myReply.boardVO.board_title} | 작성자 :
							${myReply.boardVO.member_id} / 작성일 : <c:if
								test="${empty myReply.boardVO.board_up_date}">${myReply.boardVO.board_date}</c:if>
							<c:if test="${not empty myReply.boardVO.board_up_date}">${myReply.boardVO.board_up_date}</c:if>
							<br> &nbsp;&nbsp;<a
							href="/review/movie/detail_view/${myReply.board_num}"
							class="a_tag">${myReply.reply_content}</a>
						</td>
						<td class="myreply2"><c:if
								test="${empty myReply.reply_up_date}">
								<fmt:formatDate value="${myReply.reply_date}"
									pattern="yyyy-MM-dd hh:mm" />
							</c:if> <c:if test="${not empty myReply.reply_up_date}">
								<fmt:formatDate value="${myReply.reply_up_date}"
									pattern="yyyy-MM-dd hh:mm" />
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br>
		<div>
			<table class="mytable">
				<tr>
					<td colspan="4" class="mytitle">내가 좋아요 한 게시글</td>
				</tr>
				<tr height="40px;">
					<td hidden="true">board_num</td>
					<td class="mylikeit1">&nbsp;&nbsp;제목</td>
					<td class="mylikeit2">글쓴이</td>
					<td class="mylikeit3">작성일자</td>
				</tr>
				<c:forEach items="${myLike}" var="myLike">
					<tr>
						<td hidden="true">${myLike.board_num}</td>
						<td class="mylikeit1">&nbsp;&nbsp;<a
							href="/review/movie/detail_view/${myLike.board_num}"
							class="a_tag">${myLike.boardVO.board_title}</a>
						</td>
						<td class="mylikeit2">${myLike.boardVO.member_id}</td>
						<td class="mylikeit3"><c:if
								test="${empty myLike.boardVO.board_up_date}">${myLike.boardVO.board_date}</c:if>
							<c:if test="${not empty myLike.boardVO.board_up_date}">${myLike.boardVO.board_up_date}</c:if>
						</td>
					</tr>
				</c:forEach>
			</table> --%>
		</div> 

		<div style="height: 100px;"></div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/share/footer.jsp" />
</html>