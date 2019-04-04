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
					style="font-size: large;">${result.board_title}</span> <br> <%-- <c:choose>
					<c:when test="${fn:length(result.board_content) > 50}">
						<c:out value="${fn:substring(result.board_content, 0, 49)}" />...
					</c:when>
					<c:otherwise>
            			<c:out value="${result.board_content}"/>
           			</c:otherwise> 
				</c:choose> --%></td>
				<td>score: ${result.lemon_grade}</td>
				<td style="text-align: right;">&nbsp;&nbsp;<img
									src="/review/movie/resources/memberImage/${board.memberVO.member_pic}"
									style="width: 30px; height: 30px; border-radius: 30px;"> ${result.member_id}</td>
				<td>&nbsp;<c:if test="${empty result.board_up_date}">${result.board_date}</c:if>
					<c:if test="${not empty result.board_up_date}">${result.board_up_date}</c:if></td>
			</tr>
			<tr>
				<td colspan="6"><hr></td>
			</tr>
		</c:forEach>
	</table>


</body>

</html>