<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<span style="color:blue">${mem_id} v</span>
<input type="button" value="중복확인" onclick="check_ID()">
<input type="hidden" value="${mem_id}" name="member_id">

</body>
</html>