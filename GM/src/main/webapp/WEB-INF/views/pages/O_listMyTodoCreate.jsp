<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.content_result li {
		margin: 10px 0;
	}
	
	.content_result li input[id="cb"] {
		display: none;
	}
	
	.content_result li input[id="cb"] + label {
		display: inline-block;
		width: 20px;
		height: 20px;
		border: 2px solid #bcbcbc;
		border-radius: 3px;
		cursor: pointer;
	}
	
	.content_result li input[id="cb"]:checked + label {
		background-color: #bcbcbc;
		background-image: url("https://image.flaticon.com/icons/png/512/60/60731.png");
	}
</style>

<script>
	$(function(){
		$("#cb").click(function() {
			alert("확인");
		})
	});
</script>
<div class="content_result">
	<ul>
		<c:forEach var="dto" items="${dtos}">
			<li>
				<span style="width: 1507px; height: 48px; display: inline-block; padding: 13px 5px 5px 10px; border: 1px solid #c0c0c0; border-radius: 5px;">
					<span><input type="checkbox" id="cb" /><label for="cb"></label></span>
					<span class="ml10" style="font-size: 1.2em; position: relative; top: -4px;">${dto.content}</span>
				</span>
				<input type="button" id="tododel" value="삭제" onclick="window.location='<c:url value='/pages/W_deleteTodoPro?num=${dto.num}'/>'" class="ml2" style="font-size: 1.5em;border-radius: 4px; padding: 10px; position: relative;">
			</li>
		</c:forEach>	
	</ul>
</div>