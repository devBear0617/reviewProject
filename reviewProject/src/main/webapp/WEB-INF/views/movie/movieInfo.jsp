<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/review/resources/script/jquery-3.3.1.min.js"></script>
<img alt="포스터 없음" src="${movie.poster}">
<div>
	<h5 class="q">${movie.movie_nm}</h5>
	<p>${movie.open_dt}</p>
	<p>${movie.genre}</p>
	<p>${movie.actor}</p>
	<p>${movie.nation}</p>
	<p>${movie.director}</p>
	<p>${movie.actor}</p>
</div>
