<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 유저프로필, 유저ID, 제목 바 ( O 유저ID | 리뷰 제목              | 날짜 ) -->
	<div>
		<%-- 
		<span>${board.memberVO.member_pic}</span> 
		<span>${board.memberVO.member_name}</span>
		<span>유저ID: ${board.member_id}</span>&nbsp;&nbsp;&nbsp;     
		--%>
		<span>유저ID: ${board.member_id}</span>&nbsp;&nbsp;&nbsp;  
		<span>|&nbsp;&nbsp;&nbsp;리뷰 제목: ${board.board_title}</span>&nbsp;&nbsp;&nbsp;     
		<span>|&nbsp;&nbsp;&nbsp;날짜 : ${board.board_date}</span>
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
		<br><br>
			무비ex: ${board.b_movieVO.ex}
		<br><br>
		
		</div>
		
		<!-- 영화 간단 정보 (영화 제목, 장르, 감독, 개봉일시) -->
		<div>
			 영화 정보: 
			 <ul style="list-style:none;">
			 	<li>${mApiVO.movieCd}</li>
			 	<li>${mApiVO.movieNm}</li>
			 	<li>${mApiVO.genreAlt}</li>
			 	<li>${mApiVO.repNationNm}</li>
			 	<li>${mApiVO.peopleNm}</li>
			 </ul>
		</div>
	</div>
	
	<!-- 덧글 forEach -->
	<div style="color: blue;">
		<br>댓글<br>
		<jsp:include page="../share/reply.jsp" />
	</div>
	
	<br><br>
	글번 : ${board.board_num}
	<input type="button" value="목록"
				onclick="location.href='/review/movie/main'">
	&nbsp;&nbsp;
	<input type="button" value="수정"
				onclick="location.href='/review/movie/movie_updateForm/${board.board_num}'">
	&nbsp;&nbsp;
	<form action="/review/movie/movie_delete/${board.board_num}" method="post" id="movie_delete">
	<input type="submit" value="삭제">
	</form>

</body>
</html>