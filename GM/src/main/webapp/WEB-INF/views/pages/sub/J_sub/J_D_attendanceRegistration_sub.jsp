<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<input type="button" value="출근" onclick="error()">
<input type="button" value="퇴근" onclick="off('${num}','${gos}')">
<table border="1">
	<tr>
		<td>사원 번호</td>
		<td>성명</td>
		<td>출근시간</td>
		<td>퇴근시간</td>
		<td>근무시간</td>
		<td>연장근로</td>
		<td>야간근로</td>
		<td>지각시간</td>
		<td>조퇴시간</td>
	</tr>
	<c:if test="${cnt == 0}">
		<tr>
			<td></td>
			<td>${id}</td>
			<td>${name}</td>
			<td>00:00</td>
			<td>00:00</td>
			<td>00:00</td>
			<td>00:00</td>
			<td>00:00</td>
			<td>00:00</td>
			<td>00:00</td>
		</tr>
	</c:if>
	<c:if test="${cnt > 0}">
		<c:forEach var="dtos" items="${dtos}">
			<td>${id}</td>
			<td>${name}</td>
			<c:if test="${fn:length(dtos.gos) > 0 }"><td>${dtos.gos}</td></c:if>
			<c:if test="${fn:length(dtos.gos) == 0 }"><td>00:00</td></c:if>
			<c:if test="${fn:length(dtos.offs) > 0 }"><td>${dtos.offs}</td></c:if>
			<c:if test="${fn:length(dtos.offs) == 0 }"><td>00:00</td></c:if>
			<c:if test="${fn:length(dtos.worktimes) > 0 }"><td>${dtos.worktimes}</td></c:if>
			<c:if test="${fn:length(dtos.worktimes) == 0 }"><td>00:00</td></c:if>
			<c:if test="${fn:length(dtos.overtimes) > 0 }"><td>${dtos.overtimes}</td></c:if>
			<c:if test="${fn:length(dtos.overtimes) == 0 }"><td>00:00</td></c:if>
			<c:if test="${fn:length(dtos.nighttimes) > 0 }"><td>${dtos.nighttimes}</td></c:if>
			<c:if test="${fn:length(dtos.nighttimes) == 0 }"><td>00:00</td></c:if>
			<c:if test="${fn:length(dtos.perceptiontimes) > 0 }"><td>${dtos.perceptiontimes}</td></c:if>
			<c:if test="${fn:length(dtos.perceptiontimes) == 0 }"><td>00:00</td></c:if>
			<c:if test="${fn:length(dtos.departuretimes) > 0 }"><td>${dtos.departuretimes}</td></c:if>
			<c:if test="${fn:length(dtos.departuretimes) == 0 }"><td>00:00</td></c:if>
		</c:forEach>
	</c:if>
</table>