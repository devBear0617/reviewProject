<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/review/resources/script/jquery-2.1.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.moveBT').click(function() {
			$($(this).attr("data-target")).submit();
		});
	})
</script>
<style type="text/css">
.td_class1 {
	width: 400px;
}

.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
</style>
</head>
<body>
	<!-- 네비 -->
	<div class="center">
		<table class="center">
			<tr>
				<td class="td_class1">
					<div class='moveBT' data-target="#movieMain">
						<form action="/review/movie/main" id="movieMain">
							<h1>Movie</h1>
						</form>
					</div>
				</td>
				<td class="td_class1">
					<div class='moveBT' data-target="#tvMain">
						<form action="/review/tv/main" id="tvMain">
							<h1>tv</h1>
						</form>
					</div>
				</td>
				<td class="td_class1">
					<div class='moveBT' data-target="#gameMain">
						<form action="/review/game/main" id="gameMain">
							<h1>game</h1>
						</form>
					</div>
				</td>
			</tr>
		</table>
	</div>

</body>
</html>