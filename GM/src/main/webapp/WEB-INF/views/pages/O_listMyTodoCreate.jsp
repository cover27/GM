<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content_result">
	<ul>
		<c:forEach var="dto" items="${dtos}">
			<li>
				<span>${dto.content}</span>
				<input type="button" id="tododel" value="삭제" onclick="window.location='<c:url value='/pages/W_deleteTodoPro?num=${dto.num}'/>'">
			</li>
		</c:forEach>	
	</ul>
</div>