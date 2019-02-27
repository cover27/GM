<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<form method="post" name="infoform">
	<table>
		<c:if test="${cnt == 0}">
			<tr>
				<th style="border-bottom: 1px #c0c0c0 solid;">등록기준일</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">사원번호</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">성명</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">부서</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">추가 및 삭감구분</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">사유</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">지급액</th>
			</tr>
			<tr>
				<td colspan="7">
					*지급 처리된 정보가 없습니다.!!!!!!!
				</td>
			</tr>
			<tr>
				<td colspan="6">합계</td>
				<td>0</td>
			</tr>
		</c:if>



		<c:if test="${cnt > 0}">
			<tr>
				<th style="border-bottom: 1px #c0c0c0 solid;">등록기준일</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">사원번호</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">성명</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">부서</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">추가 및 삭감구분</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">사유</th>
				<th style="border-bottom: 1px #c0c0c0 solid;">지급액</th>
			</tr>
			<c:forEach var="dto" items="${dtos}">
				<tr>
					<td>${dto.day}</td>
					<td>${dto.id}</td>
					<td>${dto.name}</td>
					<td>${dto.j_name}</td>
					<td>${dto.type}</td>
					<td>${dto.content}</td>
					<td><fmt:formatNumber value="${dto.cost}" pattern="#,###" />원</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6" style="border-bottom: 1px #c0c0c0 solid;">합계</td>
				<td style="border-bottom: 1px #c0c0c0 solid;"><fmt:formatNumber value="${bonussalary}" pattern="#,###" />원</td>
			</tr>
		</c:if>
	</table>
	
	<div class="subtitle mt60" style="margin-bottom: 10px;">
		<h3>추가 및 삭감 미지급 목록</h3>
	</div>
	
	<table>
		<c:if test="${cnt2 == 0}">
			<tr>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">등록기준일</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">사원번호</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">성명</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">부서</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">추가 및 삭감구분</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">사유</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">지급액</th>
			</tr>
			<tr>
				<td colspan="7">
					지급처리가 안된  정보가 없습니다.
				</td>
			</tr>
			<tr>
				<td colspan="6" style="border-bottom: 1px #c0c0c0 solid;">합계</td>
				<td style="border-bottom: 1px #c0c0c0 solid;">0</td>
			</tr>
		</c:if>
		
		
		<c:if test="${cnt2 > 0}">
			<tr>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">등록기준일</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">사원번호</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">성명</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">부서</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">추가 및 삭감구분</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">사유</th>
				<th style="border-bottom: 1px #c0c0c0 solid;border-top: 2px #c0c0c0 solid;">지급액</th>
			</tr>
			<c:forEach var="dto" items="${dtos2}">
				<tr>
					<td>${dto.day}</td>
					<td>${dto.id}</td>
					<td>${dto.name}</td>
					<td>${dto.j_name}</td>
					<td>${dto.type}</td>
					<td>${dto.content}</td>
					<td><fmt:formatNumber value="${dto.cost}" pattern="#,###" />원</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6" style="border-bottom: 1px #c0c0c0 solid;">합계</td>
				<td><fmt:formatNumber value="${bonussalary2}" pattern="#,###" />원</td>
			</tr>
		</c:if>
	</table>
</form>