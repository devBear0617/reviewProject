<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type = "text/javascript" src = "resources/script/jquery-2.1.1.js"></script>
<script type="text/javascript">
function moreCategory(e){
	//상세한 내용은 상의 후 결정해야 함 - 테스트용
	var data = {
		'category_1': $(e).text()
	};
	
	console.log($(e).text());
	
	$.ajax ({
		type: 'POST',
		url : "./moreCategory",
		cache : false,
		dataType : 'html',
		data: data,
		success : function (html) {
			$(".category_d2").append(html);
		},
		error : function(error){
			console.log(error);
		}
	});
}
</script>
</head>
<body>
	<div class="category_1">
	<!-- 이미지로 변경 필요  / 아래는 테스트용-->
		<h1 id="c1" onclick="moreCategory(this)">카테고리 1</h1>
		<h1 id="c2" onclick="moreCategory(this)">카테고리 2</h1>
		<h1 id="c3" onclick="moreCategory(this)">카테고리 3</h1>
		<h1 id="c4" onclick="moreCategory(this)">카테고리 4</h1>
		<h1 id="c5" onclick="moreCategory(this)">카테고리 5</h1>
	</div>

	<div class="category_d2">
	</div>
</body>
</html>