<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content_result">
	<ul>
		<c:forEach var="dto" items="${dtos}">
			<li>
				<span>${dto.content}</span>
				<input type="button" value="삭제">
			</li>
		</c:forEach>	
	</ul>
</div>