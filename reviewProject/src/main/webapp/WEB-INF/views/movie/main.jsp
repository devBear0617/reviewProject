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
	
<!-- 푸터 -->
	<div>
		<jsp:include page="../share/footer.jsp" />
	</div>

</body>
</html>