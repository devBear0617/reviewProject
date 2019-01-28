<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 유저프로필, 유저ID, 제목 바 ( O 유저ID | 리뷰 제목              | 날짜 ) -->
	<div>
		
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
		<div>
		
		</div>
				
	</div>
	
<!-- 리뷰 content, 영화 간단 정보 -->
	<div>
		<!-- 리뷰내용 -->
		<div>
			
		</div>
		
		<!-- 영화 간단 정보 (영화 제목, 장르, 감독, 개봉일시) -->
		<div>
		
		</div>
		
	</div>
	
	<!-- 덧글 forEach -->
	<div>
		<jsp:include page="../share/reply.jsp" />
	</div>

</body>
</html>