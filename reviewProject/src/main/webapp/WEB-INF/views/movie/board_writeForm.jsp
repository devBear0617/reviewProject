<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
1 유저 id x
2 제목
3 날짜(자동)
4 내용
5 추천 ox (lemon_grade => 쳌박, 라디오버튼)
6 전체 평점 (grade_score)
7 4개의 개별점수 (score_name1~4, score_grade1~4)
8 해시테그 1~6
9 리뷰 영화의 정보 (api)
 -->
<h1>새글작성.</h1>
<form action="/review/movie/board_write" method="post" id="board_write">
제목 : 
<br>
<input type="text" name="board_title">
<br><br>
내용 : 
<br>
<textarea name="board_content" cols="40" rows="8" ></textarea>
<br><br>
<input type="submit" value="확인">
<input type="reset" value="취소">

</form>
	
	
</body>
</html>