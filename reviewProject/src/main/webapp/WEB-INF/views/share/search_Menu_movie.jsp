<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

function movie_menu () {
	$.ajax({
		url: '/review/search/search_Result/search_Menu_movie',
		type: 'POST',
		dataType: 'text',
		success: function (html) {
			$(".search_Menu").empty();
			$(".Search_Menu_movie").append(html);
		}
	});
};

</script>

</head>
<body>

<div class="MOVIE_menu" onclick="movie_menu">
	MOVIE v
</div>
 - Title, Content
 - Member
 - Reply Content
 - Hashtag

<br><br>

GAME

<br><br>

TV

<br><br>

</body>
</html>