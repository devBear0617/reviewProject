<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
			type : "GET",
			url : "/review/mypage/alreadyWritten/alreadyWritten_menuBoard",
			dataType : 'html',
			success : function(html) {
				$(".alreadyWritten_menuBoard").append(html);
			}
		})

	$.ajax({
		type : "GET",
		url : "/review/mypage/alreadyWritten/alreadyWritten_Board",
		data: {"pnum":1},
		dataType : 'html',
		success : function(html) {
			$(".alreadyWritten_Board").append(html);
		}
	})
	
});	

function already_Reply () {
	$.ajax({
		type : "GET",
		url : "/review/mypage/alreadyWritten/alreadyWritten_menuReply",
		dataType : 'html',
		success : function(html) {
			$(".alreadyWritten_menuBoard").empty();
			$(".alreadyWritten_menuLike").empty();
			$(".alreadyWritten_menuReply").empty();
			
			$(".alreadyWritten_menuReply").append(html);
		}
	});
	
	$.ajax({
		type : "GET",
		url : "/review/mypage/alreadyWritten/alreadyWritten_Reply",
		data: {"pnum":1},
		dataType : 'html',
		success : function(html) {
			$(".alreadyWritten_Board").empty();
			$(".alreadyWritten_Like").empty();
			$(".alreadyWritten_Reply").empty();
			
			$(".alreadyWritten_Reply").append(html);
		}
	});
};

function already_Like () {
	$.ajax({
		type : "GET",
		url : "/review/mypage/alreadyWritten/alreadyWritten_menuLike",
		dataType : 'html',
		success : function(html) {
			$(".alreadyWritten_menuBoard").empty();
			$(".alreadyWritten_menuReply").empty();
			$(".alreadyWritten_menuLike").empty();
			
			$(".alreadyWritten_menuLike").append(html);
		}
	});
	
	$.ajax({
		type : "GET",
		url : "/review/mypage/alreadyWritten/alreadyWritten_Like",
		data: {"pnum":1},
		dataType : 'html',
		success : function(html) {
			$(".alreadyWritten_Board").empty();
			$(".alreadyWritten_Reply").empty();
			$(".alreadyWritten_Like").empty();
			
			$(".alreadyWritten_Like").append(html);
		}
	});
};

function already_Board() {
	$.ajax({
			type : "GET",
			url : "/review/mypage/alreadyWritten/alreadyWritten_menuBoard",
			dataType : 'html',
			success : function(html) {
				$(".alreadyWritten_menuReply").empty();
				$(".alreadyWritten_menuLike").empty();
				$(".alreadyWritten_menuBoard").empty();

				$(".alreadyWritten_menuBoard").append(html);
			}
		});
	$.ajax({
			type : "GET",
			url : "/review/mypage/alreadyWritten/alreadyWritten_Board",
			data: {"pnum":1},
			dataType : 'html',
			success : function(html) {
				$(".alreadyWritten_Reply").empty();
				$(".alreadyWritten_Like").empty();
				$(".alreadyWritten_Board").empty();
				
				$(".alreadyWritten_Board").append(html);
			}
	});
};
		
</script>

<style type="text/css">
.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.mytitle {
	background: linear-gradient(to left, #ffe400, #abf200);
	height: 50px;
	color: white;
}
</style>
</head>
<jsp:include page="/WEB-INF/views/share/Login_header.jsp" />
<body>
	<div class="center">
		<div style="height: 50px;"></div>
		<div>
			<h2>${user.member_id}님의기록</h2>
		</div>
		<hr width="1100px;">
		<div class="center">
			<div id="con" style="display: inline-block;">
				<div id="menu"
					style="background: #F2F2F2; width: 200px; float: left">
					<h2>메뉴</h2>

					<div class="alreadyWritten_menuBoard"></div>
					<div class="alreadyWritten_menuReply"></div>
					<div class="alreadyWritten_menuLike"></div>

				</div>

				<div id="content" style="width: 900px; float: left;">

					<div class="alreadyWritten_Board"></div>
					<div class="alreadyWritten_Reply"></div>
					<div class="alreadyWritten_Like"></div>

				</div>
			</div>	
		</div>
		<div style="height: 100px;"></div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/share/footer.jsp" />
</html>