<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/script/jquery-2.1.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		data = {
			"page_num" : 1
		}
		$.ajax({
			type : "POST",
			url : "./contentView",
			cache : false,
			dataType : 'html',
			data : data,
			success : function(html) {
				$(".content").append(html);
			}
		})
	});

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
<body>
	<!-- 헤더 -->
	<div>
		<jsp:include page="../share/header.jsp" />
	</div>
	<!-- 카테고리 바 -->
	<div>
		<jsp:include page="../share/category_bar.jsp" />
	</div>

	<!-- 상세 메뉴 바 -->
	<div>
		<jsp:include page="detail_bar.jsp" />
	</div>

	<!-- Best content -->
	<div>
		<jsp:include page="best_content.jsp" />
	</div>

	<!-- content -->
	<div class="center">
		<div class="content"></div>
	</div>

	<!-- 새글쓰기 -->
	<div style="float: right; margin-right: 200px;">
		<c:if test="${empty sessionScope.member_id}">
			<form action="/review/mypage/login" id="login">
				<input type="image"
					src="../resources/image/REMON_NewWrite_button.png" class='moveBT'
					data-target="#Login" style="height: 80px;">
			</form>
		</c:if>
		<c:if test="${not empty sessionScope.member_id}">
			<div class='moveBT' data-target="#board_write">
				<form action="/review/movie/movie_writeForm" id="movie_writeForm">
					<input type="image"
						src="../resources/image/REMON_NewWrite_button.png"
						style="height: 80px;">
				</form>
			</div>
		</c:if>
	</div>
	<div style="height: 20px;"></div>

	<div style="height: 20px;"></div>


	<!-- 푸터 -->
	<div>
		<jsp:include page="../share/footer.jsp" />
	</div>
</body>
</html>