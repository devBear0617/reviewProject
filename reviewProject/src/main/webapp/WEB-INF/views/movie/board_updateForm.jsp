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
<form action="/review/movie/board_update/${board.board_num}" method="post" id="board_update">
제목 : 
<br>
<input type="text" name="board_title" value="${board.board_title}">
<br><br>
내용 : 
<br>
<textarea name="board_content" cols="40" rows="8">${board.board_content}</textarea>
<br><br>

무비 EX : <input type="text" name="ex" value="${board.b_movieVO.ex}">

<br><br>

리뷰 점수 : <input type="text" name="lemon_grade" value="${board.lemon_grade}"> 점
<br>
<c:choose>
	<c:when test="${board.recommend == 1}">
		<input type="radio" name="recommend" value="1" checked>이 영화를 추천합니다.
		<input type="radio" name="recommend" value="0">이 영화를 추천하지 않습니다.
	</c:when>
	<c:when test="${board.recommend == 0}">
		<input type="radio" name="recommend" value="1">이 영화를 추천합니다.
		<input type="radio" name="recommend" value="0" checked>이 영화를 추천하지 않습니다.
	</c:when>
	<c:otherwise>
		<input type="radio" name="recommend" value="1">이 영화를 추천합니다.
		<input type="radio" name="recommend" value="0">이 영화를 추천하지 않습니다.
	</c:otherwise>
</c:choose>
<br>
개별점수 1. 
<select name="score_name1">
	<option value="${board.score_name1}">${board.score_name1}</option>
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
점수 : <input type="text" name="score_grade1" value="${board.score_grade1}"> 점
<br>
개별점수 2. 
<select name="score_name2">
	<option value="${board.score_name2}">${board.score_name2}</option>
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
점수 : <input type="text" name="score_grade2" value="${board.score_grade2}"> 점
<br>
개별점수 3. 
<select name="score_name3">
	<option value="${board.score_name3}">${board.score_name3}</option>
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
점수 : <input type="text" name="score_grade3" value="${board.score_grade3}"> 점
<br>
개별점수 4. 
<select name="score_name4">
	<option value="${board.score_name4}">${board.score_name4}</option>
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
점수 : <input type="text" name="score_grade4" value="${board.score_grade4}"> 점

<br><br>
hashtag1 : #<input type="text" name="hashtag1" value="${board.hashtagVO.hashtag1}"><br>
hashtag2 : #<input type="text" name="hashtag2" value="${board.hashtagVO.hashtag2}"><br>
hashtag3 : #<input type="text" name="hashtag3" value="${board.hashtagVO.hashtag3}"><br>
hashtag4 : #<input type="text" name="hashtag4" value="${board.hashtagVO.hashtag4}"><br>
hashtag5 : #<input type="text" name="hashtag5" value="${board.hashtagVO.hashtag5}"><br>
hashtag6 : #<input type="text" name="hashtag6" value="${board.hashtagVO.hashtag6}"><br><br>


<input type="submit" value="확인">
<input type="reset" value="취소">

</form>
	
	
</body>
</html>