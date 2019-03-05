<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${path}css/O_style.css" />
<script>
function complate(num) {
	
	var url = "W_updateTodoPro?num=" + num;
	
	window.location = url;
}
</script>
<div class="content_result">
	<ul>
		<c:forEach var="dto" items="${dtos}">
			<script>console.log("${dto.content} / ${dto.complate}");</script>
			<li>
				<c:if test="${dto.complate == 0}">
					<span style="width: 1500px; height: 48px; display: inline-block; padding: 13px 5px 5px 10px; border: 1px solid #c0c0c0; border-radius: 5px;">
						<span><input type="checkbox" id="${dto.num}" name="${dto.num}" onclick="complate('${dto.num}')" /><label for="${dto.num}" class="chkbox"></label></span>
						<span class="ml10" style="font-size: 1.2em; position: relative; top: -4px;">${dto.content}</span>
					</span>
					<input type="button" id="tododel" value="삭제" onclick="window.location='<c:url value='/pages/W_deleteTodoPro?num=${dto.num}'/>'" class="ml2" style="font-size: 1.5em;border-radius: 4px; padding: 10px; position: relative;">
				</c:if>
				<c:if test="${dto.complate != 0}">
					<span style="width: 1500px; height: 48px; display: inline-block; padding: 13px 5px 5px 10px; border: 1px solid #c0c0c0; border-radius: 5px; background: #f7f7f7;">
						<span><input type="checkbox" id="${dto.num}" name="${dto.num}" onclick="complate('${dto.num}')" checked /><label for="${dto.num}" class="chkbox"></label></span>
						<span class="ml10" style="font-size: 1.2em; position: relative; top: -4px; text-decoration: line-through; text-decoration-color: #111;">${dto.content} (완료됨)</span>
					</span>
					<input type="button" id="tododel" value="삭제" onclick="window.location='<c:url value='/pages/W_deleteTodoPro?num=${dto.num}'/>'" class="ml2" style="font-size: 1.5em;border-radius: 4px; padding: 10px; position: relative;">
				</c:if>
			</li>
		</c:forEach>	
	</ul>
</div>