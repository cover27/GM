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
					<c:if test="${dtos.result == 1}">
								<td>${id}</td>
								<td>${name}</td>
								<td>${dtos.gos}</td>
								<td>${dtos.offs}</td>
								<td>${dtos.worktimes}</td>
								<td>${dtos.overtimes}</td>
								<td>${dtos.nighttimes}</td>
								<c:if test="${dtos.perceptiontimes ne '00:00'}">
									<td style="color: #d3292c;font-weight: bold;">${dtos.perceptiontimes}</td>
								</c:if>
								<c:if test="${dtos.perceptiontimes eq '00:00'}">
									<td>${dtos.perceptiontimes}</td>
								</c:if>
								<c:if test="${dtos.departuretimes ne '00:00'}">
									<td style="color: #d3292c;font-weight: bold;">${dtos.departuretimes}</td>
								</c:if>
								<c:if test="${dtos.departuretimes eq '00:00'}">
								<td>${dtos.departuretimes}</td>
								</c:if>
						</c:if>
						<c:if test="${dtos.result == 3}">
							<td>${id}</td>
							<td>${name}</td>
							<td colspan="7">휴가처리</td>
						</c:if>
						<c:if test="${dtos.result == 4}">
							<td>${id}</td>
							<td>${name}</td>
							<td>${dtos.gos}</td>
							<td>${dtos.offs}(반차)</td>
							<td>${dtos.worktimes}</td>
							<td>${dtos.overtimes}</td>
							<td>${dtos.nighttimes}</td>
							<c:if test="${dtos.perceptiontimes ne '00:00'}">
								<td style="color: #d3292c;font-weight: bold;">${dtos.perceptiontimes}</td>
							</c:if>
							<c:if test="${dtos.perceptiontimes eq '00:00'}">
								<td>${dtos.perceptiontimes}</td>
							</c:if>
							<c:if test="${dtos.departuretimes ne '00:00'}">
								<td style="color: #d3292c;font-weight: bold;">${dtos.departuretimes}</td>
							</c:if>
							<c:if test="${dtos.departuretimes eq '00:00'}">
							<td>${dtos.departuretimes}</td>
						</c:if>	
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${cnt > 1}">
					<td colspan="9" style="height: 384px;">출근관리 문제가 생겼습니다. 관리자에게 문의 하십시오.</td>
			</c:if>
		</tbody>
	</table>
</div>