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

무비 EX : <input type="text" name="ex" >

<br><br>

리뷰 점수 : <input type="text" name="lemon_grade"> 점
<br>
<input type="radio" name="recommend" value="1">이 영화를 추천합니다.
<input type="radio" name="recommend" value="0">이 영화를 추천하지 않습니다.
<br>
개별점수 1. 
<select name="score_name1">
	<option value="">선택</option>
	<option value="재미">재미</option>
	<option value="액션">액션</option>
	<option value="연출">연출</option>
	<option value="감동">감동</option>
	<option value="반전">반전</option>
	<option value="실험성">실험성</option>
	<option value="시나리오">시나리오</option>
	<option value="사운드">사운드</option>
	<option value="연기">연기</option>
	<option value="캐스팅">캐스팅</option>
</select>
점수 : <input type="text" name="score_grade1"> 점
<br>
개별점수 2. 
<select name="score_name2">
	<option value="">선택</option>
	<option value="재미">재미</option>
	<option value="액션">액션</option>
	<option value="연출">연출</option>
	<option value="감동">감동</option>
	<option value="반전">반전</option>
	<option value="실험성">실험성</option>
	<option value="시나리오">시나리오</option>
	<option value="사운드">사운드</option>
	<option value="연기">연기</option>
	<option value="캐스팅">캐스팅</option>
</select>
점수 : <input type="text" name="score_grade2"> 점
<br>
개별점수 3. 
<select name="score_name3">
	<option value="">선택</option>
	<option value="재미">재미</option>
	<option value="액션">액션</option>
	<option value="연출">연출</option>
	<option value="감동">감동</option>
	<option value="반전">반전</option>
	<option value="실험성">실험성</option>
	<option value="시나리오">시나리오</option>
	<option value="사운드">사운드</option>
	<option value="연기">연기</option>
	<option value="캐스팅">캐스팅</option>
</select>
점수 : <input type="text" name="score_grade3"> 점
<br>
개별점수 4. 
<select name="score_name4">
	<option value="">선택</option>
	<option value="재미">재미</option>
	<option value="액션">액션</option>
	<option value="연출">연출</option>
	<option value="감동">감동</option>
	<option value="반전">반전</option>
	<option value="실험성">실험성</option>
	<option value="시나리오">시나리오</option>
	<option value="사운드">사운드</option>
	<option value="연기">연기</option>
	<option value="캐스팅">캐스팅</option>
</select>
점수 : <input type="text" name="score_grade4"> 점

<br><br>
hashtag1 : #<input type="text" name="hashtag1"><br>
hashtag2 : #<input type="text" name="hashtag2"><br>
hashtag3 : #<input type="text" name="hashtag3"><br>
hashtag4 : #<input type="text" name="hashtag4"><br>
hashtag5 : #<input type="text" name="hashtag5"><br>
hashtag6 : #<input type="text" name="hashtag6"><br><br>

<input type="submit" value="확인">
<input type="reset" value="취소">

</form>
	
	
</body>
</html>