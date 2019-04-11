<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<style type="text/css">
.error_st {
	margin-left: auto;
	margin-right: auto;
	font-weight: 900;
	text-align: center;
	height: 600px;
	width: 1200px;
	font-size: x-large;
}

.btn_st2 {
	background-image: url('resources/image/REMON_smallbar.png');
	color: white;
	width: 300px;
	height: 30px;
	border-radius: 10px;
	border-style: none;
	width: 90px;
	height: 30px;
	text-align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="/review/resources/script/common.js"></script>

<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/share/Login_header.jsp" />
	<div class="error_st">
		<div style="height: 250px;"></div>
		<br>잘못된 경로입니다.<br> <br> <input type="button" value="홈"
			onclick="homeBT()" class="btn_st2"> <input type="button"
			value="이전" onclick="backBT()" class="btn_st2">
	</div>
	<jsp:include page="/WEB-INF/views/share/footer.jsp" />


</body>
</html>
