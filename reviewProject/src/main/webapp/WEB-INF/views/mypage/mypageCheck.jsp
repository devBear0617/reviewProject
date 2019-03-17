<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="/review/resources/script/jquery-2.1.1.js"></script>
<script type="text/javascript">

var url = '/review/mypage';

$(document).ready(function() {
	$.ajax({
		type : "GET",
		url: url +'/profileUpload_BT',
		success : function(html) {
			$(".uploadProfile_BT").append(html);
		}
	})
});

function profileUploadFORM() {
	$.ajax({
		url: url +'/profileUpload',
		type: 'GET',
		success: function (html) {
			$(".uploadProfile_BT").empty();
			$(".uploadProfile").append(html);
		}
	});
};

function profileUploadCancel() {
	$.ajax({
		url: url +'/profileUpload_BT',
		type: 'GET',
		success: function (html) {
			$(".uploadProfile").empty();
			$(".uploadProfile_BT").append(html);
		}
	});
};


</script>

</head>
<body>

<h1>마이페이지.</h1>
<h4>ID : ${user.member_id}</h4>
<h4>PW : ${user.member_pw}</h4>
<h4>NAME : ${user.member_name}</h4>
<h4>Email : ${user.member_email}</h4>

<c:if test="${empty user.member_pic}">
	<img src="/review/movie/resources/memberImage/DefaultPerson.png">
</c:if>
<c:if test="${not empty user.member_pic}">
	<img src="/review/movie/resources/memberImage/${user.member_pic}">
</c:if>

<br>

<div class="uploadProfile_BT"></div>
<div class="uploadProfile"></div>

<br><br>

<input type="button" value="로그아웃" 
	onclick="location.href='/review/mypage/logout'">
<input type="button" value="정보변경"
	onclick="location.href='/review/mypage/updateMemberForm'">

</body>
</html>