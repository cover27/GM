<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div>
	*근무일자<input type="date" id="date"><input type="button"value="검색">
</div>
<br> <br> 
<table border="1">
<tr>
	<c:forEach var="dtos" items="${dtos}">
		<tr><td>등록번호</td><td>${dtos.num}</td></tr>
		<tr><td>사원 번호</td><td>${dtos.id}</td></tr>	
		<tr><td>성명</td><td>${dtos.name}</td></tr>
		<tr><td>출근시간</td><c:if test="${fn:length(dtos.gos) > 0 }"><td>${dtos.gos}</td></c:if></tr>	
		<tr><td>출근시간</td><c:if test="${fn:length(dtos.gos) == 0 }"><td>00:00</td></c:if></tr>
		<tr>퇴근시간<c:if test="${fn:length(dtos.offs) > 0 }"><td>${dtos.offs}</td></c:if></tr>
		<tr>퇴근시간<c:if test="${fn:length(dtos.offs) == 0 }"><td>00:00</td></c:if></tr>
		<tr>근무시간<c:if test="${fn:length(dtos.worktimes) > 0 }"><td>${dtos.worktimes}</td></c:if></tr>
		<tr>근무시간<c:if test="${fn:length(dtos.worktimes) == 0 }"><td>00:00</td></c:if></tr>
		<tr>연장근로<c:if test="${fn:length(dtos.overtimes) > 0 }"><td>${dtos.overtimes}</td></c:if></tr>
		<tr>연장근로<c:if test="${fn:length(dtos.overtimes) == 0 }"><td>00:00</td></c:if>
		<tr>야간근로<c:if test="${fn:length(dtos.nighttimes) > 0 }"><td>${dtos.nighttimes}</td></c:if></tr>
		<tr>야간근로<c:if test="${fn:length(dtos.nighttimes) == 0 }"><td>00:00</td></c:if></tr>
		<tr>지각시간<c:if test="${fn:length(dtos.perceptiontimes) > 0 }"><td>${dtos.perceptiontimes}</td></c:if></tr>
		<tr>지각시간<c:if test="${fn:length(dtos.perceptiontimes) == 0 }"><td>00:00</td></c:if></tr>
		<tr>조퇴시간<c:if test="${fn:length(dtos.departuretimes) > 0 }"><td>${dtos.departuretimes}</td></c:if></tr>
		<tr>조퇴시간<c:if test="${fn:length(dtos.departuretimes) == 0 }"><td>00:00</td></c:if></tr>
		<tr><td><input type="button" value="변경" onclick="modify('${dtos.num}')"></td></tr>
	</c:forEach>
</tr>
</table>