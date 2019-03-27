<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="/review/resources/script/jquery-3.3.1.min.js"></script>
<style type="text/css">
.center {
	margin-left: auto;
	margin-right: auto;
}

.category1 {
	height: 240px;
	width: 1200px;
	background: linear-gradient(to left, #abf200, #ffe400);
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.movieinfo_1 {
	width: 100px;
	height:
}

.movieinfo_2 {
	width: 300px;
	height:	
}

.movieinfo_3 {
	width: 100px;
	height:

}

.movieinfo_4 {
	width: 200px;
	height:	
}
</style>
<div class="category1">
	<div class="center">
		<table class="center">
			<tr>
				<td class="movieinfo_1"><img alt="포스터 없음" src="${movie.poster}"></td>
				<td>
					<table>
						<tr>
							<td colspan="2" class="movieinfo_2">${movie.movie_nm}</td>
						</tr>
						<tr>
							<td class="movieinfo_3">개봉일 :</td>
							<td class="movieinfo_4">${movie.open_dt}</td>
						</tr>
						<tr>
							<td class="movieinfo_3">장르 :</td>
							<td class="movieinfo_4">${movie.genre}</td>
						</tr>
						<tr>
							<td class="movieinfo_3">국가 :</td>
							<td class="movieinfo_4">${movie.nation}</td>
						</tr>
						<tr>
							<td class="movieinfo_3">감독 :</td>
							<td class="movieinfo_4">${movie.director}</td>
						</tr>
						<tr>
							<td class="movieinfo_3">배우 :</td>
							<td class="movieinfo_4">${movie.actor}</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</div>
<br>
