<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<table border="1">
	<c:if test="${cnt == 0}">
		<tr>
			<td style="text-align: center; background-color: #cccccc;">급여번호</td>
			<td style="text-align: center; background-color: #cccccc;">아이디</td>
			<td style="text-align: center; background-color: #cccccc;">지급일</td>
			<td style="text-align: center; background-color: #cccccc;">상태</td>
			<td style="text-align: center; background-color: #cccccc;">지급액</td>
		</tr>

		<tr>
			<td colspan="5" style="height: 150px;" text-align="center">*데이터
				정보가 없습니다.</td>
		</tr>
		<tr>
			<td colspan="4">합계</td>
			<td>0</td>
		</tr>
	</c:if>


	<c:if test="${cnt > 0}">
		<tr>
			<td style="text-align: center; background-color: #cccccc;">급여번호</td>
			<td style="text-align: center; background-color: #cccccc;">아이디</td>
			<td style="text-align: center; background-color: #cccccc;">지급일</td>
			<td style="text-align: center; background-color: #cccccc;">상태</td>
			<td style="text-align: center; background-color: #cccccc;">지급액</td>
		</tr>
		<c:forEach var="dto" items="${dtos}">
			<tr>
				<td>${dto.sal_num}</td>
				<td>${dto.id}</td>
				<td>${dto.day}</td>
				<td>${dto.state}</td>
				<td>${dto.salary}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4">합계</td>
			<td>${Sumsalaybonus}</td>
		</tr>
	</c:if>
</table>