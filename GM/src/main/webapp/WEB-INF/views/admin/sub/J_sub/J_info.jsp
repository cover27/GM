<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="J_infoUpdate" method="post" name="infoform">


		<table>
			<c:forEach var="dto" items="${dtos}">
				<tr>
					<td>사원번호</td>
					<td>${dto.id}</td>
					<td>부서</td>
					<td>${dto.depart}</td>
					<td>직급</td>
					<td>${dto.rank}</td>
					<td>성명</td>
					<td>${dto.name}</td>
				</tr>


				<tr>
					<td>주민번호(앞)</td>
					<td>${dto.jumin1}</td>
					<td>성별</td>
					<td>${dto.gender}</td>
					<td>핸드폰</td>
					<td>${dto.tel}</td>
					<td>국적</td>
					<td>${dto.nation}</td>
				</tr>


				<tr>
					<td>입사일자</td>
					<td>${dto.enterday}</td>
					<td>연차</td>
					<td>${dto.nation}</td>
					<td colspan="2">E-MAIL</td>
					<td>${dto.email_in}</td>
				</tr>
				<tr>
					<td colspan="2">*연봉</td>
					<td><input type="text" name="salary" value="${dto.salary}"></td>
					<td colspan="2">*계좌번호</td>
					<td><input type="text" name="account_number"
						value="${dto.account_number}"></td>
				</tr>
				<input type=hidden name="id" value="${dto.id}">
			</c:forEach>
		</table>
		<input type="submit" value="수정">
	</form>
</body>
</html>