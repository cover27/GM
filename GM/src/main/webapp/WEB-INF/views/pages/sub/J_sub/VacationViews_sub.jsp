<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<form method="post" name="infoform">
	<table border="1">
			<tr>
				<td>사원번호</td>
				<td>성명</td>
				<td>직급</td>
				<td>입사일</td>
				<td>연차</td>
				<td>연차 설정횟수</td>
				<td>사용연차</td>
				<td>잔여연차</td>
				<td>휴가  설정횟수</td>
				<td>휴가 사용수</td>
				<td>잔여휴가</td>
			</tr>
			<c:forEach var="dto" items="${dtos}">
			<tr>
				<td>${dto.id}</td>
				<td>${dto.name}</td>
				<td>${dto.rank_name}</td>
				<td>${dto.enterday}</td>
				<td>${dto.year}</td>
				<td>${dto.annual}</td>
				<td>${dto.u_annual}</td>
				<td>${dto.n_annual}</td>
				<td>${dto.vacation}</td>
				<td>${dto.u_vacation}</td>
				<td>${dto.n_vacation}</td>
			</tr>
			</c:forEach>
		</table>
</form>