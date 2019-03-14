<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="/review/resources/script/jquery-2.1.1.js"></script>
<script type="text/javascript">
	var pnum = 0;
	function moreCaMovie(e) {
		var de_category_type = $(e).attr('class');

		$.ajax({
			type : 'POST',
			url : "./moreCaMovie",
			cache : false,
			data : {
				'de_category_type' : de_category_type,
				'pnum' : 1
			},
			success : function(html) {
				$('.detail2_category').empty();
				$('.detail2_category').append(html);
				$('.detail2_category').find('.de_ca_type').attr('id',
						de_category_type);
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
</script>
<style type="text/css">
.de_ca {
	background-color: gray;
	width: 300px;
	float: left;
}
</style>
<c:forEach var="dcNm" items="${nm}" varStatus="status">
	<div class="de_ca ${ca_type} ${cd[status.index]}"
		onclick="moreCaMovie(this)">${dcNm}</div>
</c:forEach>
<div class="detail2_category"></div>
