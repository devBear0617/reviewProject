<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remon</title>
<script type="text/javascript" src="/review/resources/script/jquery-2.1.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.moveBT').click(function() {
			$($(this).attr("data-target")).submit();
		});
	})
</script>
<style type="text/css">
.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
</style>
</head>
<jsp:include page="/WEB-INF/views/share/Main_header.jsp" />
<body>

	<div style="height: 100px;"></div>

	<div class="center">
		<!-- 상단바, 로고 -->
		<div class="center">
			<a href="/review"><img alt="REMON_LOGO"
				src="resources/image/REMON_logo(bigsize).png" style="width: 200px;"></a>
		</div>
		<br>

		<!-- 검색 바 -->
		<div class="center">
			<div class='moveBT' data-target="#searchMain">
				<form action="/review/search/main/" id="searchMain">
					<input type="text" id="query" name="query"
						style="width: 600px; height: 60px; background-image: url('resources/image/REMON_search_bar.png'); border-style: none;">
					<!-- 				<button
						style="border-radius: 30px; height: 30px; background-color: #ABF200; color: white; border-style: none;">
						<img alt="search_btn"
							src="resources/image/REMON_search_button.png" style="height: 30px;">
					</button> -->
				</form>
			</div>
		</div>
		<br>

		<!-- 네비 -->
		<div class="center">
			<table class="center">
				<tr>
					<td colspan="2"
						style="background-image: url('resources/image/REMON_mainMovie_BG.png'); width: 500px; height: 220px;">
						<div class='moveBT' data-target="#movieMain">
							<form action="/review/movie/main" id="movieMain">
								<div class="center">
									<img alt="MOVIE_icon"
										src="resources/image/REMON_MOVIE_icon(white).png"
										style="width: 70px; height: 70px;">
								</div>
							</form>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="1"
						style="background-image: url('resources/image/REMON_mainTv_BG.png'); width: 245px; height: 220px;">
						<div class='moveBT' data-target="#tvMain">
							<form action="/review/tv/main" id="tvMain">
								<div class="center">
									<img alt="TV_icon"
										src="resources/image/REMON_TV_icon(white).png"
										style="width: 70px; height: 70px;">
								</div>
							</form>
						</div>
					</td>
					<td colspan="1"
						style="background-image: url('resources/image/REMON_mainGame_BG.png'); width: 245px; height: 220px;">
						<div class='moveBT' data-target="#gameMain">
							<form action="/review/game/main" id="gameMain">
								<div class="center">
									<img alt="GAME_icon"
										src="resources/image/REMON_GAME_icon(white).png"
										style="width: 70px; height: 70px;">
								</div>
							</form>
						</div>
					</td>
				</tr>
			</table>
		</div>

		<div style="height: 100px;"></div>

	</div>
	
	<p>
		<a href="<c:url value='/review/mypage/uploadForm'/>">upload</a>
		<br>
		<a href="<c:url value='/review/mypage/gallery'/>">gallery</a>
	</p>
	
</body>

<jsp:include page="/WEB-INF/views/share/footer.jsp" />

</html>