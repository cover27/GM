<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<form action="J_infoUpdate" method="post" name="infoform">
	<table border="1px">
		<c:if test="${cnt > 0}">
			<c:forEach var="dto" items="${dtos}">
			정보 있을때
				<tr>
					<td>급여번호</td>
					<td>${dto.id}</td>
					<td>아아디</td>
					<td>${dto.depart}</td>
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
					<td colspan="2">E-MAIL</td>
					<td>${dto.email_in}</td>
				</tr>
				<tr>
					<td colspan="2">*이번달 급여</td>
					<td><input type="text" name="salary" value="${dto.salary}"></td>
					<td colspan="2">*계좌번호</td>
					<td><input type="text" name="account_number"
						value="${dto.account_number}"></td>
				</tr>
				<input type=hidden name="id" value="${dto.id}">
			</c:forEach>
		</c:if>
		<c:if test="${cnt == 0}">
			<c:forEach var="dto" items="${dtos}">
			정보 없을때
				<tr>
					<td>아아디</td>
					<td id="id">${dto.id}</td>
					<td>성명</td>
					<td>${dto.name}</td>
				</tr>
				<tr>
					<td>부서</td>
					<td>${j_name}</td>
					<td>직급</td>
					<td>${rank}</td>
					<td>상태</td>
					<td><select name="state" id="state">
							<option value="allList">지급</option>
							<option value="name">미지급</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>핸드폰</td>
					<td>${dto.tel}</td>
					<td>지급일</td>
					<td><input type="month" id="month"></td>
					<td colspan="2">E-MAIL</td>
					<td>${dto.email_in}</td>
				</tr>
				<tr>
					<td colspan="2" id="salary">*이번달 급여</td>
					<td>${dto.salary}</td>
					<td colspan="2">*계좌번호</td>
					<td>${dto.account_number}</td>
				</tr>
				<input type=hidden name="id" value="${dto.id}">
			</c:forEach>
		</c:if>
	</table>
	<input type="submit" value="수정">
</form>