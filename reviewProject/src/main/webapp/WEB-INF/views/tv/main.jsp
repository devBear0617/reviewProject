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

<h1>준비중...</h1>
<br>
<a href="/review">홈</a>
<br><br>
<form action="/review/back" method="post" id="back">
	<input type="hidden" name="address" value="${address}"> 
	<input type="submit" value="이전">
</form>

<!-- 테스트 게시판 -->

<%-- <table border="1">
   <tr>
      <td>리얼번호</td>
      <td>번호</td>
      <td>제목</td>
      <td>작성자</td>
      <td>날짜</td>
   </tr>
   
   <c:forEach items="${tvboard_list}" var="board">
   <tr>
      <td>${board.board_num}</td>
      <td>${board.b_tvVO.b_tv_num}</td>
      <td><a href="/review/tv/content/${board.board_num}">${board.board_title}</a></td>
      <td>${board.member_id}</td>
      <td>${board.board_date}</td>
   </tr>
   </c:forEach>
</table>


<input type="button" value="new" onclick="location.href='/review/tv/new'">

<br>

<input type="button" value="home" onclick="location.href='/review/'"> --%>

</body>
</html>