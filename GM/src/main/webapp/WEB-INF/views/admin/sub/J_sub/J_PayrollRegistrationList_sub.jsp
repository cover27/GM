<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<form action="J_PayrollRegistrationInsert" method="post" name="infoform">
	<table>
		<c:if test="${cnt > 0}">
			<c:forEach var="dto" items="${dtos}">
				<tr>
					<th>급여번호</th>
					<td>${dto.sal_num}</td>
					<th>아아디</th>
					<td>${dto.id}</td>
					<th>성명</th>
					<td>${dto.name}</td>
				</tr>
				<tr>
					<th>부서</th>
					<td>${j_name}</td>
					<th>직급</th>
					<td>${r_name}</td>
					<th>상태</th>
					<td>${dto.state}</td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>${dto.tel}</td>
					<th>지급일</th>
					<td>${dto.day}</td>
					<th>E-MAIL</th>
					<td>${dto.email_in}</td>
				</tr>
				<tr>
					<th>*이번달 급여</th>
					<td>${dto.salary}원</td>
					<th>*계좌번호</th>
					<td colspan="3">${dto.account_number}</td>
				</tr>
				<tr>
					<td colspan="6" class="J_PayrollRegistrationList">
						<c:if test="${dto.state eq '미지급'}">
							<input type="button" onclick="change('${dto.id}','${j_name}','${rank}')" value="지급처리" class="modify_btn">
						</c:if>
						<input type="button" onclick="J_PayrollRegistrationListDelete('${dto.id}','${dto.sal_num}','${j_name}','${r_name}')" value="삭제" class="delete_btn">
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${cnt == 0}">
			<c:forEach var="dto" items="${dtos}">
				<tr>
					<th>급여번호</th>
					<td>급여정보 없음</td>
					<th>아이디</th>
					<td id="id">${dto.id}</td>
					<th>성명</th>
					<td>${dto.name}</td>
				</tr>
				<tr>
					<th>부서</th>
					<td>${j_name}</td>
					<th>직급</th>
					<td>${r_name}</td>
					<th>상태</th>
					<td class="left_align">
						<select name="state" id="state">
							<option value="미지급">미지급</option>
							<option value="지급">지급</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>${dto.tel}</td>
					<th>지급일</th>
					<td class="left_align"><input type="month" id="month"></td>
					<th>E-MAIL</th>
					<td>${dto.email_in}</td>
				</tr>
				<tr>
					<th>*이번달 급여</th>
					<td id="salary">${dto.salary}</td>
					<th>*계좌번호</th>
					<td colspan="3">${dto.account_number}</td>
				</tr>
				<tr>
					<td colspan="6" class="J_PayrollRegistrationList">
						<c:if test="${dto.salary == 0 && dto.account_number == null}">
						<span>급여 기본정보를 등록해 주십시오.</span>
						</c:if>
						<c:if test="${dto.salary == 0 && dto.account_number != null}">
						<span>급여 기본정보 연봉을 등록해 주십시오.</span>
						</c:if>
						<c:if test="${dto.salary > 0 && dto.account_number == null}">
						<span>급여 기본정보 계좌번호를 등록해 주십시오.</span>
						</c:if>
						<c:if test="${dto.salary >0 && dto.account_number != null}" >
						<input type="button" onclick="load4('${dto.id}','${dto.salary}','${j_name}','${r_name}','${dto.account_number}','${dto.salary}')" value="등록" class="modify_btn">
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</form>