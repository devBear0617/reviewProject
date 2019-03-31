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
			</table>
		</div>

</body>
</html>