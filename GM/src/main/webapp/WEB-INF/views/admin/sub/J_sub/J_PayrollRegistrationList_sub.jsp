<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<form action="J_PayrollRegistrationInsert" method="post" name="infoform">
	<table border="1">
		<c:if test="${cnt > 0}">
			<c:forEach var="dto" items="${dtos}">
			정보 있을때
				<tr>
					<td>급여번호</td>
					<td>${dto.sal_num}</td>
					<td>아아디</td>
					<td>${dto.id}</td>
					<td>성명</td>
					<td>${dto.name}</td>
				</tr>
				<tr>
					<td>부서</td>
					<td>${j_name}</td>
					<td>직급</td>
					<td>${rank}</td>
					<td>상태</td>
					<td>${dto.state}</td>
				</tr>
				<tr>
					<td>핸드폰</td>
					<td>${dto.tel}</td>
					<td>지급일</td>
					<td>${dto.day}</td>
					<td>E-MAIL</td>
					<td>${dto.email_in}</td>
				</tr>
				<tr>
					<td>*이번달 급여</td>
					<td>${dto.salary}</td>
					<td>*계좌번호</td>
					<td>${dto.account_number}원</td>
				</tr>
				<th>
				<c:if test="${dto.state eq '미지급'}">
					<input type="button" onclick="change('${dto.id}','${j_name}','${rank}')" value="지급처리">
				</c:if>
				<input type="button" onclick="J_PayrollRegistrationListDelete('${dto.id}','${dto.sal_num}')" value="삭제">
				</th>
			</c:forEach>
		</c:if>
		<c:if test="${cnt == 0}">
			<c:forEach var="dto" items="${dtos}">
			정보 없을때
				<tr>
					<td style="text-align: center; background-color: #cccccc;">아아디</td>
					<td id="id">${dto.id}</td>
					<td style="text-align: center; background-color: #cccccc;">성명</td>
					<td>${dto.name}</td>
				</tr>
				<tr>
					<td style="text-align: center; background-color: #cccccc;">부서</td>
					<td>${j_name}</td>
					<td style="text-align: center; background-color: #cccccc;">직급</td>
					<td>${rank}</td>
					<td style="text-align: center; background-color: #cccccc;">상태</td>
					<td><select name="state" id="state">
							<option value="지급">지급</option>
							<option value="미지급">미지급</option>
					</select>
					</td>
				</tr>
				<tr>
					<td style="text-align: center; background-color: #cccccc;">핸드폰</td>
					<td>${dto.tel}</td>
					<td style="text-align: center; background-color: #cccccc;">지급일</td>
					<td><input type="month" id="month"></td>
					<td style="text-align: center; background-color: #cccccc;">E-MAIL</td>
					<td>${dto.email_in}</td>
				</tr>
				<tr>
					<td style="text-align: center; background-color: #cccccc;">*이번달 급여</td>
					<td id="salary">${dto.salary}</td>
					<td >*계좌번호</td>
					<td>${dto.account_number}</td>
				</tr>
					<th><input type="button" onclick="load4('${dto.id}','${dto.salary}','${j_name}','${rank}','${dto.account_number}','${dto.salary}')" value="등록"></th>
			</c:forEach>
		</c:if>
	</table>
</form>