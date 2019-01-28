<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<div>
		<jsp:include page="content.jsp" />
	</div>
	
<!-- 푸터 -->
	<div>
		<jsp:include page="../share/footer.jsp" />
	</div>

</body>
</html>