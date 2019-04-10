<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- tui-editor -->
<script src="../resources/tui-editor/jquery/dist/jquery.js"></script>
<script src='../resources/tui-editor/markdown-it/dist/markdown-it.js'></script>
<script src="../resources/tui-editor/to-mark/dist/to-mark.js"></script>
<script
	src="../resources/tui-editor/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script src="../resources/tui-editor/codemirror/lib/codemirror.js"></script>
<script src="../resources/tui-editor/highlightjs/highlight.pack.js"></script>
<script src="../resources/tui-editor/squire-rte/build/squire-raw.js"></script>

<link rel="stylesheet"
	href="../resources/tui-editor/codemirror/lib/codemirror.css">
<link rel="stylesheet"
	href="../resources/tui-editor/highlightjs/styles/github.css">

<!-- autoComplete -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/review/resources/script/movieAutocomplete.js"></script>
<style>
.ui-autocomplete {
	overflow-y: scroll;
	overflow-x: hidden;
}

.ui-autocomplete {
	overflow-y: scroll;
	overflow-x: hidden;
}

td {
	width: 400px;
	background-color: white;
	margin: 50px;
}

.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.mv_table_st {
	margin-left: auto;
	margin-right: auto;
	border-collapse: separate;
	background-color: #D5D5D5;
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
<link rel="stylesheet" href="../resources/css/star.css">
<script type="text/javascript">
	//radio,select 기존 값 checked
	$( document ).ready(function() {
		movieAutocomplete();
	})
	$(document).ready(
			function() {
				$(
						'input:radio[name="recommend"]:input[value='
								+ $(recommend_val).val() + ']').attr("checked",
						true);
				$(
						'input:radio[name="grade1"]:input[value='
								+ $(grade1_val).val() + ']').attr("checked",
						true);
				$(
						'input:radio[name="grade2"]:input[value='
								+ $(grade2_val).val() + ']').attr("checked",
						true);
				$(
						'input:radio[name="grade3"]:input[value='
								+ $(grade3_val).val() + ']').attr("checked",
						true);
				$(
						'input:radio[name="grade4"]:input[value='
								+ $(grade4_val).val() + ']').attr("checked",
						true);

				$("#grade_name1").val($(grade_name1_val).val());
				$("#grade_name2").val($(grade_name2_val).val());
				$("#grade_name3").val($(grade_name3_val).val());
				$("#grade_name4").val($(grade_name4_val).val());
			});

	//grade_name선택시  grade값 초기화 , grade_name중복불가 
	$(document).ready(
			function() {
				var $select = $("select");
				$select
						.on("change",
								function() {

									//grade 값 초기화 
									var id = this.id
									if (id == "grade_name1") {
										$(":radio[name='grade1']").prop(
												"checked", false);
									} else if (id == "grade_name2") {
										$(":radio[name='grade2']").prop(
												"checked", false);
									} else if (id == "grade_name3") {
										$(":radio[name='grade3']").prop(
												"checked", false);
									} else {
										$(":radio[name='grade4']").prop(
												"checked", false);
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

									var selected1 = $("option:selected",
											$("#grade_name1"));
									if (selected1.parent()[0].id == "bad1") {
										grade1 = 25 - grade1;
									}

									var selected2 = $("option:selected",
											$("#grade_name2"));
									if (selected2.parent()[0].id == "bad2") {
										grade2 = 25 - grade2;
									}

									var selected3 = $("option:selected",
											$("#grade_name3"));
									if (selected3.parent()[0].id == "bad3") {
										grade3 = 25 - grade3;
									}

									var selected4 = $("option:selected",
											$("#grade_name4"));
									if (selected4.parent()[0].id == "bad4") {
										grade4 = 25 - grade4;
									}

									$("#lemon_grade").val(
											grade1 + grade2 + grade3 + grade4);
									var value = $("#lemon_grade").val();
									$('.total_value').html(value);
									//----- lemon_grade 재계산 끝, select 중복방지 처리 시작 

									var selected = [];
									$.each($select, function(index, select) {
										if (select.value !== "") {
											selected.push(select.value);
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
	$(document).ready(
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

									var selected1 = $("option:selected",
											$("#grade_name1"));
									if (selected1.parent()[0].id == "bad1") {
										grade1 = 25 - grade1;
									}

									var selected2 = $("option:selected",
											$("#grade_name2"));
									if (selected2.parent()[0].id == "bad2") {
										grade2 = 25 - grade2;
									}

									var selected3 = $("option:selected",
											$("#grade_name3"));
									if (selected3.parent()[0].id == "bad3") {
										grade3 = 25 - grade3;
									}

									var selected4 = $("option:selected",
											$("#grade_name4"));
									if (selected4.parent()[0].id == "bad4") {
										grade4 = 25 - grade4;
									}

									$("#lemon_grade").val(
											grade1 + grade2 + grade3 + grade4);
									var value = $("#lemon_grade").val();
									$('.total_value').html(value);
								});
			});
</script>
</head>
<body>

	<div>
		<jsp:include page="/WEB-INF/views/share/header.jsp" />
	</div>
	<div class="center">
		<form action="/review/movie/movie_update/${board.board_num}"
			method="post" id="movie_update">

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
								value="${board.board_title}"
								style="border-style: none; width: 600px; height: 30px;">
						</div>
					</td>
					<td>
						<div>
							영화 검색 | <input type="text" id="movie_nm" name="movie_nm"
								value="${mApiVO.movie_nm}"> <input type="hidden"
								id="director" name="director" value="${mApiVO.director}">
							<input type="hidden" id="actor" name="actor"
								value="${mApiVO.actor}"> <input type="hidden"
								id="poster" name="poster" value="${mApiVO.poster}"> <img
								id="movie_poster" src="${mApiVO.poster}">
						</div>
					</td>
				</tr>
				<tr style="height: 700px;">
					<td colspan="2">
						<div>
							<!-- tui-editor input -->
							<input type="hidden" name="board_content" id="board_content">
							<!-- tui-editor view -->
							<div class="code-html">
								<script
									src="../resources/tui-editor/tui-color-picker/dist/tui-color-picker.js"></script>
								<script
									src="../resources/tui-editor/tui-editor/dist/tui-editor-Editor.js"></script>
								<script
									src="../resources/tui-editor/tui-editor/dist/tui-editor-extColorSyntax.js"></script>
								<link rel="stylesheet"
									href="../resources/tui-editor/tui-editor/dist/tui-editor.css">
								<link rel="stylesheet"
									href="../resources/tui-editor/tui-editor/dist/tui-editor-contents.css">
								<link rel="stylesheet"
									href="../resources/tui-editor/tui-color-picker/dist/tui-color-picker.css">

								<div id="editSection">${board.board_content}</div>
							</div>
							<script class="code-js">
								var editor = new tui.Editor(
										{
											el : document
													.querySelector('#editSection'),
											initialEditType : 'wysiwyg',
											height : '700px',
											exts : [ 'colorSyntax' ]
										});
							</script>
						</div>
					</td>
					<td>
						<div>
							<div style="height: 300px;">
								<h3>전체 평점</h3>
							</div>
							<div style="height: 30px;">
								<label for="lemon_grade">총합 점수 : </label> <input type="hidden"
									value="${board.lemon_grade}" id="lemon_grade"
									name="lemon_grade"> <span class="total_value">${board.lemon_grade}</span>점
							</div>
							<div style="height: 20px;">
								<hr>
							</div>
							<div>
								<input type="hidden" value="${board.gradeVO.grade_name1}"
									id="grade_name1_val"> 1. <select name="grade_name1"
									id="grade_name1" class="select_name">
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
										<input type="hidden" value="${board.gradeVO.grade1}"
											id="grade1_val"> <label> <input type="radio"
											name="grade1" value="5" /> <span class="icon">★</span>
										</label> <label> <input type="radio" name="grade1" value="10" />
											<span class="icon">★</span> <span class="icon">★</span>
										</label> <label> <input type="radio" name="grade1" value="15" />
											<span class="icon">★</span> <span class="icon">★</span> <span
											class="icon">★</span>
										</label> <label> <input type="radio" name="grade1" value="20" />
											<span class="icon">★</span> <span class="icon">★</span> <span
											class="icon">★</span> <span class="icon">★</span>
										</label> <label> <input type="radio" name="grade1" value="25" />
											<span class="icon">★</span> <span class="icon">★</span> <span
											class="icon">★</span> <span class="icon">★</span> <span
											class="icon">★</span>
										</label>
									</div>
								</div>
							</div>
							<br>
							<div>
								<input type="hidden" value="${board.gradeVO.grade_name2}"
									id="grade_name2_val"> 2. <select name="grade_name2"
									id="grade_name2" class="select_name">
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
										<input type="hidden" value="${board.gradeVO.grade2}"
											id="grade2_val"> <label> <input type="radio"
											name="grade2" value="5" /> <span class="icon">★</span>
										</label> <label> <input type="radio" name="grade2" value="10" />
											<span class="icon">★</span> <span class="icon">★</span>
										</label> <label> <input type="radio" name="grade2" value="15" />
											<span class="icon">★</span> <span class="icon">★</span> <span
											class="icon">★</span>
										</label> <label> <input type="radio" name="grade2" value="20" />
											<span class="icon">★</span> <span class="icon">★</span> <span
											class="icon">★</span> <span class="icon">★</span>
										</label> <label> <input type="radio" name="grade2" value="25" />
											<span class="icon">★</span> <span class="icon">★</span> <span
											class="icon">★</span> <span class="icon">★</span> <span
											class="icon">★</span>
										</label>
									</div>
								</div>
							</div>
							<br>
							<div>
								<input type="hidden" value="${board.gradeVO.grade_name3}"
									id="grade_name3_val"> 3. <select name="grade_name3"
									id="grade_name3" class="select_name">
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
										<input type="hidden" value="${board.gradeVO.grade3}"
											id="grade3_val"> <label> <input type="radio"
											name="grade3" value="5" /> <span class="icon">★</span>
										</label> <label> <input type="radio" name="grade3" value="10" />
											<span class="icon">★</span> <span class="icon">★</span>
										</label> <label> <input type="radio" name="grade3" value="15" />
											<span class="icon">★</span> <span class="icon">★</span> <span
											class="icon">★</span>
										</label> <label> <input type="radio" name="grade3" value="20" />
											<span class="icon">★</span> <span class="icon">★</span> <span
											class="icon">★</span> <span class="icon">★</span>
										</label> <label> <input type="radio" name="grade3" value="25" />
											<span class="icon">★</span> <span class="icon">★</span> <span
											class="icon">★</span> <span class="icon">★</span> <span
											class="icon">★</span>
										</label>
									</div>
								</div>
							</div>
							<br>
							<div>
								<input type="hidden" value="${board.gradeVO.grade_name4}"
									id="grade_name4_val"> 4. <select name="grade_name4"
									id="grade_name4" class="select_name">
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
										<input type="hidden" value="${board.gradeVO.grade4}"
											id="grade4_val"> <label> <input type="radio"
											name="grade4" value="5" /> <span class="icon">★</span>
										</label> <label> <input type="radio" name="grade4" value="10" />
											<span class="icon">★</span> <span class="icon">★</span>
										</label> <label> <input type="radio" name="grade4" value="15" />
											<span class="icon">★</span> <span class="icon">★</span> <span
											class="icon">★</span>
										</label> <label> <input type="radio" name="grade4" value="20" />
											<span class="icon">★</span> <span class="icon">★</span> <span
											class="icon">★</span> <span class="icon">★</span>
										</label> <label> <input type="radio" name="grade4" value="25" />
											<span class="icon">★</span> <span class="icon">★</span> <span
											class="icon">★</span> <span class="icon">★</span> <span
											class="icon">★</span>
										</label>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr style="height: 200px;">
					<td colspan="2">
						<div>
							<input type="hidden" value="${board.recommend}"
								id="recommend_val"> <input type="radio" name="recommend"
								value="1">이 영화를 추천합니다. <input type="radio"
								name="recommend" value="0">이 영화를 추천하지 않습니다.
						</div>
					</td>
					<td>
						<div style="height: 30px;">
							#해쉬태그
							<hr>
						</div>
						<div style="height: 10px;"></div>
						<div>
							#<input type="text" name="hashtag1"
								value="${board.hashtagVO.hashtag1}"><br> #<input
								type="text" name="hashtag2" value="${board.hashtagVO.hashtag2}"><br>
							#<input type="text" name="hashtag3"
								value="${board.hashtagVO.hashtag3}"><br> #<input
								type="text" name="hashtag4" value="${board.hashtagVO.hashtag4}"><br>
							#<input type="text" name="hashtag5"
								value="${board.hashtagVO.hashtag5}"><br> #<input
								type="text" name="hashtag6" value="${board.hashtagVO.hashtag6}"><br>
						</div>
						<div style="height: 20px;"></div>
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
					<input type="reset" value="취소"
						style="width: 97px; height: 30px; background: linear-gradient(to left, #ffe400, #abf200); border-radius: 10px; border-style: none;">
				</div>
			</div>
		</form>

		<form action="/review/back" method="post" id="back">
			<input type="hidden" name="address" value="${address}"> <input
				type="submit" value="뒤로가기"
				style="width: 200px; height: 30px; background: linear-gradient(to left, #ffe400, #abf200); border-radius: 10px; border-style: none;">
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