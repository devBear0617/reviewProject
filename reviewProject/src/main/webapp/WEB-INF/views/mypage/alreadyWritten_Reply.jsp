<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
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

</body>
</html>