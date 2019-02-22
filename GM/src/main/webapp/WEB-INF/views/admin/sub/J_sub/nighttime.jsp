<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<table border="1">
	<tr>
		<td>등록번호</td>
		<td>사원번호</td>
		<td>성명</td>
		<td>직급</td>
		<td>부서</td>
		<td>근태종류</td>
		<td>근태시간</td>
		<td>근태일자</td>
	</tr>
	<c:if test="${cnt == 0}">
		<tr>
			<td colspan="8" style="height: 250px;">정보가 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${cnt > 0}">
		<c:forEach var="dtos" items="${dtos}">
			<tr>
				<td>${dtos.num}</td>
				<td>${dtos.id}</td>
				<td>${dtos.name}</td>
				<td>${dtos.rank_name}</td>
				<td>${dtos.j_name}</td>
				<td>야간근무</td>
				<td>${dtos.overtimes}</td>
				<td>${dtos.day}</td>
			</tr>
		</c:forEach>
	</c:if>
</table>