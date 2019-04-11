function fn_ca_paging(pnum) {
	var de_category_type = $('#de_ca_type').attr('class').split(" ");
	var de_ca_type = de_category_type[0];
	var cd = de_category_type[1];
	var nm = de_category_type[2];
	console.log("de_category_type : "+de_category_type.toString());
	console.log("nm : "+nm);
	
	$.ajax({
		type : 'POST',
		url : "./moreCaMovie",
		data : {
			'de_ca_type' : de_ca_type,
			'nm' : nm,
			'cd' : cd,
			'pnum' : pnum
		},
		success : function(html) {
			$('.detail2_category').empty();
			$('.detail2_category').append(html);
			$('.detail2_category').find('#de_ca_type').addClass(de_ca_type);
			$('.detail2_category').find('#de_ca_type').addClass(cd);
		},
		error : function(error) {
			console.log(error);
		}
	})
}

function fn_mr_paging(pnum) {
	var movie_nm = $('.movieinfo_2').html();

	$.ajax({
		type : 'POST',
		url : "./oneContentView",
		data : {
			'pnum' : pnum,
			'movie_nm' : movie_nm,
			'start_content' : 0,
			'end_content' : 9
		},
		success : function(html) {
			$('.contentList').empty();
			$('.contentList').append(html);
		},
		error : function(error) {
			console.log(error);
		}
	})
}