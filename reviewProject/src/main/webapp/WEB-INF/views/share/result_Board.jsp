<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function search_paging(pnum,keyword) {
		
		$.ajax({
			type : "POST",
			url : "/review/search/searchResult/${type}",
			data : {
				"pnum" : pnum,
				keyword : keyword
			},
			dataType : 'html',
			success : function(html) {
				if(${type == "result_Total"}){
					$(".result_Total").empty();
					$(".result_Total").append(html);
				}else if (${type == "result_Movie_only"}){
					$(".result_Movie").empty();
					$(".result_Movie").append(html);
				}else if (${type == "result_Movie_member"}){
					$(".result_Movie_Member").empty();
					$(".result_Movie_Member").append(html);
				}else if (${type == "result_Movie_hashtag"}){
					$(".result_Movie_Hashtag").empty();
					$(".result_Movie_Hashtag").append(html);
				}else if (${type == "result_Movie_titleContent"}){
					$(".result_Movie_TitleContent").empty();
					$(".result_Movie_TitleContent").append(html);				
				}else if (${type == "result_Movie_grade"}){
					$(".result_Movie_Grade").empty();
					$(".result_Movie_Grade").append(html);						
				}else if (${type == "result_Movie_like"}){
					$(".result_Movie_Like").empty();
					$(".result_Movie_Like").append(html);				
				}
				
			}
		})
	}
</script>
<body>
	<table>
		<c:forEach items="${search_Result}" var="result">
			<tr
				onclick="location.href='/review/movie/detail_view/${result.board_num}'"
				style="border-bottom-style: 1px solid #F2F2F2;">
				<td></td>
				<td><img src="${result.thumbnail}"
					style="height: 70px; width: 70px; border-radius: 20px;"></td>
				<td style="width: 500px; text-align: left;">&nbsp;<span 
					style="font-size: large;">${result.board_title}</span> <br></td>
				<td>score: ${result.lemon_grade}</td>
				<td style="text-align: right;">&nbsp;&nbsp;<img
					src="/review/movie/resources/memberImage/${result.memberVO.member_pic}"
					style="width: 30px; height: 30px; border-radius: 30px;">
					${result.member_id}
				</td>
				<td>&nbsp;<c:if test="${empty result.board_up_date}">${result.board_date}</c:if>
					<c:if test="${not empty result.board_up_date}">${result.board_up_date}</c:if></td>
			</tr>
			<tr>
				<td colspan="6"><hr></td>
			</tr>
		</c:forEach>
	</table>
	<inpuy type="hidden" value="${type}" id="type">
	<div class="paging">
		<c:if test="${pagination.startPage ne 0}">
			<c:if test="${pagination.prevPage ne 0}">
				<a href="#"
					onClick="search_paging('${pagination.prevPage}','${keyword}')">[이전]</a>
			</c:if>
			<c:forEach var="pnum" begin="${pagination.startPage}"
				end="${pagination.endPage}">
				<c:choose>
					<c:when test="${pnum eq  pagination.curPage}">
						<span style="font-weight: bold;"><a href="#"
							onClick="search_paging('${pnum}','${keyword}')">${pnum}</a></span>
					</c:when>
					<c:otherwise>
						<a href="#" onClick="search_paging('${pnum}','${keyword}')">${pnum}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if
				test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
				<a href="#"
					onClick="search_paging('${pagination.nextPage}','${keyword}')">[다음]</a>
			</c:if>
		</c:if>
	</div>
	<br>
	<br>
</body>

</html>
