<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<span style="color:blue">*사용 가능한 아이디 입니다. </span> 
<input type="hidden" value="${ID}" class="ID">
<input type="button" value="재확인" onclick="check_ID()">
<input type="button" value="사용하기" onclick="hold_ID()">

</body>
</html>