<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remon</title>
<script type="text/javascript" src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.moveBT').click(function() {
			$($(this).attr("data-target")).submit();
		});
	})
</script>
<style type="text/css">
input:focus {
	outline:none;
	}

.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/share/Main_header.jsp" />
	<div style="height: 100px;"></div>
	<div class="center">
		<div class="center">
			<a href="/review">
				<img alt="REMON_LOGO"
					src="resources/image/REMON_logo(bigsize).png" style="width: 200px;">
			</a>
		</div>
		<br>
		<div class="center"
			style="width: 600px; height: 60px; background-image: url('resources/image/REMON_search_bar.png'); border-style: none;">
			<form action="/review/search/searchResult" method="POST" id="search" style="padding-top: 15px;">
				<input type="text" id="query" name="keyword"
					style="width: 450px; height: 30px; border-style: none;"> 
				<input type="submit" style="border-style: none; background: none;" value="검색">
			</form>
		</div>
	</div>
	<br>
	<div class="center">
		<table class="center">
			<tr>
				<td colspan="2"
					style="background-image: url('resources/image/REMON_mainMovie_BG.png'); width: 500px; height: 220px;"
					class='moveBT' data-target="#movieMain">
					<form action="/review/movie/main" id="movieMain">
						<div class="center">
							<img alt="MOVIE_icon"
								src="resources/image/REMON_MOVIE_icon(white).png"
								style="width: 70px; height: 70px;">
						</div>
					</form>
				</td>
			</tr>
			<tr>
				<td colspan="1"
					style="background-image: url('resources/image/REMON_mainTv_BG.png'); width: 245px; height: 220px;"
					class='moveBT' data-target="#tvMain">
					<form action="/review/tv/main" id="tvMain">
						<div class="center">
							<img alt="TV_icon" src="resources/image/REMON_TV_icon(white).png"
								style="width: 70px; height: 70px;">
						</div>
					</form>
				</td>
				<td colspan="1"
					style="background-image: url('resources/image/REMON_mainGame_BG.png'); width: 245px; height: 220px;"
					class='moveBT' data-target="#gameMain">
					<form action="/review/game/main" id="gameMain">
						<div class="center">
							<img alt="GAME_icon"
								src="resources/image/REMON_GAME_icon(white).png"
								style="width: 70px; height: 70px;">
						</div>
					</form>
				</td>
			</tr>
		</table>
	</div>
	<div style="height: 100px;"></div>
	<jsp:include page="/WEB-INF/views/share/footer.jsp" />
</body>
</html>