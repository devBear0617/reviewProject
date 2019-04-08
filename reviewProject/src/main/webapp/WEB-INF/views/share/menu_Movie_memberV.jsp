<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>

</head>
<body>

<div class="return_Menu" onclick="return_Menu()">
<h3>All Items</h3>
</div>

	<div class="return_Menu" onclick="spread_Movie()">
	<h3><span style="color: #abf200;">Movie </span></h3>
	</div>
		<div class="result_Movie_recent" onclick="result_Movie_recent()">
		<h4>&nbsp; &nbsp; - Most Recent</h4>
		</div>
		<div class="result_Movie_likeV" onclick="result_Movie_likeV()">
		<h4>&nbsp; &nbsp; - Most LikeCount</h4>
		</div>
		<div class="result_Movie_gradeV" onclick="result_Movie_gradeV()">
		<h4>&nbsp; &nbsp; - Most Grade</h4>
		</div>
		<div class="result_Movie_titleContentV" onclick="result_Movie_titleContentV()">
		<h4>&nbsp; &nbsp; - Title, Content</h4>
		</div>
		<div class="result_Movie_memberV" onclick="result_Movie_memberV()">
		<h4><span style="color: #abf200;">&nbsp; &nbsp; - Member &nbsp; </span></h4>
		</div>
		<div class="result_Movie_replyV" onclick="result_Movie_replyV()">
		<h4>&nbsp; &nbsp; - Reply Content</h4>
		</div>
		<div class="result_Movie_hashtagV" onclick="result_Movie_hashtagV()">
		<h4>&nbsp; &nbsp; - Hashtag</h4>
		</div>

	<div class="spread_Game" onclick="spread_Game()">
	<h3>GAME</h3>
	</div>

	<div class="spread_TV" onclick="spread_TV()">
	<h3>TV</h3>
	</div>

</body>

</html>