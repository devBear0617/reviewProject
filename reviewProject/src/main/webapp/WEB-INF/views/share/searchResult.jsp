<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(document).ready(
	function () {
		$("#s_title").autocomplete({
			minLength : 1,
			delay : 30,
			source : function(request, response) {
				$.ajax({
					url : "./autocomplete",
					type : "post",
					dataType : "json",
					data : {
						s_title : request.term,
						s_sort : $('#s_sort').val()
					},
					success : function(data) {
						response($.map(data, function(item) {
							switch ($('#s_sort').val()) {
								case "movie":
									item.title = item.title.replace(/<b>/gi, "").replace(/<\/b>/gi, "");
									break;
								default:
									item.title = item.peopleNm;
									break;
							}
							return {
								label : item.title,
								value : item.title
							};
						}))
					},
					error : function(data) {
						console.log("에러");
					}
				});
			},
			focus : function(event, ui) {
				return false;
			}
		});
	})
</script>
</head>
<body>
<form action="/review/search/searchResult" method="POST" id="searchTitle">
	<select id="s_sort" name="s_sort">
		<option value="total">통합 검색</option>
		<option value="title">게시글 제목</option>
		<option value="content">게시글 내용</option>
		<option value="reply">댓글</option>
		<option value="movie">영화</option>
		<option value="people">영화인</option>
	</select>
	<input type="text" id="s_title" name="s_title">
	<input type="submit" value="검색">
</form>
<h1>검색결과</h1>
<table border='1'>
	<tr>
		<td>글넘</td>
		<td>글제</td>
		<td>글쓴</td>
	</tr>
		<c:forEach items="${board}" var="board">
			<tr>
				<td>${board.board_num}</td>
				<td>${board.board_title}</td>
				<td>${board.member_id}</td>
			</tr>
		</c:forEach>
</table>
<br>
<table border='1'>
	<tr>
		<td>영화명</td>
		<td>개봉일</td>
		<td>장르</td>
		<td>배우</td>
		<td>국가</td>
		<td>감독</td>
	</tr>
	<c:forEach items="${movieList}" var="movie">
	<tr>
		<td>${movie.movie_nm}</td>
		<td>${movie.open_dt}</td>
		<td>${movie.genre}</td>
		<td>${movie.actor}</td>
		<td>${movie.nation}</td>
		<td>${movie.director}</td>
	</tr>
	</c:forEach>
</table>

<a href="/review">홈</a>

</body>
</html>