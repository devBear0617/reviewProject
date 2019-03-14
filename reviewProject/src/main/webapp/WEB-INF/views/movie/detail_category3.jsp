<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/review/resources/script/jquery-2.1.1.js"></script>
<script type="text/javascript">
/* var pageNum = 0;	
function moreCaMovie(e) {
	pnum = pnum+1;
	console.log(pnum);
	var data = {
		'de_category_type' : $(e).attr('class'),
		'pnum' : pnum
	};
		
	$.ajax({
		type : 'POST',
		url : "./moreCaMovie",
		cache : false,
		data : data,
		success : function(html) {
			$('.detail_category').empty();
			$('.detail_category').append(html);
		},
		error : function(error) {
			console.log(error);
		}
	});
} */
</script>
<style type="text/css">
.de_caM{
	float:left; 
	width: 300px;
}
</style>
<c:forEach var="mNm" items="${movieNm}" varStatus="status">
	<div class="de_caM ${movieCd[status.index]}" onclick="moreCaMovie(this)">${mNm}</div>
</c:forEach>
<div></div>