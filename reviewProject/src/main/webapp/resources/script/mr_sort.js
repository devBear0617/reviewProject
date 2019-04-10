$('.sort').click(function() {
	var movie_nm = $('.movieinfo_2').html();
	var data = {
		'sort_id' : $(this).attr('id'),
		'movie_nm' : movie_nm,
		'start_content' : 0,
		'end_content' : 9
	}
	
	$.ajax({
		type : "POST",
		url : "./oneContentView",
		cache : false,
		data : data,
		success : function(html) {
			$('.contentList').empty();
			$('.contentList').append(html);

		}
	});
});