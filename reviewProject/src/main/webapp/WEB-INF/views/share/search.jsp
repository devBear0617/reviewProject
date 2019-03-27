<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					url : "./autocomplete",
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
								value : item.title,
								director : item.director,
								actor : item.actor,
								poster : item.image                                                                                         0
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
			},
			select : function(event, ui) {
				$("#movie_poster").attr("src", ui.item.poster);
				$("#movie_poster").show();
				$("#poster").val(ui.item.poster);
				$("#director").val(ui.item.director);
				$("#actor").val(ui.item.actor);
			}
		});
	}
)
</script>

<form action="/review/search/searchResult" method="POST" id="searchTitle">
	<input type="text" id="s_title" name="s_title">
	<input type="submit" value="검색">
</form>
