<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	// 최초
	$(document).ready(function() {
		// 메뉴
		$.ajax({
			type : "GET",
			url : "/review/search/searchResult/menu_Form",
			dataType : 'html',
			success : function(html) {
				$(".menu_Form").append(html);
			}
		});

		// 통합 검색 결과글들
		$.ajax({
			url : '/review/search/searchResult/result_Total',
			type : 'POST',
			dataType : 'text',
			data : {
				keyword : $('.keyword').val()
			},
			success : function(html) {
				$(".result_Total").append(html);
			}
		});

	});

	function spread_Movie() {
		// 메뉴 펼치기
		$.ajax({
			url : '/review/search/searchResult/menu_Movie_V',
			type : 'GET',
			dataType : 'text',
			success : function(html) {
				$(".menu_Form").empty();
				$(".menu_Movie_memberV").empty();
				$(".menu_Movie_replyV").empty();
				$(".menu_Movie_hashtagV").empty();
				$(".menu_Movie_titleContentV").empty();
				$(".menu_Movie_gradeV").empty();
				$(".menu_Movie_likeV").empty();
				$(".menu_Game_V").empty();
				$(".menu_TV_V").empty();

				$(".menu_Movie_V").empty();
				$(".menu_Movie_V").append(html);
			}
		});

		// 결과 펼치기 (movie recent)
		$.ajax({
			url : '/review/search/searchResult/result_Movie_only',
			type : 'POST',
			dataType : 'text',
			data : {
				keyword : $('.keyword').val()
			},
			success : function(html) {
				$(".result_Movie_Member").empty();
				$(".result_Movie_Reply").empty();
				$(".result_Movie_Hashtag").empty();
				$(".result_Movie_TitleContent").empty();
				$(".result_Movie_Grade").empty();
				$(".result_Movie_Like").empty();
				$(".result_Total").empty();
				$(".result_Game").empty();
				$(".result_TV").empty();

				$(".result_Movie").empty();
				$(".result_Movie").append(html);
			}
		});

	};

	// 메뉴 덮기
	function return_Menu() {
		$.ajax({
			url : '/review/search/searchResult/menu_Form',
			type : 'GET',
			dataType : 'text',
			success : function(html) {
				$(".menu_Movie_memberV").empty();
				$(".menu_Movie_replyV").empty();
				$(".menu_Movie_hashtagV").empty();
				$(".menu_Movie_titleContentV").empty();
				$(".menu_Movie_gradeV").empty();
				$(".menu_Movie_likeV").empty();
				$(".menu_Movie_V").empty();
				$(".menu_Game_V").empty();
				$(".menu_TV_V").empty();

				$(".menu_Form").empty();
				$(".menu_Form").append(html);
			}
		});

		// 통합 검색 결과글들
		$.ajax({
			url : '/review/search/searchResult/result_Total',
			type : 'POST',
			dataType : 'text',
			data : {
				keyword : $('.keyword').val()
			},
			success : function(html) {
				$(".result_Movie").empty();
				$(".result_Movie_Member").empty();
				$(".result_Movie_Reply").empty();
				$(".result_Movie_Hashtag").empty();
				$(".result_Movie_TitleContent").empty();
				$(".result_Movie_Grade").empty();
				$(".result_Movie_Like").empty();
				$(".result_Game").empty();
				$(".result_TV").empty();

				$(".result_Total").empty();
				$(".result_Total").append(html);
			}
		});
	};

	// Movie - Most Recent (movie default)
	function result_Movie_recent() {
		$.ajax({
			url : '/review/search/searchResult/menu_Movie_V',
			type : 'GET',
			dataType : 'text',
			success : function(html) {
				$(".menu_Form").empty();
				$(".menu_Movie_memberV").empty();
				$(".menu_Movie_replyV").empty();
				$(".menu_Movie_hashtagV").empty();
				$(".menu_Movie_titleContentV").empty();
				$(".menu_Movie_gradeV").empty();
				$(".menu_Movie_likeV").empty();
				$(".menu_Game_V").empty();
				$(".menu_TV_V").empty();

				$(".menu_Movie_V").empty();
				$(".menu_Movie_V").append(html);
			}
		});

		$.ajax({
			url : '/review/search/searchResult/result_Movie_only',
			type : 'POST',
			dataType : 'text',
			data : {
				keyword : $('.keyword').val()
			},
			success : function(html) {
				$(".result_Total").empty();
				$(".result_Movie_Member").empty();
				$(".result_Movie_Reply").empty();
				$(".result_Movie_Hashtag").empty();
				$(".result_Movie_TitleContent").empty();
				$(".result_Movie_Grade").empty();
				$(".result_Movie_Like").empty();
				$(".result_Game").empty();
				$(".result_TV").empty();

				$(".result_Movie").empty();
				$(".result_Movie").append(html);
			}
		});
	};

	// Movie - member search
	function result_Movie_memberV() {
		$.ajax({
			url : '/review/search/searchResult/menu_Movie_memberV',
			type : 'GET',
			dataType : 'text',
			success : function(html) {
				$(".menu_Form").empty();
				$(".menu_Movie_V").empty();
				$(".menu_Movie_replyV").empty();
				$(".menu_Movie_hashtagV").empty();
				$(".menu_Movie_titleContentV").empty();
				$(".menu_Movie_gradeV").empty();
				$(".menu_Movie_likeV").empty();
				$(".menu_Game_V").empty();
				$(".menu_TV_V").empty();

				$(".menu_Movie_memberV").empty();
				$(".menu_Movie_memberV").append(html);
			}
		});

		$.ajax({
			url : '/review/search/searchResult/result_Movie_member',
			type : 'POST',
			dataType : 'text',
			data : {
				keyword : $('.keyword').val()
			},
			success : function(html) {
				$(".result_Total").empty();
				$(".result_Movie").empty();
				$(".result_Movie_Reply").empty();
				$(".result_Movie_Hashtag").empty();
				$(".result_Movie_TitleContent").empty();
				$(".result_Movie_Grade").empty();
				$(".result_Movie_Like").empty();
				$(".result_Game").empty();
				$(".result_TV").empty();

				$(".result_Movie_Member").empty();
				$(".result_Movie_Member").append(html);
			}
		});
	};

	// Movie - reply search
	function result_Movie_replyV() {
		$.ajax({
			url : '/review/search/searchResult/menu_Movie_replyV',
			type : 'GET',
			dataType : 'text',
			success : function(html) {
				$(".menu_Form").empty();
				$(".menu_Movie_V").empty();
				$(".menu_Movie_memberV").empty();
				$(".menu_Movie_hashtagV").empty();
				$(".menu_Movie_titleContentV").empty();
				$(".menu_Movie_gradeV").empty();
				$(".menu_Movie_likeV").empty();
				$(".menu_Game_V").empty();
				$(".menu_TV_V").empty();

				$(".menu_Movie_replyV").empty();
				$(".menu_Movie_replyV").append(html);
			}
		});

		$.ajax({
			url : '/review/search/searchResult/result_Movie_reply',
			type : 'POST',
			dataType : 'text',
			data : {
				keyword : $('.keyword').val()
			},
			success : function(html) {
				$(".result_Total").empty();
				$(".result_Movie").empty();
				$(".result_Movie_Member").empty();
				$(".result_Movie_Hashtag").empty();
				$(".result_Movie_TitleContent").empty();
				$(".result_Movie_Grade").empty();
				$(".result_Movie_Like").empty();
				$(".result_Game").empty();
				$(".result_TV").empty();

				$(".result_Movie_Reply").empty();
				$(".result_Movie_Reply").append(html);
			}
		});
	};

	//Movie - hashtag search
	function result_Movie_hashtagV() {
		$.ajax({
			url : '/review/search/searchResult/menu_Movie_hashtagV',
			type : 'GET',
			dataType : 'text',
			success : function(html) {
				$(".menu_Form").empty();
				$(".menu_Movie_V").empty();
				$(".menu_Movie_memberV").empty();
				$(".menu_Movie_replyV").empty();
				$(".menu_Movie_titleContentV").empty();
				$(".menu_Movie_gradeV").empty();
				$(".menu_Movie_likeV").empty();
				$(".menu_Game_V").empty();
				$(".menu_TV_V").empty();

				$(".menu_Movie_hashtagV").empty();
				$(".menu_Movie_hashtagV").append(html);
			}
		});

		$.ajax({
			url : '/review/search/searchResult/result_Movie_hashtag',
			type : 'POST',
			dataType : 'text',
			data : {
				keyword : $('.keyword').val()
			},
			success : function(html) {
				$(".result_Total").empty();
				$(".result_Movie").empty();
				$(".result_Movie_Member").empty();
				$(".result_Movie_Reply").empty();
				$(".result_Movie_TitleContent").empty();
				$(".result_Movie_Grade").empty();
				$(".result_Movie_Like").empty();
				$(".result_Game").empty();
				$(".result_TV").empty();

				$(".result_Movie_Hashtag").empty();
				$(".result_Movie_Hashtag").append(html);
			}
		});
	};

	//Movie - titleContent search
	function result_Movie_titleContentV() {
		$.ajax({
			url : '/review/search/searchResult/menu_Movie_titleContentV',
			type : 'GET',
			dataType : 'text',
			success : function(html) {
				$(".menu_Form").empty();
				$(".menu_Movie_V").empty();
				$(".menu_Movie_memberV").empty();
				$(".menu_Movie_replyV").empty();
				$(".menu_Movie_hashtagV").empty();
				$(".menu_Movie_gradeV").empty();
				$(".menu_Movie_likeV").empty();
				$(".menu_Game_V").empty();
				$(".menu_TV_V").empty();

				$(".menu_Movie_titleContentV").empty();
				$(".menu_Movie_titleContentV").append(html);
			}
		});

		$.ajax({
			url : '/review/search/searchResult/result_Movie_hashtag',
			type : 'POST',
			dataType : 'text',
			data : {
				keyword : $('.keyword').val()
			},
			success : function(html) {
				$(".result_Total").empty();
				$(".result_Movie").empty();
				$(".result_Movie_Member").empty();
				$(".result_Movie_Reply").empty();
				$(".result_Movie_Hashtag").empty();
				$(".result_Movie_Grade").empty();
				$(".result_Movie_Like").empty();
				$(".result_Game").empty();
				$(".result_TV").empty();

				$(".result_Movie_TitleContent").empty();
				$(".result_Movie_TitleContent").append(html);
			}
		});
	};

	//Movie - grade desc
	function result_Movie_gradeV() {
		$.ajax({
			url : '/review/search/searchResult/menu_Movie_gradeV',
			type : 'GET',
			dataType : 'text',
			success : function(html) {
				$(".menu_Form").empty();
				$(".menu_Movie_V").empty();
				$(".menu_Movie_memberV").empty();
				$(".menu_Movie_replyV").empty();
				$(".menu_Movie_hashtagV").empty();
				$(".menu_Movie_titleContentV").empty();
				$(".menu_Movie_likeV").empty();
				$(".menu_Game_V").empty();
				$(".menu_TV_V").empty();

				$(".menu_Movie_gradeV").empty();
				$(".menu_Movie_gradeV").append(html);
			}
		});

		$.ajax({
			url : '/review/search/searchResult/result_Movie_grade',
			type : 'POST',
			dataType : 'text',
			data : {
				keyword : $('.keyword').val()
			},
			success : function(html) {
				$(".result_Total").empty();
				$(".result_Movie").empty();
				$(".result_Movie_Member").empty();
				$(".result_Movie_Reply").empty();
				$(".result_Movie_Hashtag").empty();
				$(".result_Movie_TitleContent").empty();
				$(".result_Movie_Like").empty();
				$(".result_Game").empty();
				$(".result_TV").empty();

				$(".result_Movie_Grade").empty();
				$(".result_Movie_Grade").append(html);
			}
		});
	};

	//Movie - like desc
	function result_Movie_likeV() {
		$.ajax({
			url : '/review/search/searchResult/menu_Movie_likeV',
			type : 'GET',
			dataType : 'text',
			success : function(html) {
				$(".menu_Form").empty();
				$(".menu_Movie_V").empty();
				$(".menu_Movie_memberV").empty();
				$(".menu_Movie_replyV").empty();
				$(".menu_Movie_hashtagV").empty();
				$(".menu_Movie_titleContentV").empty();
				$(".menu_Movie_gradeV").empty();
				$(".menu_Game_V").empty();
				$(".menu_TV_V").empty();

				$(".menu_Movie_likeV").empty();
				$(".menu_Movie_likeV").append(html);
			}
		});

		$.ajax({
			url : '/review/search/searchResult/result_Movie_like',
			type : 'POST',
			dataType : 'text',
			data : {
				keyword : $('.keyword').val()
			},
			success : function(html) {
				$(".result_Total").empty();
				$(".result_Movie").empty();
				$(".result_Movie_Member").empty();
				$(".result_Movie_Reply").empty();
				$(".result_Movie_Hashtag").empty();
				$(".result_Movie_TitleContent").empty();
				$(".result_Movie_Grade").empty();
				$(".result_Movie_Like").empty();
				$(".result_Game").empty();
				$(".result_TV").empty();

				$(".result_Movie_Like").empty();
				$(".result_Movie_Like").append(html);
			}
		});
	};

	function spread_Game() {
		// 메뉴 펼치기
		$.ajax({
			url : '/review/search/searchResult/menu_Game_V',
			type : 'GET',
			dataType : 'text',
			success : function(html) {
				$(".menu_Form").empty();
				$(".menu_Movie_memberV").empty();
				$(".menu_Movie_replyV").empty();
				$(".menu_Movie_hashtagV").empty();
				$(".menu_Movie_titleContentV").empty();
				$(".menu_Movie_gradeV").empty();
				$(".menu_Movie_likeV").empty();
				$(".menu_Movie_V").empty();
				$(".menu_TV_V").empty();

				$(".menu_Game_V").empty();
				$(".menu_Game_V").append(html);
			}
		});

		// 결과 펼치기 (game recent)
		$.ajax({
			url : '/review/search/searchResult/result_Game_only',
			type : 'POST',
			dataType : 'text',
			data : {
				keyword : $('.keyword').val()
			},
			success : function(html) {
				$(".result_Movie_Member").empty();
				$(".result_Movie_Reply").empty();
				$(".result_Movie_Hashtag").empty();
				$(".result_Movie_TitleContent").empty();
				$(".result_Movie_Grade").empty();
				$(".result_Movie_Like").empty();
				$(".result_Total").empty();
				$(".result_Movie").empty();
				$(".result_TV").empty();

				$(".result_Game").empty();
				$(".result_Game").append(html);
			}
		});

	};

	function spread_TV() {
		// 메뉴 펼치기
		$.ajax({
			url : '/review/search/searchResult/menu_TV_V',
			type : 'GET',
			dataType : 'text',
			success : function(html) {
				$(".menu_Form").empty();
				$(".menu_Movie_memberV").empty();
				$(".menu_Movie_replyV").empty();
				$(".menu_Movie_hashtagV").empty();
				$(".menu_Movie_titleContentV").empty();
				$(".menu_Movie_gradeV").empty();
				$(".menu_Movie_likeV").empty();
				$(".menu_Movie_V").empty();
				$(".menu_Game_V").empty();

				$(".menu_TV_V").empty();
				$(".menu_TV_V").append(html);
			}
		});

		// 결과 펼치기 (tv recent)
		$.ajax({
			url : '/review/search/searchResult/result_TV_only',
			type : 'POST',
			dataType : 'text',
			data : {
				keyword : $('.keyword').val()
			},
			success : function(html) {
				$(".result_Movie_Member").empty();
				$(".result_Movie_Reply").empty();
				$(".result_Movie_Hashtag").empty();
				$(".result_Movie_TitleContent").empty();
				$(".result_Movie_Grade").empty();
				$(".result_Movie_Like").empty();
				$(".result_Total").empty();
				$(".result_Movie").empty();
				$(".result_Game").empty();

				$(".result_TV").empty();
				$(".result_TV").append(html);
			}
		});

	};
</script>

<style type="text/css">
input:focus {
<<<<<<< HEAD
	outline: none;
}

.center {
	margin-left: auto;
	margin-right: auto;
}

.btn_st1 {
	margin-left: auto;
	margin-right: auto;
	background-image: url('../resources/image/REMON_smallbar.png');
	color: white;
	width: 300px;
	height: 30px;
	border-radius: 10px;
	border-style: none;
}
=======
	outline:none;
	}
	
>>>>>>> 22b86f20b15b55fa709470db1a69653ae21df62e
</style>

</head>
<jsp:include page="/WEB-INF/views/share/Main_header.jsp" />
<body>
	<div style="height: 100px;"></div>
	<div>
		<!-- 헤더 -->
		<div class="center">
			<!-- 상단바, 로고 -->
			<div class="center">
				<a href="/review"><img alt="REMON_LOGO"
					src="../resources/image/REMON_logo(bigsize).png"
					style="width: 200px;"></a>
			</div>
			<br>

			<!-- 검색 바 -->
			<div class="center"
				style="width: 600px; height: 60px; background-image: url('../resources/image/REMON_search_bar.png'); border-style: none;">
				<form action="/review/search/searchResult" method="POST" id="search"
					style="padding-top: 15px;">
					<input type="text" name="keyword" value="${keyword}"
						style="width: 450px; height: 30px; border-style: none;"><input
						type="hidden" value="${keyword}" class="keyword">&nbsp;
					&nbsp;<input type="submit" value="검색"
						style="border-style: none; background: none;">
				</form>
			</div>
		</div>

	</div>
	<div class="center">
		<%--<form action="/review/search/searchResult" method="POST" id="search">
			재검색 : <input type="text" name="keyword" value="${keyword}"><input
				type="hidden" value="${keyword}" class="keyword">&nbsp;
			&nbsp;<input type="submit" value="검색">
		</form> --%>
		<br>
		<div class="center">
			<div id="con" style="display: inline-block;">
				<div id="menu"
					style="background-color: #F2F2F2; width: 300px; float: left">
					<h2>검색메뉴</h2>

					<div class="menu_Form"></div>
					<div class="menu_Movie_V"></div>
					<div class="menu_Movie_memberV"></div>
					<div class="menu_Movie_replyV"></div>
					<div class="menu_Movie_hashtagV"></div>
					<div class="menu_Movie_titleContentV"></div>
					<div class="menu_Movie_gradeV"></div>
					<div class="menu_Movie_likeV"></div>
					<div class="menu_Game_V"></div>
					<div class="menu_TV_V"></div>

				</div>

				<div id="content"
					style="background: linear-gradient(to right, #abf200, #ffe400);; width: 900px; float: left;">

					<div class="result_Total"></div>
					<div class="result_Movie"></div>
					<div class="result_Movie_Member"></div>
					<div class="result_Movie_Reply"></div>
					<div class="result_Movie_Hashtag"></div>
					<div class="result_Movie_TitleContent"></div>
					<div class="result_Movie_Grade"></div>
					<div class="result_Movie_Like"></div>
					<div class="result_Game"></div>
					<div class="result_TV"></div>

				</div>

				<div id="home" style="clear: both;">
					<br> <br>
					<div class="btn_st1">
						<a href="/review"
							style="text-decoration: none; color: white; font-weight: bold;">HOME</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<jsp:include page="/WEB-INF/views/share/footer.jsp" />
	</div>
</body>
</html>