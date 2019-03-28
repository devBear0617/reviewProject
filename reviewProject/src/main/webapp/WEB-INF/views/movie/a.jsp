<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
					url : "../autocomplete",
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
</head>
<body>
<form action="/review/search/searchResult" id="searchTitle">
	<input type="text" id="s_title" name="s_title"
		style="width: 300px; height: 30px; border-radius: 20px; border-style: none;">
	<button style="width: 50px; height: 30px; border-radius: 20px; border-style: none; background-color: yellow;">검색</button>
</form>
</body>
</html>