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

</body>
</html>