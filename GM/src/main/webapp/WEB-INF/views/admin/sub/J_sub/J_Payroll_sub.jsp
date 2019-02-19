<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>

<div><input type="button" onclick="searchPayroll2('${year}')" value="이전년도검색"></div>
<div><input type="button" onclick="searchPayroll3('${year}')" value="다음년도검색"></div>
<h2>${cntyear}년도</h2>
<table border="1">
	<tr>
		<td></td>
		<td>사원 번호</td>
		<td>사원 이름</td>
		<td>부서</td>
		<td>회사명</td>
		<td>연차</td>
		<td>기본급</td>
		<td>추가 및 삭감금</td>
		<td>실제 수령금액</td>
		<td>지급날짜</td>
	</tr>
	<c:if test="${cnt > 0}">
		<c:forEach var="dto" items="${dtos}">
			<tr id="ttr">
				<td>${dto.salaryday}월</td>
				<td>${dto.id}</td>
				<td>${dto.name}</td>
				<td>${dto.g_name}</td>
				<td>${dto.c_name}</td>
				<td>${dto.year}</td>
				<td>${dto.salary}</td>
				<td>${dto.bonussalary}</td>
				<td>${dto.sumsalarybonus}</td>
				<td>${dto.day}</td>
			</tr>
		</c:forEach>
		<tr>
				<td colspan="6"></td>
				<td>${allsalary}</td>
				<td>${bonussalary}</td>
				<td>${sumsalarybonus}</td>
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