<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<form method="post" name="infoform">
	<h3>금여 목록</h3>
	
	<!--
	cnt == 0 은 둘다 정보가 없을때
	cnt == 1 은 급여정보는 있으며 상여금 정보가 없을경우
	cnt == 2 은 둘다 정보가 있을때
	cnt2 == 상여여금 목록 불러오기
	  -->
	
	
	
	<table border="1">
		<c:if test="${cnt == 0}">
			<tr>
				<td style="text-align: center; background-color: #cccccc;">지급기준일</td>
				<td style="text-align: center; background-color: #cccccc;">사원번호</td>
				<td style="text-align: center; background-color: #cccccc;">성명</td>
				<td style="text-align: center; background-color: #cccccc;">부서</td>
				<td style="text-align: center; background-color: #cccccc;">지급총액</td>
				<td style="text-align: center; background-color: #cccccc;">공제총액</td>
				<td style="text-align: center; background-color: #cccccc;">실지급액</td>
			</tr>
			<tr>
				<td colspan="7" style="height: 150px;" text-align="center">
					*데이터 정보가 없습니다.!!!!!!!</td>
			</tr>
			<tr>
				<td colspan="4">합계</td>
				<td style="text-align: center; background-color: #cccccc;">0</td>
				<td style="text-align: center; background-color: #cccccc;">0</td>
				<td style="text-align: center; background-color: #cccccc;">0</td>
			</tr>
		</c:if>
		
		
		<c:if test="${cnt == 2}">
			<tr>
				<td style="text-align: center; background-color: #cccccc;">지급기준일</td>
				<td style="text-align: center; background-color: #cccccc;">사원번호</td>
				<td style="text-align: center; background-color: #cccccc;">성명</td>
				<td style="text-align: center; background-color: #cccccc;">부서</td>
				<td style="text-align: center; background-color: #cccccc;">지급총액</td>
				<td style="text-align: center; background-color: #cccccc;">공제총액</td>
				<td style="text-align: center; background-color: #cccccc;">실지급액</td>
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
				<td colspan="4"
					style="text-align: center; background-color: #cccccc;">합계</td>
				<td style="text-align: center; background-color: #cccccc;">${dto.salary}</td>
				<td style="text-align: center; background-color: #cccccc;">${dto.bonussalary}</td>
				<td style="text-align: center; background-color: #cccccc;">${dto.sumsalarybonus}</td>
			</tr>
		</c:if>
		
		
		<c:if test="${cnt == 1}">
			<tr>
				<td style="text-align: center; background-color: #cccccc;">지급기준일</td>
				<td style="text-align: center; background-color: #cccccc;">사원번호</td>
				<td style="text-align: center; background-color: #cccccc;">성명</td>
				<td style="text-align: center; background-color: #cccccc;">부서</td>
				<td style="text-align: center; background-color: #cccccc;">지급총액</td>
				<td style="text-align: center; background-color: #cccccc;">공제총액</td>
				<td style="text-align: center; background-color: #cccccc;">실지급액</td>
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
				<td colspan="4"
					style="text-align: center; background-color: #cccccc;">합계</td>
				<td style="text-align: center; background-color: #cccccc;">${dto.salary}</td>
				<td style="text-align: center; background-color: #cccccc;">0</td>
				<td style="text-align: center; background-color: #cccccc;">${dto.salary}</td>
			</tr>
		</c:if>
	</table>
	<br> <br> <br>
	
	
	
	
	
	
	
	
	
	
	
	<h3>공제 총액 상세정보</h3>
	<table border="1">
		<c:if test="${cnt2 == 0 || cnt == 0}">
			<tr>
				<td style="text-align: center; background-color: #cccccc;">수당번호</td>
				<td style="text-align: center; background-color: #cccccc;">공제항목</td>
				<td style="text-align: center; background-color: #cccccc;">공제내용</td>
				<td style="text-align: center; background-color: #cccccc;">공제금액</td>
			</tr>
			<tr>
				<td colspan="4" style="height: 150px;" text-align="center">
					*데이터 정보가 없습니다.!!!!!!!</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center; background-color: #cccccc;">합계</td>
			</tr>
		</c:if>
		
		
		<c:if test="${cnt > 0 && cnt2 > 0}">
			<tr>
				<td style="text-align: center; background-color: #cccccc;">수당번호</td>
				<td style="text-align: center; background-color: #cccccc;">공제항목</td>
				<td style="text-align: center; background-color: #cccccc;">공제내용</td>
				<td style="text-align: center; background-color: #cccccc;">공제금액</td>
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
				<td colspan="3" style="text-align: center; background-color: #cccccc;">합계</td>
				<td style="text-align: center; background-color: #cccccc;">${Sumsalarybonus}</td>
			</tr>
		</c:if>
	</table>
</form>