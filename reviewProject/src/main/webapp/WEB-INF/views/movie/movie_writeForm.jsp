<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/review/resources/tui-editor/jquery/dist/jquery.js"></script>
<script src='/review/resources/tui-editor/markdown-it/dist/markdown-it.js'></script>
<script src="/review/resources/tui-editor/to-mark/dist/to-mark.js"></script>
<script src="/review/resources/tui-editor/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script src="/review/resources/tui-editor/codemirror/lib/codemirror.js"></script>
<script src="/review/resources/tui-editor/highlightjs/highlight.pack.js"></script>
<script src="/review/resources/tui-editor/squire-rte/build/squire-raw.js"></script>
<link rel="stylesheet" href="/review/resources/tui-editor/codemirror/lib/codemirror.css">
<link rel="stylesheet" href="/review/resources/tui-editor/highlightjs/styles/github.css">
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="/review/resources/tui-editor/tui-color-picker/dist/tui-color-picker.js"></script>
<script src="/review/resources/tui-editor/tui-editor/dist/tui-editor-Editor.js"></script>
<script src="/review/resources/tui-editor/tui-editor/dist/tui-editor-extColorSyntax.js"></script>
<link rel="stylesheet" href="/review/resources/tui-editor/tui-editor/dist/tui-editor.css">
<link rel="stylesheet" href="/review/resources/tui-editor/tui-editor/dist/tui-editor-contents.css">
<link rel="stylesheet" href="/review/resources/tui-editor/tui-color-picker/dist/tui-color-picker.css">

<script type="text/javascript" src="/review/resources/script/movieAutocomplete.js"></script>
<script type="text/javascript" src="/review/resources/script/setBoardInfo.js"></script>
<script type="text/javascript" src="/review/resources/script/common.js"></script>

<link rel="stylesheet" href="resources/css/star.css">
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

.code-html{
	text-align: left;
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
<script type="text/javascript">
	$( document ).ready(function() {
		movieAutocomplete();
		settingGrade();
		changeGrade();
		changeRating();
	})
</script>
</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/views/share/header.jsp" />
	</div>
	<div class="center">
		<form action="/review/movie/movie_write" method="post" id="movie_write">
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
							<input type="hidden" name="board_content" id="board_content">
							<div class="code-html">
								<div id="editSection"></div>
							</div>
							<script class="code-js" src="/review/resources/script/createEditor.js"></script>
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
					<input type="submit" id="form-submit" value="확인" onclick="submitButton()"
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
	<div style="height: 20px;"></div>
	<div>
		<jsp:include page="/WEB-INF/views/share/footer.jsp" />
	</div>
</body>
</html>