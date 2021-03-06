<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${path}css/J_style.css" />
<h3 class="mt20 mb10">${cntyear}년도</h3>
<div style="border-top: 2px #c0c0c0 solid;">
	<table>
		<tr>
			<th style="border-bottom: 1px #c0c0c0 solid;"></th>
			<th style="border-bottom: 1px #c0c0c0 solid;">사원 번호</th>
			<th style="border-bottom: 1px #c0c0c0 solid;">사원 이름</th>
			<th style="border-bottom: 1px #c0c0c0 solid;">부서</th>
			<th style="border-bottom: 1px #c0c0c0 solid;">회사명</th>
			<th style="border-bottom: 1px #c0c0c0 solid;">연차</th>
			<th style="border-bottom: 1px #c0c0c0 solid;">지급날짜</th>
			<th style="border-bottom: 1px #c0c0c0 solid;">기본급</th>
			<th style="border-bottom: 1px #c0c0c0 solid;">추가 및 삭감금</th>
			<th style="border-bottom: 1px #c0c0c0 solid;">실제 수령금액</th>
		</tr>
		<c:if test="${cnt > 0}">
			<c:forEach var="dto" items="${dtos}">
				<tr id="ttr">
					<td>${dto.salaryday}월</td>
					<td>${dto.id}</td>
					<td>${dto.name}</td>
					<c:if test="${dto.g_name == null }">
					<td>${dto.c_name}</td>
					</c:if>
					<c:if test="${dto.g_name != null }">
					<td>${dto.g_name}</td>
					</c:if>
					<td>${dto.c_name}</td>
					<td>${dto.year}</td>
					<td>${dto.day}</td>
					<td><fmt:formatNumber value="${dto.salary}" pattern="#,###" />원</td>
					<td><fmt:formatNumber value="${dto.bonussalary}" pattern="#,###" />원</td>
					<td><fmt:formatNumber value="${dto.sumsalarybonus}" pattern="#,###" />원</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="7"></td>
				<td><fmt:formatNumber value="${allsalary}" pattern="#,###" />원</td>
				<td><fmt:formatNumber value="${bonussalary}" pattern="#,###" />원</td>
				<td><fmt:formatNumber value="${sumsalarybonus}" pattern="#,###" />원</td>
			</tr>
		</c:if>
		<!-- 게시글이 없으면 -->
		<c:if test="${cnt == 0}">
			<tr>
				<td colspan="10" align="center">정보가 없습니다.</td>
			</tr>
			<tr>
					<td colspan="7"></td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
				</tr>
		</c:if>
	</table>
</div>
<div style="height: 20px; margin-top: 20px;">
	<span class="fleft"><input type="button" onclick="searchPayroll2('${year}')" value="&lt;&lt; 이전년도검색"></span>
	<span class="fright"><input type="button" onclick="searchPayroll3('${year}')" value="다음년도검색 &GT;&GT;"></span>
</div>