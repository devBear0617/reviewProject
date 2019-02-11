<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type = "text/javascript" src = "resources/script/jquery-2.1.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.moveBT').click(function(){
    	$($(this).attr("data-target")).submit();
    });
})
</script>
</head>
<body>
<!-- 네비 -->
	<div>
		<div class = 'moveBT' data-target="#movieMain" >
			<form action="/review/movie/main" id="movieMain">
				<h1>test - movie로 이동</h1>
			</form>
		</div>
		<div class = 'moveBT' data-target="#tvMain">
			<form action="/review/tv/main" id="tvMain">
				<h1>test - tv로 이동</h1>
			</form>
		</div>
		<div class = 'moveBT' data-target="#gameMain">
			<form action="/review/game/main" id="gameMain">
				<h1>test - game으로 이동</h1>
			</form>
		</div>
	</div>

</body>
</html>