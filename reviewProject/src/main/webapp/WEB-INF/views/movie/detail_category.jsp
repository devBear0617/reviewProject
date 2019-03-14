<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="/review/resources/script/jquery-2.1.1.js"></script>
<script type="text/javascript">
function moreCategory(e) {
	var data = {
		'category_type' : $(e).attr('class')
	};
		
	$.ajax({
		type : 'POST',
		url : "./moreCategory",
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
}
</script>
<style type="text/css">
td {
	/* width: 300px; */
}

.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.category {
	height: 150px; 
	background-color: #EAEAEA;
}
img[class^="cg_img"]{
	height: 150px;
}
.detail_category::after {
	clear: both;
}
</style>
<div class="category center">
<table class="center">
	<tr>
		<td>
			<img class="cg_img_genre" src="/review/resources/image/test.png" onclick="moreCategory(this)">
		</td>
		<td>
			<img class="cg_img_cnt" src="/review/resources/image/test.png" onclick="moreCategory(this)">
		</td>
		<td>
			<img class="cg_img_dt" src="/review/resources/image/test.png" onclick="moreCategory(this)">
		</td>
		<!-- <td>
			<img class="cg_img_actor" src="/review/resources/image/test.png" onclick="moreCategory(this)">
		</td>
		<td>
			<img class="cg_img_director" src="/review/resources/image/test.png" onclick="moreCategory(this)">
		</td> -->
		<td>
			<img class="cg_img_movieType" src="/review/resources/image/test.png" onclick="moreCategory(this)">
		</td>
		<td>
			<img class="cg_img_nation" src="/review/resources/image/test.png" onclick="moreCategory(this)">
		</td>
	</tr>
</table>
</div>
<div class="detail_category"> </div>
