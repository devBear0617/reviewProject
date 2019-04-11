<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- tui-editor -->
<script src="resources/tui-editor/jquery/dist/jquery.js"></script>
<script src='resources/tui-editor/markdown-it/dist/markdown-it.js'></script>
<script src="resources/tui-editor/to-mark/dist/to-mark.js"></script>
<script
	src="resources/tui-editor/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script src="resources/tui-editor/codemirror/lib/codemirror.js"></script>
<script src="resources/tui-editor/highlightjs/highlight.pack.js"></script>
<script src="resources/tui-editor/squire-rte/build/squire-raw.js"></script>
<link rel="stylesheet"
	href="resources/tui-editor/codemirror/lib/codemirror.css">
<link rel="stylesheet"
	href="resources/tui-editor/highlightjs/styles/github.css">

<!-- autoComplete -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<style>
.ui-autocomplete {
	overflow-y: scroll;
	overflow-x: hidden;
}

td {
	width: 400px;
	background-color: white;
	margin: 50px;
}

.mv_table_st {
	margin-left: auto;
	margin-right: auto;
	border-collapse: separate;
	background-color: #D5D5D5;
}

.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.hashtag_st {
	border-style: none;
	background-color: #F8FBEF;
	width: 150px;
	height: 20px;
	margin: 5px;
	border-radius: 20px;
}

.select_name {
	border-style: none;
	background-color: #F8FBEF;
	width: 150px;
	height: 30px;
	margin: 5px;
	border-radius: 20px;
}

.option_st {
	background-color: white;
}
</style>

<!-- Grade1~4 Star CSS -->
<link rel="stylesheet" href="resources/css/star.css">

<script type="text/javascript">
	$(document).ready(
			function() {
				$("#movie_nm").autocomplete(
						{
							minLength : 1,
							delay : 30,
							source : function(request, response) {
								$.ajax({
									url : "/review/movie/autocomplete",
									type : "post",
									dataType : "json",
									data : {
										movie_nm : request.term
									},
									success : function(data) {
										response($.map(data, function(item) {
											item.title = item.title.replace(
													/<b>/gi, "").replace(
													/<\/b>/gi, "");
											return {
												label : item.title,
												value : item.title,
												director : item.director,
												actor : item.actor,
												poster : item.image
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
			});

	//grade_name 미선택시  grade_radio 숨기기
	$(document).ready(
			function() {
				var grade_name1 = $("#grade_name1").val(), grade_name2 = $(
						"#grade_name2").val(), grade_name3 = $("#grade_name3")
						.val(), grade_name4 = $("#grade_name4").val();

				if (!grade_name1) {
					$("#on_off_grade1").css('visibility', 'hidden');
				}
				if (!grade_name2) {
					$("#on_off_grade2").css('visibility', 'hidden');
				}
				if (!grade_name3) {
					$("#on_off_grade3").css('visibility', 'hidden');
				}
				if (!grade_name4) {
					$("#on_off_grade4").css('visibility', 'hidden');
				}
			});

	// grade_name선택시  grade값 초기화 , grade_name중복불가 
	$(document)
			.ready(
					function() {
						var $select = $("select");

						$select
								.on(
										"change",
										function() {
											//grade 값 초기화 
											var id = this.id
											if (id == "grade_name1") {
												$("#on_off_grade1")
														.css('visibility',
																'visible');
												$(":radio[name='grade1']")
														.prop("checked", false);
											} else if (id == "grade_name2") {
												$("#on_off_grade2")
														.css('visibility',
																'visible');
												$(":radio[name='grade2']")
														.prop("checked", false);
											} else if (id == "grade_name3") {
												$("#on_off_grade3")
														.css('visibility',
																'visible');
												$(":radio[name='grade3']")
														.prop("checked", false);
											} else {
												$("#on_off_grade4")
														.css('visibility',
																'visible');
												$(":radio[name='grade4']")
														.prop("checked", false);
											}

											//lemon_grade 재계산
											var grade1 = parseInt($(
													':radio[name="grade1"]:checked')
													.val()), grade2 = parseInt($(
													':radio[name="grade2"]:checked')
													.val()), grade3 = parseInt($(
													':radio[name="grade3"]:checked')
													.val()), grade4 = parseInt($(
													':radio[name="grade4"]:checked')
													.val());

											grade1 = (!grade1) ? 0 : grade1;
											grade2 = (!grade2) ? 0 : grade2;
											grade3 = (!grade3) ? 0 : grade3;
											grade4 = (!grade4) ? 0 : grade4;

											var selected1 = $(
													"option:selected",
													$("#grade_name1"));
											if (selected1.parent()[0].id == "bad1") {
												grade1 = 25 - grade1;
											}

											var selected2 = $(
													"option:selected",
													$("#grade_name2"));
											if (selected2.parent()[0].id == "bad2") {
												grade2 = 25 - grade2;
											}

											var selected3 = $(
													"option:selected",
													$("#grade_name3"));
											if (selected3.parent()[0].id == "bad3") {
												grade3 = 25 - grade3;
											}

											var selected4 = $(
													"option:selected",
													$("#grade_name4"));
											if (selected4.parent()[0].id == "bad4") {
												grade4 = 25 - grade4;
											}

											$("#lemon_grade").val(
													grade1 + grade2 + grade3
															+ grade4);
											var value = $("#lemon_grade").val();
											if (value >= 80) {
												$("#lemon_grade_img")
														.attr("src",
																"/review/movie/resources/image/REMON_grade_1.png");
												$('.lemon_grade_name').html(
														"달콤한 레몬");
											} else if (value >= 60) {
												$("#lemon_grade_img")
														.attr("src",
																"/review/movie/resources/image/REMON_grade_2.png");
												$('.lemon_grade_name').html(
														"새콤한 레몬");
											} else if (value >= 40) {
												$("#lemon_grade_img")
														.attr("src",
																"/review/movie/resources/image/REMON_grade_3.png");
												$('.lemon_grade_name').html(
														"신맛 레몬");
											} else if (value >= 20) {
												$("#lemon_grade_img")
														.attr("src",
																"/review/movie/resources/image/REMON_grade_4.png");
												$('.lemon_grade_name').html(
														"씁쓸한 레몬");
											} else {
												$("#lemon_grade_img")
														.attr("src",
																"/review/movie/resources/image/REMON_grade_5.png");
												$('.lemon_grade_name').html(
														"썩은 레몬");
											}
											$('.total_value').html(value);
											//----- lemon_grade 재계산 끝, select 중복방지 처리 시작 

											var selected = [];
											$
													.each(
															$select,
															function(index,
																	select) {
																if (select.value !== "") {
																	selected
																			.push(select.value);
																}
															});
											$("option").prop("disabled", false);
											for ( var index in selected) {
												$(
														'option[value="'
																+ selected[index]
																+ '"]').prop(
														"disabled", true);
											}
										});
					});

	//개별점수 책정시 계산해서 총합점수 출력 
	$(document)
			.ready(
					function() {
						$(".rating")
								.change(
										function() {
											var grade1 = parseInt($(
													':radio[name="grade1"]:checked')
													.val()), grade2 = parseInt($(
													':radio[name="grade2"]:checked')
													.val()), grade3 = parseInt($(
													':radio[name="grade3"]:checked')
													.val()), grade4 = parseInt($(
													':radio[name="grade4"]:checked')
													.val());

											// null체크 , 값 보정 
											grade1 = (!grade1) ? 0 : grade1;
											grade2 = (!grade2) ? 0 : grade2;
											grade3 = (!grade3) ? 0 : grade3;
											grade4 = (!grade4) ? 0 : grade4;

											var selected1 = $(
													"option:selected",
													$("#grade_name1"));
											if (selected1.parent()[0].id == "bad1") {
												grade1 = 25 - grade1;
											}

											var selected2 = $(
													"option:selected",
													$("#grade_name2"));
											if (selected2.parent()[0].id == "bad2") {
												grade2 = 25 - grade2;
											}

											var selected3 = $(
													"option:selected",
													$("#grade_name3"));
											if (selected3.parent()[0].id == "bad3") {
												grade3 = 25 - grade3;
											}

											var selected4 = $(
													"option:selected",
													$("#grade_name4"));
											if (selected4.parent()[0].id == "bad4") {
												grade4 = 25 - grade4;
											}

											$("#lemon_grade").val(
													grade1 + grade2 + grade3
															+ grade4);
											var value = $("#lemon_grade").val();
											if (value >= 80) {
												$("#lemon_grade_img")
														.attr("src",
																"/review/movie/resources/image/REMON_grade_1.png");
												$('.lemon_grade_name').html(
														"달콤한 레몬");
											} else if (value >= 60) {
												$("#lemon_grade_img")
														.attr("src",
																"/review/movie/resources/image/REMON_grade_2.png");
												$('.lemon_grade_name').html(
														"새콤한 레몬");
											} else if (value >= 40) {
												$("#lemon_grade_img")
														.attr("src",
																"/review/movie/resources/image/REMON_grade_3.png");
												$('.lemon_grade_name').html(
														"신맛 레몬");
											} else if (value >= 20) {
												$("#lemon_grade_img")
														.attr("src",
																"/review/movie/resources/image/REMON_grade_4.png");
												$('.lemon_grade_name').html(
														"씁쓸한 레몬");
											} else {
												$("#lemon_grade_img")
														.attr("src",
																"/review/movie/resources/image/REMON_grade_5.png");
												$('.lemon_grade_name').html(
														"썩은 레몬");
											}
											$('.total_value').html(value);
										});
					});

	function backBT() {
		window.history.back();
	}
</script>
</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/views/share/header.jsp" />
	</div>
	<div class="center">
		<form action="/review/movie/movie_write" method="post"
			id="movie_write">

			<table class="mv_table_st">
				<tr style="height: 80px;">
					<td>영화</td>
					<td>tv</td>
					<td>게임</td>
				</tr>
				<tr style="height: 50px;">
					<td colspan="2">
						<div>
							제목 | <input type="text" name="board_title"
								style="border-style: none; width: 600px; height: 30px;">
						</div>
					</td>
					<td>
						<div>
							영화 검색 | <input type="text" id="movie_nm" name="movie_nm">
						</div>
					</td>
				</tr>
				<tr style="height: 750px;">
					<td colspan="2">
						<div>
							<div>
								<!-- tui-editor input -->
								<input type="hidden" name="board_content" id="board_content">
							</div>
							<!-- tui-editor view -->
							<div class="code-html">
								<script
									src="resources/tui-editor/tui-color-picker/dist/tui-color-picker.js"></script>
								<script
									src="resources/tui-editor/tui-editor/dist/tui-editor-Editor.js"></script>
								<script
									src="resources/tui-editor/tui-editor/dist/tui-editor-extColorSyntax.js"></script>
								<link rel="stylesheet"
									href="resources/tui-editor/tui-editor/dist/tui-editor.css">
								<link rel="stylesheet"
									href="resources/tui-editor/tui-editor/dist/tui-editor-contents.css">
								<link rel="stylesheet"
									href="resources/tui-editor/tui-color-picker/dist/tui-color-picker.css">

								<div id="editSection"></div>
							</div>
							<script class="code-js">
								var editor = new tui.Editor(
										{
											el : document
													.querySelector('#editSection'),
											initialEditType : 'wysiwyg',
											height : '750px',
											exts : [ 'colorSyntax' ]
										});
							</script>
						</div>
					</td>
					<td rowspan="2">
						<div>
							<table>
								<tr style="height: 250px;">
									<td>
										<div>
											<input type="hidden" id="director" name="director"> <input
												type="hidden" id="actor" name="actor"> <input
												type="hidden" id="poster" name="poster"> <img
												id="movie_poster" src="#">
										</div>
									</td>
								</tr>
								<tr style="height: 340px;">
									<td><hr>
										<div style="height: 300px;">
											<h3>전체 평점</h3>
											<img id="lemon_grade_img">
										</div>
										<div style="height: 30px;">
											<label for="lemon_grade">총합 </label> <input type="hidden"
												value="0" id="lemon_grade" name="lemon_grade"> <span
												class="total_value">0</span>점 <span class="lemon_grade_name">레몬</span>

										</div> <br></td>
								</tr>
								<tr style="height: 270px;">
									<td>
										<div>
											1. <select name="grade_name1" id="grade_name1"
												class="select_name">
												<option value="">+선택하기</option>
												<optgroup label="good" id="good1" class="option_st">
													<option value="재미">재미</option>
													<option value="액션">액션</option>
													<option value="연출">연출</option>
													<option value="감동">감동</option>
													<option value="반전">반전</option>
													<option value="실험성">실험성</option>
													<option value="시나리오">시나리오</option>
													<option value="사운드">사운드</option>
													<option value="연기">연기</option>
													<option value="캐스팅">캐스팅</option>
												</optgroup>
												<optgroup label="bad" id="bad1" class="option_st">
													<option value="bad재미">bad재미</option>
													<option value="bad액션">bad액션</option>
													<option value="bad연출">bad연출</option>
													<option value="bad감동">bad감동</option>
													<option value="bad반전">bad반전</option>
													<option value="bad실험성">bad실험성</option>
													<option value="bad시나리오">bad시나리오</option>
													<option value="bad사운드">bad사운드</option>
													<option value="bad연기">bad연기</option>
													<option value="bad캐스팅">bad캐스팅</option>
												</optgroup>
											</select>
											<div class="rating">
												<div id="on_off_grade1">
													<label> <input type="radio" name="grade1" value="5" />
														<span class="icon">★</span>
													</label> <label> <input type="radio" name="grade1"
														value="10" /> <span class="icon">★</span> <span
														class="icon">★</span>
													</label> <label> <input type="radio" name="grade1"
														value="15" /> <span class="icon">★</span> <span
														class="icon">★</span> <span class="icon">★</span>
													</label> <label> <input type="radio" name="grade1"
														value="20" /> <span class="icon">★</span> <span
														class="icon">★</span> <span class="icon">★</span> <span
														class="icon">★</span>
													</label> <label> <input type="radio" name="grade1"
														value="25" /> <span class="icon">★</span> <span
														class="icon">★</span> <span class="icon">★</span> <span
														class="icon">★</span> <span class="icon">★</span>
													</label>
												</div>
											</div>
										</div> <br>
										<div>
											2. <select name="grade_name2" id="grade_name2"
												class="select_name">
												<option value="">+선택하기</option>
												<optgroup label="good" id="good2" class="option_st">
													<option value="재미">재미</option>
													<option value="액션">액션</option>
													<option value="연출">연출</option>
													<option value="감동">감동</option>
													<option value="반전">반전</option>
													<option value="실험성">실험성</option>
													<option value="시나리오">시나리오</option>
													<option value="사운드">사운드</option>
													<option value="연기">연기</option>
													<option value="캐스팅">캐스팅</option>
												</optgroup>
												<optgroup label="bad" id="bad2" class="option_st">
													<option value="bad재미">bad재미</option>
													<option value="bad액션">bad액션</option>
													<option value="bad연출">bad연출</option>
													<option value="bad감동">bad감동</option>
													<option value="bad반전">bad반전</option>
													<option value="bad실험성">bad실험성</option>
													<option value="bad시나리오">bad시나리오</option>
													<option value="bad사운드">bad사운드</option>
													<option value="bad연기">bad연기</option>
													<option value="bad캐스팅">bad캐스팅</option>
												</optgroup>
											</select>
											<div class="rating">
												<div id="on_off_grade2">
													<label> <input type="radio" name="grade2" value="5" />
														<span class="icon">★</span>
													</label> <label> <input type="radio" name="grade2"
														value="10" /> <span class="icon">★</span> <span
														class="icon">★</span>
													</label> <label> <input type="radio" name="grade2"
														value="15" /> <span class="icon">★</span> <span
														class="icon">★</span> <span class="icon">★</span>
													</label> <label> <input type="radio" name="grade2"
														value="20" /> <span class="icon">★</span> <span
														class="icon">★</span> <span class="icon">★</span> <span
														class="icon">★</span>
													</label> <label> <input type="radio" name="grade2"
														value="25" /> <span class="icon">★</span> <span
														class="icon">★</span> <span class="icon">★</span> <span
														class="icon">★</span> <span class="icon">★</span>
													</label>
												</div>
											</div>
										</div> <br>
										<div>
											3. <select name="grade_name3" id="grade_name3"
												class="select_name">
												<option value="">+선택하기</option>
												<optgroup label="good" id="good3" class="option_st">
													<option value="재미">재미</option>
													<option value="액션">액션</option>
													<option value="연출">연출</option>
													<option value="감동">감동</option>
													<option value="반전">반전</option>
													<option value="실험성">실험성</option>
													<option value="시나리오">시나리오</option>
													<option value="사운드">사운드</option>
													<option value="연기">연기</option>
													<option value="캐스팅">캐스팅</option>
												</optgroup>
												<optgroup label="bad" id="bad3" class="option_st">
													<option value="bad재미">bad재미</option>
													<option value="bad액션">bad액션</option>
													<option value="bad연출">bad연출</option>
													<option value="bad감동">bad감동</option>
													<option value="bad반전">bad반전</option>
													<option value="bad실험성">bad실험성</option>
													<option value="bad시나리오">bad시나리오</option>
													<option value="bad사운드">bad사운드</option>
													<option value="bad연기">bad연기</option>
													<option value="bad캐스팅">bad캐스팅</option>
												</optgroup>
											</select>
											<div class="rating">
												<div id="on_off_grade3">
													<label> <input type="radio" name="grade3" value="5" />
														<span class="icon">★</span>
													</label> <label> <input type="radio" name="grade3"
														value="10" /> <span class="icon">★</span> <span
														class="icon">★</span>
													</label> <label> <input type="radio" name="grade3"
														value="15" /> <span class="icon">★</span> <span
														class="icon">★</span> <span class="icon">★</span>
													</label> <label> <input type="radio" name="grade3"
														value="20" /> <span class="icon">★</span> <span
														class="icon">★</span> <span class="icon">★</span> <span
														class="icon">★</span>
													</label> <label> <input type="radio" name="grade3"
														value="25" /> <span class="icon">★</span> <span
														class="icon">★</span> <span class="icon">★</span> <span
														class="icon">★</span> <span class="icon">★</span>
													</label>
												</div>
											</div>
										</div> <br>
										<div>
											4. <select name="grade_name4" id="grade_name4"
												class="select_name">
												<option value="">+선택하기</option>
												<optgroup label="good" id="good4" class="option_st">
													<option value="재미">재미</option>
													<option value="액션">액션</option>
													<option value="연출">연출</option>
													<option value="감동">감동</option>
													<option value="반전">반전</option>
													<option value="실험성">실험성</option>
													<option value="시나리오">시나리오</option>
													<option value="사운드">사운드</option>
													<option value="연기">연기</option>
													<option value="캐스팅">캐스팅</option>
												</optgroup>
												<optgroup label="bad" id="bad4" class="option_st">
													<option value="bad재미">bad재미</option>
													<option value="bad액션">bad액션</option>
													<option value="bad연출">bad연출</option>
													<option value="bad감동">bad감동</option>
													<option value="bad반전">bad반전</option>
													<option value="bad실험성">bad실험성</option>
													<option value="bad시나리오">bad시나리오</option>
													<option value="bad사운드">bad사운드</option>
													<option value="bad연기">bad연기</option>
													<option value="bad캐스팅">bad캐스팅</option>
												</optgroup>
											</select>
											<div class="rating">
												<div id="on_off_grade4">
													<label> <input type="radio" name="grade4" value="5" />
														<span class="icon">★</span>
													</label> <label> <input type="radio" name="grade4"
														value="10" /> <span class="icon">★</span> <span
														class="icon">★</span>
													</label> <label> <input type="radio" name="grade4"
														value="15" /> <span class="icon">★</span> <span
														class="icon">★</span> <span class="icon">★</span>
													</label> <label> <input type="radio" name="grade4"
														value="20" /> <span class="icon">★</span> <span
														class="icon">★</span> <span class="icon">★</span> <span
														class="icon">★</span>
													</label> <label> <input type="radio" name="grade4"
														value="25" /> <span class="icon">★</span> <span
														class="icon">★</span> <span class="icon">★</span> <span
														class="icon">★</span> <span class="icon">★</span>
													</label>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr style="height: 110px;">
					<td colspan="2"><div style="height: 20px;">
							<br>#해쉬태그
						</div>
						<div style="height: 90px;">
							<br> #<input type="text" name="hashtag1" class="hashtag_st">
							#<input type="text" name="hashtag2" class="hashtag_st"> #<input
								type="text" name="hashtag3" class="hashtag_st"><br>
							#<input type="text" name="hashtag4" class="hashtag_st"> #<input
								type="text" name="hashtag5" class="hashtag_st"> #<input
								type="text" name="hashtag6" class="hashtag_st">
						</div></td>
				</tr>
				<tr style="height: 40px;">
					<td colspan="3">
						<div>
							<input type="radio" name="recommend" value="1">이 영화를
							추천합니다. <input type="radio" name="recommend" value="0">이
							영화를 추천하지 않습니다.
						</div>
					</td>
				</tr>
			</table>

			<br>
			<div style="display: inline-block;">
				<div style="float: left;">
					<input type="submit" id="form-submit" value="확인"
						style="width: 97px; height: 30px; background: linear-gradient(to left, #ffe400, #abf200); border-radius: 10px; border-style: none; margin-right: 5px;">
				</div>
				<div style="float: left;">
					<input type="hidden" name="address" value="${address}"> <input
						type="button" value="뒤로" onclick="backBT()"
						style="width: 97px; height: 30px; background: linear-gradient(to left, #ffe400, #abf200); border-radius: 10px; border-style: none; margin-right: 5px;">
				</div>
			</div>
		</form>

	</div>
	<script>
		var formSubmitButton = document.querySelector("#form-submit");
		formSubmitButton.addEventListener('click', function() {
			var contents = document.querySelector("#board_content");
			// contents.value = editor.getMarkdown(); //markdown 저장
			contents.value = editor.getHtml(); //html 저장		
			$("option").prop("disabled", false);//grade_name disabled 해제

			alert(contents.value);
		});
	</script>
	<div style="height: 20px;"></div>
	<!-- 푸터 -->
	<div>
		<jsp:include page="/WEB-INF/views/share/footer.jsp" />
	</div>
</body>
</html>