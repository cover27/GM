<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<input type="button" value="출근" onclick="error()">
<input type="button" value="퇴근" onclick="off('${num}','${gos}')">
<div class="table_top">
	<table>
		<colgroup>
			<col width="177px" />
			<col width="178px" />
			<col width="175px" />
			<col width="175px" />
			<col width="175px" />
			<col width="175px" />
			<col width="175px" />
			<col width="175px" />
			<col width="*" />
		</colgroup>
		<thead>
			<tr>
				<th>사원 번호</th>
				<th>성명</th>
				<th>출근시간</th>
				<th>퇴근시간</th>
				<th>근무시간</th>
				<th>연장근로</th>
				<th>야간근로</th>
				<th>지각시간</th>
				<th>조퇴시간</th>
			</tr>
		</thead>
	</table>
</div>
<div class="salary_info">
	<table>
	<colgroup>
		<col width="177px" />
		<col width="178px" />
		<col width="175px" />
		<col width="175px" />
		<col width="175px" />
		<col width="175px" />
		<col width="175px" />
		<col width="175px" />
		<col width="*" />
	</colgroup>
		<tbody>
			<c:if test="${cnt == 0}">
				<tr>
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
			<c:if test="${cnt == 1}">
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
			<c:if test="${cnt > 1}">
					<td colspan="9" style="height: 384px;">출근관리 문제가 생겼습니다. 관리자에게 문의 하십시오.</td>
			</c:if>
		</tbody>
	</table>
</div>