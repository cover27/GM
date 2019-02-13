<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<form method="post" name="infoform">
	<table border="1">
		<c:if test="${cnt == 0}">
			<tr>
				<td>지급기준일</td>
				<td>사원번호</td>
				<td>성명</td>
				<td>부서</td>
				<td>지급총액</td>
				<td>공제총액</td>
				<td>실지급액</td>
			</tr>
			<tr>
				<td colspan="7" style="height: 150px;" text-align="center">
				*데이터 정보가 없습니다.!!!!!!!
				</td>
			</tr>
			<tr>
				<td colspan="4">합계</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
			</tr>
		</c:if>
		<c:if test="${cnt > 0}">
			<c:forEach var="dto" items="${dtos}">
				<tr>
					<td>지급기준일</td>
					<td>사원번호</td>
					<td>성명</td>
					<td>부서</td>
					<td>지급총액</td>
					<td>공제총액</td>
					<td>실지급액</td>
				</tr>
				<tr>
					<td>${dto.day}</td>
					<td>${dto.id}</td>
					<td>${dto.name}</td>
					<td>${dto.j_name}</td>
					<td>${dto.salary}</td>
					<td>${dto.bonussalary}</td>
					<td>${Sumsalarybonus}</td>
				</tr>
				<tr>
					<td colspan="4">합계</td>
					<td>${dto.salary}</td>
					<td>${dto.bonussalary}</td>
					<td>${Sumsalaybonus}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</form>