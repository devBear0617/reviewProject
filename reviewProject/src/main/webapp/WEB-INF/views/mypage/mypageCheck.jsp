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
			url : url + '/profileUpload_BT',
			success : function(html) {
				$(".uploadProfile_BT").append(html);
			}
		})
	});

	function profileUploadFORM() {
		$.ajax({
			url : url + '/profileUpload',
			type : 'GET',
			success : function(html) {
				$(".uploadProfile_BT").empty();
				$(".uploadProfile").append(html);
			}
		});
	};

	function profileUploadCancel() {
		$.ajax({
			url : url + '/profileUpload_BT',
			type : 'GET',
			success : function(html) {
				$(".uploadProfile").empty();
				$(".uploadProfile_BT").append(html);
			}
		});
	};
</script>
<style type="text/css">
.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.td_mypage1 {
	width: 100px;
	height: 30px;
	background: linear-gradient(to right, #ffe400, #abf200);
	color: white;
}

.td_mypage2 {
	width: 200px;
	height: 30px;
	text-align: left;
	background-color: #F2F2F2;
}

.td_mypage3 {
	width: 150px;
	height: 120px;
	text-align: center;
}
</style>
<jsp:include page="/WEB-INF/views/share/Login_header.jsp" />
</head>
<body>
	<div class="center">
		<div>
			<h1>마이페이지</h1>
			<hr width="1100px;">
		</div>
		<div style="height: 50px;"></div>
		<table class="center">
			<tr>
				<td class="td_mypage3"><c:if test="${empty user.member_pic}">
						<img src="/review/movie/resources/memberImage/DefaultPerson.png"
							style="height: 120px; width: 120px; border-radius: 120px; border: 3px solid #F2F2F2;">
					</c:if> <c:if test="${not empty user.member_pic}">
						<img src="/review/movie/resources/memberImage/${user.member_pic}"
							style="height: 120px; width: auto; border-radius: 120px;">
					</c:if></td>
				<td><table class="center">
						<tr>
							<td class="td_mypage1">ID</td>
							<td class="td_mypage2">&nbsp;&nbsp;${user.member_id}</td>
						</tr>
						<tr>
							<td class="td_mypage1">PW</td>
							<td class="td_mypage2">&nbsp;&nbsp;${user.member_pw}</td>
						</tr>
						<tr>
							<td class="td_mypage1">NAME</td>
							<td class="td_mypage2">&nbsp;&nbsp;${user.member_name}</td>
						</tr>
						<tr>
							<td class="td_mypage1">Email</td>
							<td class="td_mypage2">&nbsp;&nbsp;${user.member_email}</td>
						</tr>
					</table></td>
			</tr>
		</table>

		<div style="height: 20px;"></div>
		<hr width="400px;">
		<div style="height: 20px;"></div>
	</div>



	<div class="uploadProfile_BT"></div>
	<div class="uploadProfile"></div>

	<div class="center">
		<table class="center">
			<tr>
				<td><input type="button" value="로그아웃"
					onclick="location.href='/review/mypage/mypageLogout'"
					style="background-image: url('resources/image/REMON_smallbar.png'); color: white; width: 300px; height: 30px; border-radius: 10px; border-style: none;">
				</td>
			</tr>
			<tr>
				<td><input type="button" value="정보변경"
					onclick="location.href='/review/mypage/updateMemberForm'"
					style="background-image: url('resources/image/REMON_smallbar.png'); color: white; width: 300px; height: 30px; border-radius: 10px; border-style: none;">
				</td>
			</tr>
			<tr>
				<td><input type="button" value="내가 쓴 글"
					onclick="location.href='/review/mypage/alreadyWrittenBoard'"
					style="background-image: url('resources/image/REMON_smallbar.png'); color: white; width: 300px; height: 30px; border-radius: 10px; border-style: none;">
				</td>
			</tr>
			<tr>
				<td><input type="button" value="홈"
					onclick="location.href='/review'"
					style="background-image: url('resources/image/REMON_smallbar.png'); color: white; width: 300px; height: 30px; border-radius: 10px; border-style: none;">
				</td>
			</tr>
		</table>
		<div style="height: 100px;"></div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/share/footer.jsp" />
</html>