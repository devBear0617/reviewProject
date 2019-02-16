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
		<span>리뷰 제목: ${board.board_title}</span>&nbsp;&nbsp;&nbsp;     
		<span>날짜 : ${board.board_date}</span>
	</div>
	
<!-- 이미지, 평점(추천합니다/안합니다), 상세별점, 리뷰의 좋아요, #  -->
	<div>
		<!-- 이미지 -->
		<div>
			
		</div>
		
		<!-- 전체평점, 상세평점 (레몬으로) -->
		<div>
		
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
			리뷰내용: ${board.board_content}
		<br>
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
	<input type="button" value="홈"
				onclick="location.href='/review/movie/main'">

</body>
</html>