<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

/* function spread_Movie () {
	$.ajax({
		url: '/review/search/searchResult/menu_Movie_V',
		type: 'GET',
		dataType: 'text',
		success: function (html) {
			$(".menu_Movie").empty();
			$(".menu_Movie_V").append(html);
		}
	});
}; */

</script>

</head>
<body>

<h3>All Items &nbsp; <span style="color:red">v</span></h3>

	<div class="spread_Movie" onclick="spread_Movie()">
	<h3>Movie</h3>
	</div>

	<div class="spread_Game" onclick="spread_Game()">
	<h3>GAME</h3>
	</div>

	<div class="spread_TV" onclick="spread_TV()">
	<h3>TV</h3>
	</div>

</body>
</html>