<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/review/mypage/profileUpload" method="post" enctype="multipart/form-data">
	<input type="hidden" name="member_id" value="${sessionScope.member_id}">
	<input type="file" name="file">
	<input type="submit" value="변경">
	<input type="button" onclick="profileUploadCancel()" value="취소">
</form>

</body>
</html>