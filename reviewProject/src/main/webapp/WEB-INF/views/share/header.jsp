<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(document).ready(
	function() {
		$("#s_title").autocomplete({
			minLength : 1,
			delay : 30,
			source : function(request, response) {
				$.ajax({
					url : "../search/autocomplete",
					type : "post",
					dataType : "json",
					data : {
						s_title : request.term
					},
					success : function(data) {
						response($.map(data, function(item) {
							item.title = item.title.replace(/<b>/gi, "").replace(/<\/b>/gi, "");
							return {
								label : item.title,
								value : item.title
							};
						}))
					},
					error : function(data) {
						console.log("에러");
					}
				});
			},
			focus : function(event, ui) {
				return false;
			}
		});
	})
</script>
<style type="text/css">
.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.no_background {
	background: none;
	width: 400px;
	align-content: center;
}
</style>
<div class="center">
<table class="center"
	style="background: background: -webkit-linear-gradient(to right, #abf200, #ffe400); background: linear-gradient(to right, #abf200, #ffe400); width: 1200px; height: 90px;">
	<tr>
		<td class="no_background">
			<!-- 로고 -->
			<div class="logo"
				style="float: left; margin-top: 10px; margin-left: 20px;">
				<a href="/review"><img alt="REMON_LOGO"
					src="/review/movie/resources/image/REMON_logo(white_bigsize).png"
					style="height: 50px;"></a>
			</div>
		</td>
		<td class="no_background">
			<!-- 검색 바 -->
			<div class='moveBT' data-target="searchTitle">
				<form action="/review/search/searchResult" id="searchTitle">
					<input type="text" id="s_title" name="s_title"
						style="width: 300px; height: 30px; border-radius: 20px; border-style: none;">
					<button style="width: 50px; height: 30px; border-radius: 20px; border-style: none; background-color: yellow;">검색</button>
				</form>
			</div>
		</td>
		<td class="no_background">
			<!-- 마이페이지 --> 
			<!-- 로그인 필요 시 -->
			<div style="float: right; margin-top: 10px; margin-right: 20px;">
				<c:if test="${empty sessionScope.member_id}">
					<a href="/review/mypage/join"><img alt="REMON_LOGO"
						src="/review/movie/resources/image/REMON_Join_icon(white).png"
						style="height: 50px;"></a>
					<a href="/review/mypage/login"><img alt="REMON_LOGO"
						src="/review/movie/resources/image/REMON_Login_icon(white).png"
						style="height: 50px;"></a>
				</c:if>
			</div> 
			<!-- 로그인 했을 때 --> 
			<c:if test="${not empty sessionScope.member_id}">
			<div style="float: right; margin-right: 10px; margin-top: 10px;">
				<div style="float: left; margin-left: 10px;">
					<a href="/review/mypage/logout"><img alt="REMON_LOGO"
						src="/review/movie/resources/image/REMON_Logout_icon(white).png"
						style="height: 50px;"></a>
				</div>
				<div style="float: left; margin-left: 10px;">
					<%-- <c:if test="${empty user.member_pic}">
						<a href="/review/mypage/mypageCheck"><img alt="REMON_LOGO"
							src="/review/movie/resources/image/REMON_mypage_icon(white).png"
							style="height: 50px;"></a>
					</c:if>
					<c:if test="${not empty user.member_pic}"> --%>
						<a href="/review/mypage/mypageCheck"><img alt="REMON_LOGO"
							src="/review/movie/resources/memberImage/${user.member_pic}"
							style="height: 50px;"></a>
					<%-- </c:if> --%>
				</div>
			</div>
			</c:if>
		</td>
	</tr>
</table>
</div>
