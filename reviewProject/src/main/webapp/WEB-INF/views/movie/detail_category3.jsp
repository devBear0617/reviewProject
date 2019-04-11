<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.json.*" %>
<script type="text/javascript" src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/review/resources/script/category.js"></script>
<script type="text/javascript" src="/review/resources/script/pagenation.js?ver2"></script>
<style type="text/css">
.de_caM {
	width: 220px;
	height: 60px;
	padding: 10px;
	float: left;
	text-align: center;
}
.paging {
	margin-left: auto;
	margin-right: auto;
	text-decoration: none;
	font-size: large;
	width: 1100px;
	padding: 10px;
	font-size: large;
}
.de_ca_3 {
	background: linear-gradient(to right, #E4F7BA, #FAF4C0);
	width: 1200px;
	display: inline-block;
	margin-left: auto;
	margin-right: auto;
}
</style>
<div class="de_ca_3">
	<input type="hidden" id="de_ca_type" class="">
	<c:forEach var="movieNm" items="${movieNmList}" varStatus="status">
		<div class="de_caM" onclick="getMRList(this)">${movieNm}</div>
	</c:forEach>
	<hr style="width: 1100px;">
	
	<div class="paging">
		<c:if test="${pagination.prevPage ne 0}">
			<a href="#" onClick="fn_ca_paging('${pagination.prevPage}')">◀</a>
		</c:if>
		<c:forEach var="pnum" begin="${pagination.startPage}"
			end="${pagination.endPage}">
			<c:choose>
				<c:when test="${pnum eq  pagination.curPage}">
					<span style="font-weight: bold;">
						<a href="#" onClick="fn_ca_paging('${pnum}')">${pnum}</a>
					</span>
				</c:when>
				<c:otherwise>
					<a href="#" onClick="fn_ca_paging('${pnum}')">${pnum}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pagination.endPage <= pagination.pageCnt}">
			<a href="#" onClick="fn_ca_paging('${pagination.nextPage}')">▶</a>
		</c:if>
	</div>
</div>
