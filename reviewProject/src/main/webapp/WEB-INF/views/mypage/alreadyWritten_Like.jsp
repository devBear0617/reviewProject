<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
	function written_paging(pnum) {
		$.ajax({
			type : "GET",
			url : "/review/mypage/alreadyWritten/alreadyWritten_Like",
			data : {
				"pnum" : pnum
			},
			dataType : 'html',
			success : function(html) {
				$(".alreadyWritten_Like").empty();
				$(".alreadyWritten_Like").append(html);
			}
		})
	}
</script>


<body>

<div>
			<table class="mytable">
				<tr>
					<td colspan="4" class="mytitle">내가 좋아요 한 게시글</td>
				</tr>
				
				
				<c:forEach items="${myLike}" var="myLike">
					<tr onclick="location.href='/review/movie/detail_view/${myLike.board_num}'">
			
						<td>
							<img src="${myLike.boardVO.thumbnail}" height="70px" width="70px">
						</td>
						<td>
							${myLike.boardVO.board_title} <br>
							
						</td>
						<td>score: ${myLike.boardVO.lemon_grade}</td>
						
						<td>${myLike.boardVO.member_id}</td>
						<td><c:if test="${empty myLike.boardVO.board_up_date}">${myLike.boardVO.board_date}</c:if>
							<c:if test="${not empty myLike.boardVO.board_up_date}">${myLike.boardVO.board_up_date}</c:if></td>
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