<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$('.moveBT').click(function(){
    	$($(this).attr("data-target")).submit();
    });
})
</script>
</head>
<body>

<form id="writeForm" action="write" method="post" onsubmit="return check()">

<table id="write-form">
<tr>
    <td>제목</td>
    <td><input type="text" name="title" size="50" /></td>
</tr>
<tr>
    <td>
        <textarea name="content" rows="17" cols="20"></textarea>
    </td>
</tr>
</table>
<div>
    <input type="submit" value="전송" />
    <input type="button" value="목록" onclick="goList()" />
</div>
</form>


</body>
</html>