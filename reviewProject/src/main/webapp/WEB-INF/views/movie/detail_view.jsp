<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/script/jquery-2.1.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		data = {
			"page_num" : 1
		}
		$.ajax({
			type : "POST",
			url : "./contentView",
			cache : false,
			dataType : 'html',
			data : data,
			success : function(html) {
				$(".content").append(html);
			}
		})
	});

	$(document).ready(function() {
		$('.moveBT').click(function() {
			$($(this).attr("data-target")).submit();
		});
	})
</script>
<style type="text/css">
.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.center_txtnon {
	margin-left: auto;
	margin-right: auto;
}

.hashtag {
	height: 20px;
	width: 100px;
	background-color: white;
	border-radius: 5px;
	text-align: center;
}

.imgform {
	width: 40px;
}
</style>
</head>
<body>
	<!-- header -->
	<div>
		<jsp:include page="../share/header.jsp" />
	</div>
	<!-- category -->
	<div>
		<jsp:include page="../share/category_bar.jsp" />
	</div>
	<!-- 유저프로필, 유저ID, 제목 바 ( O 유저ID | 리뷰 제목              | 날짜 ) -->
	<div class="center" style="background-color: #F2F2F2; height: 50px;">
		<%-- 
		<span>${board.memberVO.member_pic}</span> 
		<span>${board.memberVO.member_name}</span>
		--%>
		<span>유저ID: ${board.member_id}</span>&nbsp;&nbsp;&nbsp; <span>|&nbsp;&nbsp;&nbsp;리뷰
			제목: ${board.board_title}</span>&nbsp;&nbsp;&nbsp; <span>|&nbsp;&nbsp;&nbsp;날짜
			: <fmt:formatDate value="${board.board_date}"
				pattern="yyyy-MM-dd hh:mm" />
		</span>
	</div>

	<!-- 이미지, 평점(추천합니다/안합니다), 상세별점, 리뷰의 좋아요, #  -->
	<div class="center" style="background-color: #F2F2F2">

		<table class="center">
			<tr style="height: 300px;">
				<td style="background-color: #FFFF00;"><div>이미지</div></td>
				<td>
					<table>
						<tr>
							<td>평점. <br> ${board.lemon_grade}% 의 <br> <c:choose>
									<c:when test="${board.lemon_grade < 50}">'덜 익은'</c:when>
									<c:when test="${board.lemon_grade > 51}">'잘 익은'</c:when>
									<c:otherwise>상품 가치 없는</c:otherwise>
								</c:choose> 레몬
							</td>
						</tr>
						<tr>
							<td><c:choose>
									<c:when test="${board.recommend == 1}">
								이 영화를 추천 합니다.
							</c:when>
									<c:otherwise>
								이 영화를 추천하지 않습니다.
							</c:otherwise>
								</c:choose></td>
						</tr>
					</table>
				</td>
				<td style="border-left: 1px solid gray;">개별점수. <br>
					${board.gradeVO.grade_name1} : ${board.gradeVO.grade1} <br>
					${board.gradeVO.grade_name2} : ${board.gradeVO.grade2} <br>
					${board.gradeVO.grade_name3} : ${board.gradeVO.grade3} <br>
					${board.gradeVO.grade_name4} : ${board.gradeVO.grade4} <br></td>

			</tr>
		</table>

		<%-- 	<!-- 이미지 -->
		<div style="background-color: #FFFF00;">이미지</div>

		<!-- 전체평점, 상세평점 (레몬으로) -->
		<div style="background-color: #F2F2F2;">
			<br> <br>
			<table class="center" style="border: 1px solid white;">
				<tr>
					<td>
						<table>
							<tr>
								<td>평점. <br> ${board.lemon_grade}% 의 <br> <c:choose>
										<c:when test="${board.lemon_grade < 50}">'덜 익은'</c:when>
										<c:when test="${board.lemon_grade > 51}">'잘 익은'</c:when>
										<c:otherwise>상품 가치 없는</c:otherwise>
									</c:choose> 레몬
								</td>
							</tr>
							<tr>
								<td><c:choose>
										<c:when test="${board.recommend == 1}">
								이 영화를 추천 합니다.
							</c:when>
										<c:otherwise>
								이 영화를 추천하지 않습니다.
							</c:otherwise>
									</c:choose></td>
							</tr>
						</table>
					</td>

					<td>개별점수. <br> ${board.gradeVO.grade_name1} :
						${board.gradeVO.grade1} <br> ${board.gradeVO.grade_name2} :
						${board.gradeVO.grade2} <br> ${board.gradeVO.grade_name3} :
						${board.gradeVO.grade3} <br> ${board.gradeVO.grade_name4} :
						${board.gradeVO.grade4} <br>
					</td>
				</tr>
			</table>
			<br> <br>
		</div> --%>

		<!-- 좋아요 , 덧글 수 -->
		<br>
		<table class="center">
			<tr>
				<td><div style="text-align: left; padding-left: 10px;">
						<img alt="likeit" src="../resources/image/REMON_like_icon.png"
							class="imgform"> <span>100</span>
						<c:forEach items="${board.likeList}" var="like">
							<span>작성자 : ${like.member_id}, ${like.likeit} </span>
							<br>
						</c:forEach>
						<img alt="reply" src="../resources/image/REMON_comment_icon.png"
							class="imgform"> <span>7</span>
					</div></td>
				<td></td>
				<td><div style="text-align: right; padding-right: 10px;">
						<br> <span class="hashtag">#${board.hashtagVO.hashtag1}</span>&nbsp;&nbsp;&nbsp;
						<span class="hashtag"># ${board.hashtagVO.hashtag2}</span>&nbsp;&nbsp;&nbsp;
						<span class="hashtag"># ${board.hashtagVO.hashtag3}</span>&nbsp;&nbsp;&nbsp;
						<span class="hashtag"># ${board.hashtagVO.hashtag4}</span>&nbsp;&nbsp;&nbsp;
						<span class="hashtag"># ${board.hashtagVO.hashtag5}</span>&nbsp;&nbsp;&nbsp;
						<span class="hashtag"># ${board.hashtagVO.hashtag6}</span>&nbsp;&nbsp;&nbsp;
					</div></td>
			</tr>
		</table>


		<%-- 		<div>
			<img alt="likeit" src="../resources/image/REMON_like_icon.png"
				class="imgform"> <span>100</span>
			<c:forEach items="${board.likeList}" var="like">
				<span>작성자 : ${like.member_id}, ${like.likeit} </span>
				<br>
			</c:forEach>
			<img alt="reply" src="../resources/image/REMON_comment_icon.png"
				class="imgform"> <span>7</span>
		</div>

		<!-- # 최대 6개 -->
		<div>
			<br>Hashtag<br> <span class="hashtag">#
				${board.hashtagVO.hashtag1}</span>&nbsp;&nbsp;&nbsp; <span class="hashtag">#
				${board.hashtagVO.hashtag2}</span>&nbsp;&nbsp;&nbsp; <span class="hashtag">#
				${board.hashtagVO.hashtag3}</span>&nbsp;&nbsp;&nbsp; <span class="hashtag">#
				${board.hashtagVO.hashtag4}</span>&nbsp;&nbsp;&nbsp; <span class="hashtag">#
				${board.hashtagVO.hashtag5}</span>&nbsp;&nbsp;&nbsp; <span class="hashtag">#
				${board.hashtagVO.hashtag6}</span>&nbsp;&nbsp;&nbsp;
		</div> --%>
		<br>
	</div>
	<br>
	<!-- 리뷰 content, 영화 간단 정보 -->
	<div class="center">

		<table class="center">
			<tr>
				<td colspan="2">
					<div>
						<br>
						<h2>리뷰내용:</h2>
						<br> --------------------------<br> <br>
						${board.board_content} <br> <br>--------------------------
						<br> <br> 무비 movie_nm: ${board.b_movieVO.movie_nm} <br>
						<br>
					</div>
				</td>
				<td style="border-left: 1px solid #F2F2F2;"><div
						style="padding-left: 20px;">
						영화 정보:
						<ul style="list-style: none;">
							<li>${mApiVO.movie_nm}</li>
							<li>${mApiVO.genre}</li>
							<li>${mApiVO.nation}</li>
						</ul>
					</div></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<%-- <!-- 리뷰내용 -->
		<div>
			<br>
			<h2>리뷰내용:</h2>
			<br> --------------------------<br> <br>
			${board.board_content} <br> <br>--------------------------
			<br> <br> 무비 movie_nm: ${board.b_movieVO.movie_nm} <br>
			<br>
		</div>

		<!-- 영화 간단 정보 (영화 제목, 장르, 감독, 개봉일시) -->
		<div>
			영화 정보:
			<ul style="list-style: none;">
				<li>${mApiVO.movie_nm}</li>
				<li>${mApiVO.genre}</li>
				<li>${mApiVO.nation}</li>
			</ul>
		</div> --%>
	</div>
	<br>
	<hr color="#F2F2F2">
	<!-- 덧글 forEach -->
	<div class="center_txtnon">
		<h3>&nbsp;&nbsp;댓글 | REPLY</h3>
		<jsp:include page="../share/reply.jsp" />
	</div>

	<br>
	<hr width="400px;">
	<br>

	<div class="center">
		<%-- 글번 : ${board.board_num} --%>

		<input type="button" value="목록"
			onclick="location.href='/review/movie/main'">

		<c:if test="${sessionScope.member_id == board.member_id}">

			<input type="button" value="수정"
				onclick="location.href='/review/movie/movie_updateForm/${board.board_num}'">
			<form action="/review/movie/movie_delete/${board.board_num}"
				method="post" id="movie_delete">
				<input type="submit" value="삭제">
			</form>

		</c:if>
	</div>

	<br>

	<div>
		<jsp:include page="../share/footer.jsp" />
	</div>
</body>
</html>