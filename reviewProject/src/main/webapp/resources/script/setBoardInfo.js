function settingGrade() {
	var grade_name1 = $("#grade_name1").val(), 
		grade_name2 = $("#grade_name2").val(), 
		grade_name3 = $("#grade_name3").val(),
		grade_name4 = $("#grade_name4").val();

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
}

function settingGradeForUpdate() {
	$('input:radio[name="recommend"]:input[value='+ $(recommend_val)
			.val() + ']').attr("checked",true);
	$('input:radio[name="grade1"]:input[value=' + $(grade1_val)
			.val() + ']').attr("checked",true);
	$('input:radio[name="grade2"]:input[value='+ $(grade2_val)
			.val() + ']').attr("checked",true);
	$('input:radio[name="grade3"]:input[value=' + $(grade3_val)
			.val() + ']').attr("checked",true);
	$('input:radio[name="grade4"]:input[value='+ $(grade4_val)
			.val() + ']').attr("checked",true);
	
	var value = $(grade1_val).val()+ $(grade2_val).val()+ $(grade3_val).val()+ $(grade4_val).val();
	if(value >= 80){  
		$("#lemon_grade_img").attr("src", "/review/movie/resources/image/REMON_grade_1.png");
		$('.lemon_grade_name').html("달콤한 레몬");
	}else if(value >= 60){
		$("#lemon_grade_img").attr("src", "/review/movie/resources/image/REMON_grade_2.png");										
		$('.lemon_grade_name').html("새콤한 레몬");
	}else if(value >= 40){
		$("#lemon_grade_img").attr("src", "/review/movie/resources/image/REMON_grade_3.png");										
		$('.lemon_grade_name').html("신맛 레몬");
	}else if(value >= 20){
		$("#lemon_grade_img").attr("src", "/review/movie/resources/image/REMON_grade_4.png");									
		$('.lemon_grade_name').html("씁쓸한 레몬");
	}else {
		$("#lemon_grade_img").attr("src", "/review/movie/resources/image/REMON_grade_5.png");										
		$('.lemon_grade_name').html("썩은 레몬");
	}

	$("#grade_name1").val($(grade_name1_val).val());
	$("#grade_name2").val($(grade_name2_val).val());
	$("#grade_name3").val($(grade_name3_val).val());
	$("#grade_name4").val($(grade_name4_val).val());
}

function changeGrade() {
	var $select = $("select");

	$select.on("change", function() {
		//grade 값 초기화 
		var id = this.id
		if (id == "grade_name1") {
			$("#on_off_grade1").css('visibility',
					'visible');
			$(":radio[name='grade1']").prop(
					"checked", false);
		} else if (id == "grade_name2") {
			$("#on_off_grade2").css('visibility',
					'visible');
			$(":radio[name='grade2']").prop(
					"checked", false);
		} else if (id == "grade_name3") {
			$("#on_off_grade3").css('visibility',
					'visible');
			$(":radio[name='grade3']").prop(
					"checked", false);
		} else {
			$("#on_off_grade4").css('visibility',
					'visible');
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
		if(value >= 80){
			$("#lemon_grade_img").attr("src", "/review/movie/resources/image/REMON_grade_1.png");
			$('.lemon_grade_name').html("달콤한 레몬");
		}else if(value >= 60){
			$("#lemon_grade_img").attr("src", "/review/movie/resources/image/REMON_grade_2.png");										
			$('.lemon_grade_name').html("새콤한 레몬");
		}else if(value >= 40){
			$("#lemon_grade_img").attr("src", "/review/movie/resources/image/REMON_grade_3.png");										
			$('.lemon_grade_name').html("신맛 레몬");
		}else if(value >= 20){
			$("#lemon_grade_img").attr("src", "/review/movie/resources/image/REMON_grade_4.png");									
			$('.lemon_grade_name').html("씁쓸한 레몬");
		}else {
			$("#lemon_grade_img").attr("src", "/review/movie/resources/image/REMON_grade_5.png");										
			$('.lemon_grade_name').html("썩은 레몬");
		}
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
}

function changeRating() {
	$(".rating").change(function() {
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

		var selected3 = $("option:selected", $("#grade_name3"));
		if (selected3.parent()[0].id == "bad3") {
			grade3 = 25 - grade3;
		}

		var selected4 = $("option:selected", $("#grade_name4"));
		if (selected4.parent()[0].id == "bad4") {
			grade4 = 25 - grade4;
		}

		$("#lemon_grade").val(grade1 + grade2 + grade3 + grade4);
		var value = $("#lemon_grade").val();
		if(value >= 80){
			$("#lemon_grade_img").attr("src", "/review/movie/resources/image/REMON_grade_1.png");
			$('.lemon_grade_name').html("달콤한 레몬");
		}else if(value >= 60){
			$("#lemon_grade_img").attr("src", "/review/movie/resources/image/REMON_grade_2.png");										
			$('.lemon_grade_name').html("새콤한 레몬");
		}else if(value >= 40){
			$("#lemon_grade_img").attr("src", "/review/movie/resources/image/REMON_grade_3.png");										
			$('.lemon_grade_name').html("신맛 레몬");
		}else if(value >= 20){
			$("#lemon_grade_img").attr("src", "/review/movie/resources/image/REMON_grade_4.png");									
			$('.lemon_grade_name').html("씁쓸한 레몬");
		}else {
			$("#lemon_grade_img").attr("src", "/review/movie/resources/image/REMON_grade_5.png");										
			$('.lemon_grade_name').html("썩은 레몬");
		}
		$('.total_value').html(value);
	});
}

function submitButton(){
	var formSubmitButton = document.querySelector("#form-submit");
	var contents = document.querySelector("#board_content");
	contents.value = editor.getHtml();		
	$("option").prop("disabled", false);//grade_name disabled 해제

	alert("저장하시겠습니까?");
}