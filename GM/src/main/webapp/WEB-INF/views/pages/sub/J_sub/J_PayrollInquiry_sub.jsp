<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<form method="post" name="infoform">
	
	<!--
	cnt == 0 은 둘다 정보가 없을때
	cnt == 1 은 급여정보는 있으며 상여금 정보가 없을경우
	cnt == 2 은 둘다 정보가 있을때
	cnt2 == 상여여금 목록 불러오기
	  -->
	<table>
		<c:if test="${cnt == 0}">
			<tr>
				<th style="border-bottom: 1px #c0c0c0 solid;">지급기준일</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">사원번호</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">성명</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">부서</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">기본급</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">추가 및 삭감</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">지급총액</th>
			</tr>
			<tr>
				<td colspan="7" style="height: 150px;" text-align="center">
					*이번달 등록된 정보가 없습니다.</td>
			</tr>
			<tr>
				<td colspan="4">합계</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
			</tr>
		</c:if>
		
		
		<c:if test="${cnt == 2}">
			<tr>
				<th style="border-bottom: 1px #c0c0c0 solid;">지급기준일</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">사원번호</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">성명</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">부서</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">기본급</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">추가 및 삭감</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">지급총액</th>
			</tr>
			<c:forEach var="dto" items="${dtos}">
				<tr>
					<td>${dto.day}</td>
					<td>${dto.id}</td>
					<td>${dto.name}</td>
					<td>${dto.j_name}</td>
					<td>${dto.salary}</td>
					<td>${dto.bonussalary}</td>
					<td>${dto.sumsalarybonus}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4">합계</td>
				<td>${salary}</td>
				<td>${bonussalary}</td>
				<td>${sumsalarybonus}</td>
			</tr>
		</c:if>
		
		
		<c:if test="${cnt == 1}">
			<tr>
				<th style="border-bottom: 1px #c0c0c0 solid;">지급기준일</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">사원번호</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">성명</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">부서</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">기본급</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">추가 및 삭감</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">지급총액</th>
			</tr>
			<c:forEach var="dto" items="${dtos}">
				<tr>
					<td>${dto.day}</td>
					<td>${dto.id}</td>
					<td>${dto.name}</td>
					<td>${dto.j_name}</td>
					<td>${dto.salary}</td>
					<td>0</td>
					<td>${dto.salary}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4">합계</td>
				<td>${salary}</td>
				<td>0</td>
				<td>${salary}</td>
			</tr>
		</c:if>
	</table>
	
	<div class="subtitle mt60" style="margin-bottom: 10px;">
		<h3>추가 및 삭감 상세정보</h3>
	</div>
	<table>
		<c:if test="${cnt2 == 0 || cnt == 0}">
			<tr>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">번호</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">항목</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">사유</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">금액</th>
			</tr>
			<tr>
				<td colspan="4" style="height: 150px;" text-align="center">
					*추가 및 삭감데이터 정보가 없습니다.</td>
			</tr>
			<tr>
				<td colspan="4">합계</td>
			</tr>
		</c:if>
		
		
		<c:if test="${cnt > 0 && cnt2 > 0}">
			<tr>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">번호</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">항목</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">사유</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">금액</th>
			</tr>
			<c:forEach var="dto2" items="${dtos2}">
				<tr>
					<td>${dto2.num}</td>
					<td>${dto2.type}</td>
					<td>${dto2.content}</td>
					<td>${dto2.cost}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="3">합계</td>
				<td>${bonussalary}</td>
			</tr>
		</c:if>
	</table>
</form>