function moreCategory(e) {
	var data = {
		'category_type' : $(e).attr('class')
	};

	$.ajax({
		type : 'POST',
		url : "./moreCategory",
		data : data,
		success : function(html) {
			$('.detail_category').empty();
			$('.detail_category').append(html);
		},
		error : function(error) {
			console.log(error);
		}
	});
}

function moreCaMovie(e) {
	var de_category_type = $(e).attr('class').split(" ");
	var de_ca_type = de_category_type[1];
	var cd = de_category_type[2];
	
	$.ajax({
		type : 'POST',
		url : "./moreCaMovie",
		data : {
			'de_ca_type' : de_ca_type,
			'nm' : $(e).html(),
			'cd' : cd,
			'pnum' : 1
		},
		success : function(html) {
			$('.detail2_category').empty();
			$('.detail2_category').append(html);
			$('.detail2_category').find('#de_ca_type').addClass(de_ca_type);
			$('.detail2_category').find('#de_ca_type').addClass(cd);
			$('.detail2_category').find('#de_ca_type').addClass($(e).html());
		},
		error : function(error) {
			console.log(error);
		}
	});
}

function getMRList(e){
	var movie_cd = $(e).attr('class').split(" ")[1];
	var movie_nm = $(e).html();

	$.ajax({
		type : 'POST',
		url : "./movieInfoView",
		data : {
			'movie_cd' : movie_cd,
			'movie_nm' : movie_nm
		},
		success : function(html) {
			$('.movie_info').empty();
			$('.movie_info').append(html);
			
			$.ajax({
				type : 'POST',
				url : "./oneContentView",
				data : {
					"sort_id" : "sort_time",
					'movie_nm' : movie_nm,
					'start_content' : 0,
					'end_content' : 9,
					'pnum' : 1
				},
				success : function(html) {
					$('.contentList').empty();
					$('.contentList').append(html);
				},
				error : function(error) {
					console.log(error);
				}
			})
			
			$.ajax({
				type : 'POST',
				url : "./bestContent",
				data : {
					"sort_id" : "sort_likeit",
					'movie_nm' : movie_nm,
					'start_content' : 0,
					'end_content' : 3					
				},
				success : function(html) {
					$('.best_contentList').empty();
					$('.best_contentList').append(html);
				},
				error : function(error) {
					console.log(error);
				}
			})
		},
		error : function(error) {
			console.log(error);
		}
	})
}
