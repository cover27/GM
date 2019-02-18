<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<form method="post" name="infoform">
	<h3>추가 및 삭감 목록</h3>
	<table border="1">
		<c:if test="${cnt == 0}">
			<tr>
				<td style="text-align: center; background-color: #cccccc;">등록기준일</td>
				<td style="text-align: center; background-color: #cccccc;">사원번호</td>
				<td style="text-align: center; background-color: #cccccc;">성명</td>
				<td style="text-align: center; background-color: #cccccc;">부서</td>
				<td style="text-align: center; background-color: #cccccc;">추가 및 삭감구분</td>
				<td style="text-align: center; background-color: #cccccc;">사유</td>
				<td style="text-align: center; background-color: #cccccc;">지급액</td>
			</tr>
			<tr>
				<td colspan="6" style="height: 150px;" text-align="center">
					*지급 처리된 정보가 없습니다.!!!!!!!</td>
			</tr>
			<tr>
				<td colspan="6">합계</td>
				<td style="text-align: center; background-color: #cccccc;">0</td>
			</tr>
		</c:if>



		<c:if test="${cnt > 0}">
			<tr>
				<td style="text-align: center; background-color: #cccccc;">등록기준일</td>
				<td style="text-align: center; background-color: #cccccc;">사원번호</td>
				<td style="text-align: center; background-color: #cccccc;">성명</td>
				<td style="text-align: center; background-color: #cccccc;">부서</td>
				<td style="text-align: center; background-color: #cccccc;">추가 및 삭감구분</td>
				<td style="text-align: center; background-color: #cccccc;">사유</td>
				<td style="text-align: center; background-color: #cccccc;">지급액</td>
			</tr>
			<c:forEach var="dto" items="${dtos}">
				<tr>
					<td>${dto.day}</td>
					<td>${dto.id}</td>
					<td>${dto.name}</td>
					<td>${dto.j_name}</td>
					<td>${dto.type}</td>
					<td>${dto.content}</td>
					<td>${dto.cost}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6" style="text-align: center; background-color: #cccccc;">합계</td>
				<td style="text-align: center; background-color: #cccccc;">${bonussalary}</td>
			</tr>
		</c:if>
	</table>
	<br> <br> <br>





	<h3>추가 및 삭감 미지급 목록</h3>
	<table border="1">
		<c:if test="${cnt2 == 0}">
			<tr>
				<td style="text-align: center; background-color: #cccccc;">등록기준일</td>
				<td style="text-align: center; background-color: #cccccc;">사원번호</td>
				<td style="text-align: center; background-color: #cccccc;">성명</td>
				<td style="text-align: center; background-color: #cccccc;">부서</td>
				<td style="text-align: center; background-color: #cccccc;">추가 및 삭감구분</td>
				<td style="text-align: center; background-color: #cccccc;">사유</td>
				<td style="text-align: center; background-color: #cccccc;">지급액</td>
			</tr>
			<tr>
				<td colspan="4" style="height: 150px;" text-align="center">
					지급처리가 안된  정보가 없습니다.</td>
			</tr>
			<tr>
				<td colspan="6" style="text-align: center; background-color: #cccccc;">합계</td>
				<td style="text-align: center; background-color: #cccccc;">0</td>
			</tr>
		</c:if>
		
		
		<c:if test="${cnt2 > 0}">
			<tr>
				<td style="text-align: center; background-color: #cccccc;">등록기준일</td>
				<td style="text-align: center; background-color: #cccccc;">사원번호</td>
				<td style="text-align: center; background-color: #cccccc;">성명</td>
				<td style="text-align: center; background-color: #cccccc;">부서</td>
				<td style="text-align: center; background-color: #cccccc;">추가 및 삭감구분</td>
				<td style="text-align: center; background-color: #cccccc;">사유</td>
				<td style="text-align: center; background-color: #cccccc;">지급액</td>
			</tr>
			<c:forEach var="dto" items="${dtos2}">
				<tr>
					<td>${dto.day}</td>
					<td>${dto.id}</td>
					<td>${dto.name}</td>
					<td>${dto.j_name}</td>
					<td>${dto.type}</td>
					<td>${dto.content}</td>
					<td>${dto.cost}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6" style="text-align: center; background-color: #cccccc;">합계</td>
				<td style="text-align: center; background-color: #cccccc;">${bonussalary2}</td>
			</tr>
		</c:if>
	</table>
</form>