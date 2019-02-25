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
<script src="resources/tui-editor/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script src="resources/tui-editor/codemirror/lib/codemirror.js"></script>
<script src="resources/tui-editor/highlightjs/highlight.pack.js"></script>
<script src="resources/tui-editor/squire-rte/build/squire-raw.js"></script>
<link rel="stylesheet" href="resources/tui-editor/codemirror/lib/codemirror.css">
<link rel="stylesheet" href="resources/tui-editor/highlightjs/styles/github.css">

<!-- autoComplete -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" 
	rel="stylesheet" type="text/css" />
<style>
.ui-autocomplete {
	overflow-y: scroll;
	overflow-x: hidden;
}
</STYLE>

<!-- Grade1~4 Star CSS -->
<link rel="stylesheet" href="resources/css/star.css">

<script type="text/javascript">
$(document).ready(function() {
	$("#movie_nm").autocomplete({
		minLength: 1,
        delay:50,
		source : function(request, response) {
			$.ajax({
				url : "./autocomplete",
				type : "post",
				dataType : "json",
				data : {
					movie_nm : request.term
                },
				success : function(data) {
					var movieNmObject = data.movieNmObject;
					response(data.movieNmObject);
				},
				error : function(data) {
					console.log("에러");
				}
			});
		}
	});
});

//grade_name 미선택시  grade_radio 숨기기
$(document).ready(function(){	
	var grade_name1 = $("#grade_name1").val(),
		grade_name2 = $("#grade_name2").val(),
		grade_name3 = $("#grade_name3").val(),
		grade_name4 = $("#grade_name4").val();
	
	if(!grade_name1){
		$("#on_off_grade1").css('visibility','hidden');		
	}
	if(!grade_name2){
		$("#on_off_grade2").css('visibility','hidden');		
	}
	if(!grade_name3){
		$("#on_off_grade3").css('visibility','hidden');		
	}
	if(!grade_name4){
		$("#on_off_grade4").css('visibility','hidden');		
	}	
});

// grade_name선택시  grade값 초기화 , grade_name중복불가 
$(document).ready(function(){	
	var $select = $("select");

	$select.on("change", function() {
		
		//grade 값 초기화 
		var id = this.id
		if (id == "grade_name1"){
			$("#on_off_grade1").css('visibility','visible');
			$(":radio[name='grade1']").prop("checked", false);
		}else if(id == "grade_name2"){
			$("#on_off_grade2").css('visibility','visible');
			$(":radio[name='grade2']").prop("checked", false);			
		}else if(id == "grade_name3"){
			$("#on_off_grade3").css('visibility','visible');
			$(":radio[name='grade3']").prop("checked", false);			
		}else{
			$("#on_off_grade4").css('visibility','visible');
			$(":radio[name='grade4']").prop("checked", false);			
		}
		
		//lemon_grade 재계산
		var grade1 = parseInt($(':radio[name="grade1"]:checked').val()),
	 		grade2 = parseInt($(':radio[name="grade2"]:checked').val()),
	 		grade3 = parseInt($(':radio[name="grade3"]:checked').val()),
	 		grade4 = parseInt($(':radio[name="grade4"]:checked').val());	
		
			grade1=(!grade1)?0:grade1;	
			grade2=(!grade2)?0:grade2;	 	
			grade3=(!grade3)?0:grade3;	 	
			grade4=(!grade4)?0:grade4;	
			
			var selected1 = $("option:selected", $("#grade_name1"));
   			if(selected1.parent()[0].id == "bad1"){grade1 = 25-grade1;}
	
   			var selected2 = $("option:selected", $("#grade_name2"));
   			if(selected2.parent()[0].id == "bad2"){grade2 = 25-grade2;}
	
 		  	var selected3 = $("option:selected", $("#grade_name3"));
   			if(selected3.parent()[0].id == "bad3"){grade3 = 25-grade3;}
	
   			var selected4 = $("option:selected", $("#grade_name4"));
   			if(selected4.parent()[0].id == "bad4"){grade4 = 25-grade4;}
		
			$("#lemon_grade").val(grade1+grade2+grade3+grade4);		
			var value = $("#lemon_grade").val();		
			$('.total_value').html(value);				
//----- lemon_grade 재계산 끝, select 중복방지 처리 시작 
						
		var selected = [];
		$.each($select,function(index,select){
			if (select.value !== "") {selected.push(select.value); }
			});	
		$("option").prop("disabled" , false);
		for (var index in selected) { $('option[value="'+selected[index]+'"]').prop("disabled", true); }
	});
});

//개별점수 책정시 계산해서 총합점수 출력 
$(document).ready(function() {	
	$(".rating").change(function(){
		var grade1 = parseInt($(':radio[name="grade1"]:checked').val()),
		 	grade2 = parseInt($(':radio[name="grade2"]:checked').val()),
		 	grade3 = parseInt($(':radio[name="grade3"]:checked').val()),
		 	grade4 = parseInt($(':radio[name="grade4"]:checked').val());
		
		// null체크 , 값 보정 
			grade1=(!grade1)?0:grade1;	
			grade2=(!grade2)?0:grade2;	 	
			grade3=(!grade3)?0:grade3;	 	
			grade4=(!grade4)?0:grade4;	
			
		
				
		var selected1 = $("option:selected", $("#grade_name1"));
	   	if(selected1.parent()[0].id == "bad1"){grade1 = 25-grade1;}
		
	   	var selected2 = $("option:selected", $("#grade_name2"));
	   	if(selected2.parent()[0].id == "bad2"){grade2 = 25-grade2;}
		
	   	var selected3 = $("option:selected", $("#grade_name3"));
	   	if(selected3.parent()[0].id == "bad3"){grade3 = 25-grade3;}
		
	   	var selected4 = $("option:selected", $("#grade_name4"));
	   	if(selected4.parent()[0].id == "bad4"){grade4 = 25-grade4;}
			
		$("#lemon_grade").val(grade1+grade2+grade3+grade4);		
		var value = $("#lemon_grade").val();		
		$('.total_value').html(value);				
	});
});

</script>
</head>
<body>
	<!-- 
1 유저 id x
2 제목
3 날짜(자동)
4 내용
5 추천 ox (lemon_grade => 쳌박, 라디오버튼)
6 전체 평점 (grade_score)
7 4개의 개별점수 (score_name1~4, score_grade1~4)
8 해시테그 1~6
9 리뷰 영화의 정보 (api)
 -->

	<h1>새글작성.</h1>
	<form action="/review/movie/movie_write" method="post" id="movie_write">
		<br> 제목 :  <input type="text" name="board_title"> <br>
		<br> 내용 : <br>

		<!-- tui-editor input -->
		<input type="text" name="board_content" id="board_content" hidden>
		<!-- tui-editor view -->
		<div class="code-html">
			<script src="resources/tui-editor/tui-color-picker/dist/tui-color-picker.js"></script>
			<script src="resources/tui-editor/tui-editor/dist/tui-editor-Editor.js"></script>
			<script src="resources/tui-editor/tui-editor/dist/tui-editor-extColorSyntax.js"></script>
			<link rel="stylesheet" href="resources/tui-editor/tui-editor/dist/tui-editor.css">
			<link rel="stylesheet" href="resources/tui-editor/tui-editor/dist/tui-editor-contents.css">
			<link rel="stylesheet" href="resources/tui-editor/tui-color-picker/dist/tui-color-picker.css">

			<div id="editSection"></div>
		</div>
		<script class="code-js">
			var editor = new tui.Editor({
				el: document.querySelector('#editSection'),
				initialEditType: 'wysiwyg',
				height: '300px',
				exts: ['colorSyntax']
			});
		</script>

		<br>
		<br> 
		
		무비: <input type="text" id="movie_nm" name="movie_nm">

		<br>
		<br>
		 
		<input type="radio" name="recommend" value="1">이 영화를 추천합니다. 
		<input type="radio" name="recommend" value="0">이 영화를 추천하지 않습니다. 
		
		<br>
		<br>
		
		<label for="lemon_grade">총합 점수 : </label>
		<input type="hidden" value="0" id="lemon_grade" name="lemon_grade">
		<span class="total_value">0</span>점 
		
		<br>
		<br> 
		
		개별점수 1. <select name="grade_name1" id="grade_name1" class="select_name">
			<option value="">선택</option>
			<optgroup label="good" id="good1">
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
			<optgroup label="bad" id="bad1">
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
			<div id = "on_off_grade1">
			<label> <input type="radio" name="grade1" value="5" /> 
				<span class="icon">★</span>
			</label> 
			<label> <input type="radio" name="grade1" value="10" /> 
				<span class="icon">★</span> 
				<span class="icon">★</span>
			</label>
			<label> <input type="radio" name="grade1" value="15" /> 
				<span class="icon">★</span> 
				<span class="icon">★</span> 
				<span class="icon">★</span>
			</label>
			<label> <input type="radio" name="grade1" value="20" />
				<span class="icon">★</span> 
				<span class="icon">★</span> 
				<span class="icon">★</span>
				<span class="icon">★</span>
			</label> 
			<label> <input type="radio" name="grade1" value="25" /> 
				<span class="icon">★</span> 
				<span class="icon">★</span> 
				<span class="icon">★</span>
				<span class="icon">★</span> 
				<span class="icon">★</span>
			</label>
			</div>
		</div>
		<br>
		 개별점수 2. <select name="grade_name2" id="grade_name2" class="select_name">
			<option value="">선택</option>
			<optgroup label="good" id="good2">
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
			<optgroup label="bad" id="bad2">
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
			<div id = "on_off_grade2">
			<label> <input type="radio" name="grade2" value="5" /> 
				<span class="icon">★</span>
			</label>
			<label> <input type="radio" name="grade2" value="10" /> 
				<span class="icon">★</span> 
				<span class="icon">★</span>
			</label>
			<label> <input type="radio" name="grade2" value="15" /> 
				<span class="icon">★</span> 
				<span class="icon">★</span> 
				<span class="icon">★</span>
			</label>
			<label> <input type="radio" name="grade2" value="20" /> 
				<span class="icon">★</span> 
				<span class="icon">★</span> 
				<span class="icon">★</span>
				<span class="icon">★</span>
			</label> 
			<label> <input type="radio" name="grade2" value="25" /> 
				<span class="icon">★</span> 
				<span class="icon">★</span> 
				<span class="icon">★</span>
				<span class="icon">★</span> 
				<span class="icon">★</span>
			</label>
			</div>
		</div>
		<br> 
		개별점수 3. <select name="grade_name3" id="grade_name3" class="select_name">
			<option value="">선택</option>
			<optgroup label="good" id="good3">
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
			<optgroup label="bad" id="bad3">
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
			<div id = "on_off_grade3">
			<label> <input type="radio" name="grade3" value="5" /> 
				<span class="icon">★</span>
			</label> 
			<label> <input type="radio" name="grade3" value="10" /> 
				<span class="icon">★</span> 
				<span class="icon">★</span>
			</label> 
			<label> <input type="radio" name="grade3" value="15" /> 
				<span class="icon">★</span> 
				<span class="icon">★</span> 
				<span class="icon">★</span>
			</label> 
			<label> <input type="radio" name="grade3" value="20" /> 
				<span class="icon">★</span> 
				<span class="icon">★</span> 
				<span class="icon">★</span>
				<span class="icon">★</span>
			</label> 
			<label> <input type="radio" name="grade3" value="25" /> 
				<span class="icon">★</span> 
				<span class="icon">★</span> 
				<span class="icon">★</span>
				<span class="icon">★</span> 
				<span class="icon">★</span>
			</label>
			</div>
		</div>
		<br> 
		개별점수 4. <select name="grade_name4" id="grade_name4" class="select_name">
			<option value="">선택</option>
			<optgroup label="good" id="good4">
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
			<optgroup label="bad" id="bad4">
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
			<div id = "on_off_grade4">
			<label> <input type="radio" name="grade4" value="5" /> 
				<span class="icon">★</span>
			</label> 
			<label> <input type="radio" name="grade4" value="10" /> 
				<span class="icon">★</span> 
				<span class="icon">★</span>
			</label> 
			<label> <input type="radio" name="grade4" value="15" /> 
				<span class="icon">★</span> 
				<span class="icon">★</span> 
				<span class="icon">★</span>
			</label> 
			<label> <input type="radio" name="grade4" value="20" /> 
				<span class="icon">★</span> 
				<span class="icon">★</span> 
				<span class="icon">★</span>
				<span class="icon">★</span>
			</label> 
			<label> <input type="radio" name="grade4" value="25" /> 
				<span class="icon">★</span> 
				<span class="icon">★</span> 
				<span class="icon">★</span>
				<span class="icon">★</span> 
				<span class="icon">★</span>
			</label>
			</div>
		</div>	

		<br>
		<br> 
		hashtag1 : #<input type="text" name="hashtag1"><br>
		hashtag2 : #<input type="text" name="hashtag2"><br>
		hashtag3 : #<input type="text" name="hashtag3"><br>
		hashtag4 : #<input type="text" name="hashtag4"><br>
		hashtag5 : #<input type="text" name="hashtag5"><br>
		hashtag6 : #<input type="text" name="hashtag6"><br>
		<br> <br>
		<br> 
		<input type="submit" id="form-submit" value="확인"> 
		<input type="reset" value="취소">
	</form>

	<script>
	var formSubmitButton = document.querySelector("#form-submit");
	formSubmitButton.addEventListener('click', function() {
		var contents = document.querySelector("#board_content");
		// contents.value = editor.getMarkdown(); //markdown 저장
		contents.value = editor.getHtml(); //html 저장		
		$("option").prop("disabled" , false);//grade_name disabled 해제
		alert(contents.value);
	});
</script>

</body>
</html>