<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="/review/resources/script/jquery-3.3.1.min.js"></script>
<style type="text/css">
.table_center {
	margin-left: auto;
	margin-right: auto;
	width: 580px;
	height: 200px;
	padding-top: 10px;
}

.category1 {
	height: 250px;
	width: 1200px;
	background: linear-gradient(to left, #abf200, #ffe400);
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	padding-top: 15px;
	padding-bottom: 15px;
}

.movieinfo_1 {
	width: 160px;
	height: 200px;
	background-color: #F2F2F2;
	border-radius: 5px;
	text-align: center;
}

.movieinfo_1a {
	width: 400px;
	height: 200px;
	margin-top: auto;
	margin-bottom: auto;
}

.movieinfo_1b {
	width: 20px;
	height: 200px;
}

.movieinfo_2 {
	width: 400px;
	height: 50px;
	font-size: 20px;
	font-weight: bold;
	text-align: left;
}

.movieinfo_3 {
	width: 100px;
	height: 30px;
	text-align: center;
	font-weight: bold;
}

.movieinfo_4 {
	width: 300px;
	height: 30px;
	text-align: left;
}
</style>
<div class="category1">
	<table class="table_center">
		<tr>
			<td class="movieinfo_1"><img alt="포스터 없음" src="${movie.poster}"
				style="border-radius: 5px;"></td>
			<td class="movieinfo_1b"></td>
			<td class="movieinfo_1a">
				<table>
					<tr>
						<td colspan="2" class="movieinfo_2">&nbsp;&nbsp;${movie.movie_nm}</td>
					</tr>
					<tr>
						<td class="movieinfo_3">개봉일 :</td>
						<td class="movieinfo_4">${movie.open_dt}</td>
					</tr>
					<tr>
						<td class="movieinfo_3">장&nbsp;&nbsp;르 :</td>
						<td class="movieinfo_4">${movie.genre}</td>
					</tr>
					<tr>
						<td class="movieinfo_3">국&nbsp;&nbsp;가 :</td>
						<td class="movieinfo_4">${movie.nation}</td>
					</tr>
					<tr>
						<td class="movieinfo_3">감&nbsp;&nbsp;독 :</td>
						<td class="movieinfo_4">${movie.director}</td>
					</tr>
					<tr>
						<td class="movieinfo_3">배&nbsp;&nbsp;우 :</td>
						<td class="movieinfo_4">${movie.actor}</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>

<br>
