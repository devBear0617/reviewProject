<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
var pnum = 0;
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
		},
		error : function(error) {
			console.log(error);
		}
	});
}
</script>
<style type="text/css">
.de_ca {
	width: 200px;
	padding-top: 10px;
	padding-bottom: 20px;
	float: left;
}

.de_ca_st {
	margin-left: auto;
	margin-right: auto;
	width: 1200px;
	display: inline-block;
	background: linear-gradient(to right, #BCE55C, #E5D85C);
}

.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
</style>

<div class="center">
	<div class="de_ca_st">
		<c:forEach var="ca" items="${category}" varStatus="status">
			<div class="de_ca ${ca.ca_type} ${ca.ca_cd}"
				onclick="moreCaMovie(this)">${ca.ca_nm}</div>
		</c:forEach>
		<div class="detail2_category"></div>
	</div>
</div>
