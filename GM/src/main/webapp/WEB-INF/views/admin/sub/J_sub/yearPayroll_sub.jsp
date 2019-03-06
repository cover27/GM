<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<h3>${month}년도</h3>
<table class="mt10" style="border-top: 2px #c0c0c0 solid;">
	<tr>
		<th></th>
		<th>기본급</th>
		<th>추가 및 삭감금</th>
		<th>실제 수령금액</th>
		<th>지급된 날짜</th>
	</tr>
	<c:if test="${cnt > 0}">
		<c:forEach var="dto" items="${dtos}">
			<tr id="ttr">
				<td>${dto.salaryday}월</td>
				<td>${dto.salary}</td>
				<td>${dto.bonussalary}</td>
				<td>${dto.sumsalarybonus}</td>
				<td>${dto.day}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="1"></td>
			<td>${allsalary}</td>
			<td>${allbonussalary}</td>
			<td>${allsumsalarybonus}</td>
			<td></td>
		</tr>
	</c:if>
	<!-- 게시글이 없으면 -->
	<c:if test="${cnt == 0}">
		<tr>
			<td colspan="5" align="center">정보가 없습니다.</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td>${dto.salary}</td>
			<td>0</td>
			<td></td>
		</tr>
	</c:if>
</table>