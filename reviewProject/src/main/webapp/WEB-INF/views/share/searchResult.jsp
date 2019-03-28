<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/review/resources/script/jquery-3.3.1.min.js"></script>
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
	})
	
	// 통합 검색 결과글들
	$.ajax({
		url: '/review/search/searchResult/result_Total',
		type: 'POST',
		dataType: 'text',
		data: {
			keyword: $('.keyword').val()
		},
		success: function (html) {
			$(".result_Total").append(html);
		}
	});
	
});

function spread_Movie () {
	// 메뉴 펼치기
	$.ajax({
		url: '/review/search/searchResult/menu_Movie_V',
		type: 'GET',
		dataType: 'text',
		success: function (html) {
			$(".menu_Form").empty();
			$(".menu_Movie_memberV").empty();
			$(".menu_Movie_replyV").empty();
			$(".menu_Movie_hashtagV").empty();
			$(".menu_Movie_titleContentV").empty();
			$(".menu_Movie_gradeV").empty();
			$(".menu_Movie_V").empty();
			$(".menu_Game_V").empty();
			$(".menu_TV_V").empty();
			
			$(".menu_Movie_V").empty();
			$(".menu_Movie_V").append(html);
		}
	});
	
	// 결과 펼치기 (movie recent)
 	$.ajax({
		url: '/review/search/searchResult/result_Movie_only',
		type: 'POST',
		dataType: 'text',
		data: {
			keyword: $('.keyword').val()
		},
		success: function (html) {
			$(".result_Movie_Member").empty();
			$(".result_Movie_Reply").empty();
			$(".result_Movie_Hashtag").empty();
			$(".result_Movie_TitleContent").empty();
			$(".result_Movie_Grade").empty();
			$(".result_Total").empty();
			$(".result_Game").empty();
			$(".result_TV").empty();
			
			$(".result_Movie").empty();
			$(".result_Movie").append(html);
		}
	});
	
};

// 메뉴 덮기
function return_Menu () {
	$.ajax({
		url: '/review/search/searchResult/menu_Form',
		type: 'GET',
		dataType: 'text',
		success: function (html) {
			$(".menu_Movie_V").empty();
			$(".menu_Movie_memberV").empty();
			$(".menu_Movie_replyV").empty();
			$(".menu_Movie_hashtagV").empty();
			$(".menu_Movie_titleContentV").empty();
			$(".menu_Movie_gradeV").empty();
			$(".menu_Movie_V").empty();
			$(".menu_Game_V").empty();
			$(".menu_TV_V").empty();
			
			$(".menu_Form").empty();
			$(".menu_Form").append(html);
		}
	});
	
	// 통합 검색 결과글들
	$.ajax({
		url: '/review/search/searchResult/result_Total',
		type: 'POST',
		dataType: 'text',
		data: {
			keyword: $('.keyword').val()
		},
		success: function (html) {
			$(".result_Movie").empty();
			$(".result_Movie_Member").empty();
			$(".result_Movie_Reply").empty();
			$(".result_Movie_Hashtag").empty();
			$(".result_Movie_TitleContent").empty();
			$(".result_Movie_Grade").empty();
			$(".result_Game").empty();
			$(".result_TV").empty();
			
			$(".result_Total").empty();
			$(".result_Total").append(html);
		}
	});
};


// Movie - Most Recent (movie default)
function result_Movie_recent () {
	$.ajax({
		url: '/review/search/searchResult/menu_Movie_V',
		type: 'GET',
		dataType: 'text',
		success: function (html) {
			$(".menu_Form").empty();
			$(".menu_Movie_memberV").empty();
			$(".menu_Movie_replyV").empty();
			$(".menu_Movie_hashtagV").empty();
			$(".menu_Movie_titleContentV").empty();
			$(".menu_Movie_gradeV").empty();
			$(".menu_Game_V").empty();
			$(".menu_TV_V").empty();
			
			$(".menu_Movie_V").empty();
			$(".menu_Movie_V").append(html);
		}
	});
	
	$.ajax({
		url: '/review/search/searchResult/result_Movie_only',
		type: 'POST',
		dataType: 'text',
		data: {
			keyword: $('.keyword').val()
		},
		success: function (html) {
			$(".result_Total").empty();
			$(".result_Movie_Member").empty();
			$(".result_Movie_Reply").empty();
			$(".result_Movie_Hashtag").empty();
			$(".result_Movie_TitleContent").empty();
			$(".result_Movie_Grade").empty();
			$(".result_Game").empty();
			$(".result_TV").empty();
			
			$(".result_Movie").empty();
			$(".result_Movie").append(html);
		}
	});
};

// Movie - member search
function result_Movie_memberV () {
	$.ajax({
		url: '/review/search/searchResult/menu_Movie_memberV',
		type: 'GET',
		dataType: 'text',
		success: function (html) {
			$(".menu_Form").empty();
			$(".menu_Movie_V").empty();
			$(".menu_Movie_replyV").empty();
			$(".menu_Movie_hashtagV").empty();
			$(".menu_Movie_titleContentV").empty();
			$(".menu_Movie_gradeV").empty();
			$(".menu_Game_V").empty();
			$(".menu_TV_V").empty();
			
			$(".menu_Movie_memberV").empty();
			$(".menu_Movie_memberV").append(html);
		}
	});
	
	$.ajax({
		url: '/review/search/searchResult/result_Movie_member',
		type: 'POST',
		dataType: 'text',
		data: {
			keyword: $('.keyword').val()
		},
		success: function (html) {
			$(".result_Total").empty();
			$(".result_Movie").empty();
			$(".result_Movie_Reply").empty();
			$(".result_Movie_Hashtag").empty();
			$(".result_Movie_TitleContent").empty();
			$(".result_Movie_Grade").empty();
			$(".result_Game").empty();
			$(".result_TV").empty();
			
			$(".result_Movie_Member").empty();
			$(".result_Movie_Member").append(html);
		}
	});
};

// Movie - reply search
function result_Movie_replyV () {
	$.ajax({
		url: '/review/search/searchResult/menu_Movie_replyV',
		type: 'GET',
		dataType: 'text',
		success: function (html) {
			$(".menu_Form").empty();
			$(".menu_Movie_V").empty();
			$(".menu_Movie_memberV").empty();
			$(".menu_Movie_hashtagV").empty();
			$(".menu_Movie_titleContentV").empty();
			$(".menu_Movie_gradeV").empty();
			$(".menu_Game_V").empty();
			$(".menu_TV_V").empty();
			
			$(".menu_Movie_replyV").empty();
			$(".menu_Movie_replyV").append(html);
		}
	});
	
	$.ajax({
		url: '/review/search/searchResult/result_Movie_reply',
		type: 'POST',
		dataType: 'text',
		data: {
			keyword: $('.keyword').val()
		},
		success: function (html) {
			$(".result_Total").empty();
			$(".result_Movie").empty();
			$(".result_Movie_Member").empty();
			$(".result_Movie_Hashtag").empty();
			$(".result_Movie_TitleContent").empty();
			$(".result_Movie_Grade").empty();
			$(".result_Game").empty();
			$(".result_TV").empty();
			
			$(".result_Movie_Reply").empty();
			$(".result_Movie_Reply").append(html);
		}
	});
};

//Movie - hashtag search
function result_Movie_hashtagV () {
	$.ajax({
		url: '/review/search/searchResult/menu_Movie_hashtagV',
		type: 'GET',
		dataType: 'text',
		success: function (html) {
			$(".menu_Form").empty();
			$(".menu_Movie_V").empty();
			$(".menu_Movie_memberV").empty();
			$(".menu_Movie_replyV").empty();
			$(".menu_Movie_titleContentV").empty();
			$(".menu_Movie_gradeV").empty();
			$(".menu_Game_V").empty();
			$(".menu_TV_V").empty();
			
			$(".menu_Movie_hashtagV").empty();
			$(".menu_Movie_hashtagV").append(html);
		}
	});
	
	$.ajax({
		url: '/review/search/searchResult/result_Movie_hashtag',
		type: 'POST',
		dataType: 'text',
		data: {
			keyword: $('.keyword').val()
		},
		success: function (html) {
			$(".result_Total").empty();
			$(".result_Movie").empty();
			$(".result_Movie_Member").empty();
			$(".result_Movie_Reply").empty();
			$(".result_Movie_TitleContent").empty();
			$(".result_Movie_Grade").empty();
			$(".result_Game").empty();
			$(".result_TV").empty();
			
			$(".result_Movie_Hashtag").empty();
			$(".result_Movie_Hashtag").append(html);
		}
	});
};

//Movie - titleContent search
function result_Movie_titleContentV () {
	$.ajax({
		url: '/review/search/searchResult/menu_Movie_titleContentV',
		type: 'GET',
		dataType: 'text',
		success: function (html) {
			$(".menu_Form").empty();
			$(".menu_Movie_V").empty();
			$(".menu_Movie_memberV").empty();
			$(".menu_Movie_replyV").empty();
			$(".menu_Movie_hashtagV").empty();
			$(".menu_Movie_gradeV").empty();
			$(".menu_Game_V").empty();
			$(".menu_TV_V").empty();
			
			$(".menu_Movie_titleContentV").empty();
			$(".menu_Movie_titleContentV").append(html);
		}
	});
	
	$.ajax({
		url: '/review/search/searchResult/result_Movie_hashtag',
		type: 'POST',
		dataType: 'text',
		data: {
			keyword: $('.keyword').val()
		},
		success: function (html) {
			$(".result_Total").empty();
			$(".result_Movie").empty();
			$(".result_Movie_Member").empty();
			$(".result_Movie_Reply").empty();
			$(".result_Movie_Hashtag").empty();
			$(".result_Movie_Grade").empty();
			$(".result_Game").empty();
			$(".result_TV").empty();
			
			$(".result_Movie_TitleContent").empty();
			$(".result_Movie_TitleContent").append(html);
		}
	});
};

//Movie - grade desc
function result_Movie_gradeV () {
	$.ajax({
		url: '/review/search/searchResult/menu_Movie_gradeV',
		type: 'GET',
		dataType: 'text',
		success: function (html) {
			$(".menu_Form").empty();
			$(".menu_Movie_V").empty();
			$(".menu_Movie_memberV").empty();
			$(".menu_Movie_replyV").empty();
			$(".menu_Movie_hashtagV").empty();
			$(".menu_Movie_titleContentV").empty();
			$(".menu_Game_V").empty();
			$(".menu_TV_V").empty();
			
			$(".menu_Movie_gradeV").empty();
			$(".menu_Movie_gradeV").append(html);
		}
	});
	
	$.ajax({
		url: '/review/search/searchResult/result_Movie_grade',
		type: 'POST',
		dataType: 'text',
		data: {
			keyword: $('.keyword').val()
		},
		success: function (html) {
			$(".result_Total").empty();
			$(".result_Movie").empty();
			$(".result_Movie_Member").empty();
			$(".result_Movie_Reply").empty();
			$(".result_Movie_Hashtag").empty();
			$(".result_Movie_TitleContent").empty();
			$(".result_Game").empty();
			$(".result_TV").empty();
			
			$(".result_Movie_Grade").empty();
			$(".result_Movie_Grade").append(html);
		}
	});
};

function spread_Game () {
	// 메뉴 펼치기
	$.ajax({
		url: '/review/search/searchResult/menu_Game_V',
		type: 'GET',
		dataType: 'text',
		success: function (html) {
			$(".menu_Form").empty();
			$(".menu_Movie_memberV").empty();
			$(".menu_Movie_replyV").empty();
			$(".menu_Movie_hashtagV").empty();
			$(".menu_Movie_titleContentV").empty();
			$(".menu_Movie_gradeV").empty();
			$(".menu_Movie_V").empty();
			$(".menu_TV_V").empty();
			$(".menu_Movie_V").empty();
			
			$(".menu_Game_V").empty();
			$(".menu_Game_V").append(html);
		}
	});
	
	// 결과 펼치기 (movie recent)
 	$.ajax({
		url: '/review/search/searchResult/result_Game_only',
		type: 'POST',
		dataType: 'text',
		data: {
			keyword: $('.keyword').val()
		},
		success: function (html) {
			$(".result_Movie_Member").empty();
			$(".result_Movie_Reply").empty();
			$(".result_Movie_Hashtag").empty();
			$(".result_Movie_TitleContent").empty();
			$(".result_Movie_Grade").empty();
			$(".result_Total").empty();
			$(".result_Movie").empty();
			$(".result_TV").empty();
			
			$(".result_Game").empty();
			$(".result_Game").append(html);
		}
	});
	
};

function spread_Game () {
	// 메뉴 펼치기
	$.ajax({
		url: '/review/search/searchResult/menu_TV_V',
		type: 'GET',
		dataType: 'text',
		success: function (html) {
			$(".menu_Form").empty();
			$(".menu_Movie_memberV").empty();
			$(".menu_Movie_replyV").empty();
			$(".menu_Movie_hashtagV").empty();
			$(".menu_Movie_titleContentV").empty();
			$(".menu_Movie_gradeV").empty();
			$(".menu_Movie_V").empty();
			$(".menu_Movie_V").empty();
			$(".menu_Game_V").empty();
			
			$(".menu_TV_V").empty();
			$(".menu_TV_V").append(html);
		}
	});
	
	// 결과 펼치기 (movie recent)
 	$.ajax({
		url: '/review/search/searchResult/result_TV_only',
		type: 'POST',
		dataType: 'text',
		data: {
			keyword: $('.keyword').val()
		},
		success: function (html) {
			$(".result_Movie_Member").empty();
			$(".result_Movie_Reply").empty();
			$(".result_Movie_Hashtag").empty();
			$(".result_Movie_TitleContent").empty();
			$(".result_Movie_Grade").empty();
			$(".result_Total").empty();
			$(".result_Movie").empty();
			$(".result_Game").empty();
			
			$(".result_TV").empty();
			$(".result_TV").append(html);
		}
	});
	
};

</script>

</head>
<body>

<h1>검색결과</h1>

<form action="/review/search/searchResult" method="POST" id="search">
재검색 : <input type="text" name="keyword">&nbsp; &nbsp;<input type="submit" value="검색">
</form>

<br>

검색 Keyword : " ${keyword} "
<input type="hidden" value="${keyword}" class="keyword">
	
<br>

<div id="con">
	<div id="menu" style="background-color:yellow; width:200px; float:left">
		<h2>검색메뉴</h2>
			
		<div class="menu_Form"></div>
			<div class="menu_Movie_V"></div>
				<div class="menu_Movie_memberV"></div>
				<div class="menu_Movie_replyV"></div>
				<div class="menu_Movie_hashtagV"></div>
				<div class="menu_Movie_titleContentV"></div>
				<div class="menu_Movie_gradeV"></div>
			<div class="menu_Game_V"></div>
			<div class="menu_TV_V"></div>
			
	</div>

	<div id="content" style="background-color:gray; width:500px; float:left;">
		
		<div class="result_Total"></div>
			<div class="result_Movie"></div>
				<div class="result_Movie_Member"></div>
				<div class="result_Movie_Reply"></div>
				<div class="result_Movie_Hashtag"></div>
				<div class="result_Movie_TitleContent"></div>
				<div class="result_Movie_Grade"></div>
			<div class="result_Game"></div>
			<div class="result_TV"></div>
		
	</div>
		
		
	<div id="home" style="clear:both;">
		<br><br><a href="/review">홈</a>
	</div>
	
</div>


</body>
</html>