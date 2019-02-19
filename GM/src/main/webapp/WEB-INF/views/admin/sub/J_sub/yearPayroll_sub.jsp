<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<h2>${month}년도</h2>
<table border="1">
	<tr>
		<td></td>
		<td>기본급</td>
		<td>추가 및 삭감금</td>
		<td>실제 수령금액</td>
		<td>지급된 날짜</td>
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
			<td colspan="3" align="center">정보가 없습니다.</td>
		</tr>
		<tr>
				<td colspan="6"></td>
				<td>${dto.salary}</td>
				<td>0</td>
				<td></td>
			</tr>
	</c:if>
</table>