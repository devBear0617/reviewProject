<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type = "text/javascript" src = "resources/script/jquery-2.1.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	data = {
		"page_num": 1
	}
	$.ajax({
		type : "POST",
		url : "./contentView",
		cache : false,
		dataType : 'html',
		data: data,
		success : function(html) {
			$(".content").append(html);
		}
	})
});

$(document).ready(function() {
	$('.moveBT').click(function(){
    	$($(this).attr("data-target")).submit();
    });
})
</script>
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
	<div class="content">	
	</div>
	
<!-- 새글쓰기 -->
<<<<<<< HEAD
<<<<<<< HEAD
	<div class = 'moveBT' data-target="#board_write">
			<form action="/review/movie/board_write" id="board_write">
				<h1>새글 작성</h1>
=======
	<div class = 'moveBT' data-target="#board_writeForm" >
			<form action="/review/movie/board_writeForm" id="board_writeForm">
				<h1>새글작성</h1>
>>>>>>> origin/bear1
			</form>
		</div>
=======
	<div class = 'moveBT' data-target="#board_write" >
		<form action="/review/movie/board_write" id="board_write">
			<input type="submit"  value="새글작성">
		</form>
	</div>
>>>>>>> 40d0463a9913e21b8972a123f895c5813490ecd7
<!-- 푸터 -->
	<div>
		<jsp:include page="../share/footer.jsp" />
	</div>

</body>
</html>