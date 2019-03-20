<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
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
</script>
<style type="text/css">
td {
	width: 150px;
}

.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.category {
	height: 200px;
	width: 1200px;
	background: linear-gradient(to right, #abf200, #ffe400);
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

img[class^="cg_img"] {
	height: 150px;
}

.detail_category::after {
	clear: both;
}

.table_st {
	margin-left: auto;
	margin-right: auto;
	width: 1000px;
	text-align: center;
	padding-top: 20px;
}
</style>
<div class="category">
	<table class="table_st">
		<tr>
			<td><img class="cg_img_genre"
				src="/review/resources/image/test.png" onclick="moreCategory(this)">
			</td>
			<td><img class="cg_img_cnt"
				src="/review/resources/image/test.png" onclick="moreCategory(this)">
			</td>
			<td><img class="cg_img_dt"
				src="/review/resources/image/test.png" onclick="moreCategory(this)">
			</td>
			<!-- <td>
			<img class="cg_img_actor" src="/review/resources/image/test.png" onclick="moreCategory(this)">
		</td>
		<td>
			<img class="cg_img_director" src="/review/resources/image/test.png" onclick="moreCategory(this)">
		</td> -->
			<td><img class="cg_img_movieType"
				src="/review/resources/image/test.png" onclick="moreCategory(this)">
			</td>
			<td><img class="cg_img_nation"
				src="/review/resources/image/test.png" onclick="moreCategory(this)">
			</td>
		</tr>
	</table>
</div>
<div class="detail_category"></div>
