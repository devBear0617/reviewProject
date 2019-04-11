function movieAutocomplete() {
	$("#movie_nm").autocomplete({
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
						item.title = item.title.replace(/<b>/gi, "").replace(/<\/b>/gi, "");
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
			if(ui.item.poster == ""){
	            ui.item.poster = "/review/movie/resources/image/default_poster.png";
	         }
			$("#movie_poster").attr("src", ui.item.poster);
			$("#movie_poster").show();
			$("#poster").val(ui.item.poster);
			$("#director").val(ui.item.director);
			$("#actor").val(ui.item.actor);
		}
	});
}