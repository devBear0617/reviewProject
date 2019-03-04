<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type = "text/javascript" src = "../resources/script/jquery-2.1.1.js"></script>
<script type = "text/javascript">

$(document).ready(function() {
	$.ajax({
		type : "GET",
		url : "/review/movie/detail_view/${board.board_num}/reply",
		cache : false,
		dataType : 'html',
		success : function(html) {
			$(".reply").append(html);
		}
	})
});

</script>

</head>
<body>
<!-- 유저프로필, 유저ID, 제목 바 ( O 유저ID | 리뷰 제목              | 날짜 ) -->
	<div>
		<%-- 
		<span>${board.memberVO.member_pic}</span> 
		<span>${board.memberVO.member_name}</span>
		--%>
		<span>유저ID: ${board.member_id}</span>&nbsp;&nbsp;&nbsp;  
		<span>|&nbsp;&nbsp;&nbsp;리뷰 제목: ${board.board_title}</span>&nbsp;&nbsp;&nbsp;     
		<span>|&nbsp;&nbsp;&nbsp;날짜 :
		<fmt:formatDate value="${board.board_date}" pattern="yyyy-MM-dd hh:mm"/></span>
	</div>
	
<!-- 이미지, 평점(추천합니다/안합니다), 상세별점, 리뷰의 좋아요, #  -->
	<div>
		<!-- 이미지 -->
		<div>
			
		</div>
		
		<!-- 전체평점, 상세평점 (레몬으로) -->
		<div>
		<br><br>
		<table border="1">
			<tr>
				<td>
				<table border="1">
					<tr>
						<td>
						평점.
						<br>
						${board.lemon_grade}% 의 <br>
						<c:choose>
							<c:when test="${board.lemon_grade < 50}">'덜 익은'</c:when>
							<c:when test="${board.lemon_grade > 51}">'잘 익은'</c:when>
							<c:otherwise>상품 가치 없는</c:otherwise>
						</c:choose>
						레몬
						</td>
					</tr>
					<tr>
						<td>
						<c:choose>
							<c:when test="${board.recommend == 1}">
								이 영화를 추천 합니다.
							</c:when>
							<c:otherwise>
								이 영화를 추천하지 않습니다.
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
				</table>
				</td>
					
				<td>
					개별점수.  <br>
					${board.gradeVO.grade_name1} : ${board.gradeVO.grade1} <br>
					${board.gradeVO.grade_name2} : ${board.gradeVO.grade2} <br>
					${board.gradeVO.grade_name3} : ${board.gradeVO.grade3} <br>
					${board.gradeVO.grade_name4} : ${board.gradeVO.grade4} <br>
				</td>
			</tr>
		</table>
		<br><br>
		</div>
		
		<!-- 좋아요 , 덧글 수 -->
		<div>
			<h4>좋아요 : </h4>
			<c:forEach items="${board.likeList}" var="like">
				<span>작성자 : ${like.member_id}, ${like.likeit} </span>
				<br>
			</c:forEach>
		</div>
		
		<!-- # 최대 6개 -->
		<div style="color: green;">
		<br>해시태그<br>
			<span># ${board.hashtagVO.hashtag1}</span>&nbsp;&nbsp;&nbsp;  
			<span># ${board.hashtagVO.hashtag2}</span>&nbsp;&nbsp;&nbsp;  
			<span># ${board.hashtagVO.hashtag3}</span>&nbsp;&nbsp;&nbsp;  
			<span># ${board.hashtagVO.hashtag4}</span>&nbsp;&nbsp;&nbsp;  
			<span># ${board.hashtagVO.hashtag5}</span>&nbsp;&nbsp;&nbsp;  
			<span># ${board.hashtagVO.hashtag6}</span>
		</div>
				
	</div>
	
<!-- 리뷰 content, 영화 간단 정보 -->
	<div style="border-color: red;">
		<!-- 리뷰내용 -->
		<div>
		<br>
			<h2>리뷰내용:</h2><br>
			--------------------------<br><br>
			 ${board.board_content}
			<br><br>--------------------------
			<br>Thumbnail image
			<%-- <br>${element} --%>
			<br><p><img src="${strrrrr}"></p>
			<br>---------------------------
		<br><br>
			무비 movie_nm: ${board.b_movieVO.movie_nm}
		<br><br>
		
		</div>
		
		<!-- 영화 간단 정보 (영화 제목, 장르, 감독, 개봉일시) -->
		<div>
			 영화 정보: 
			 <ul style="list-style:none;">
			 	<li>${mApiVO.movie_nm}</li>
			 	<li>${mApiVO.genre}</li>
			 	<li>${mApiVO.nation}</li>
			 	<li><img src="${mApiVO.poster}"> </li>
			 </ul>
		</div>
	</div>
	
	<!-- 덧글 forEach -->
	<div class="reply">
	</div>
	
	<br><br>
	
	<%-- 글번 : ${board.board_num} --%>
	
	<input type="button" value="목록"
				onclick="location.href='/review/movie/main'">
	<br>
	
	<c:if test="${sessionScope.member_id == board.member_id}">
	
	<input type="button" value="수정"
				onclick="location.href='/review/movie/movie_updateForm/${board.board_num}'">
	&nbsp;&nbsp;
	<form action="/review/movie/movie_delete/${board.board_num}" method="post" id="movie_delete">
	<input type="submit" value="삭제">
	</form>
	
	</c:if>
</body>
</html>