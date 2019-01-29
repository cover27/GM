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


		<table cellpadding="0" cellspacing="0" class="obj row20px"
			style="width: 1197px; table-layout: fixed;" text-align="center">
			<c:forEach var="dto" items="${dtos}">
				<tr>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">사원번호</td>
						<td>${dto.id}</td>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">부서</td>
						<td>${dto.depart}</td>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">직급</td>
						<td>${dto.rank}</td>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">성명</td>
						<td>${dto.name}</td>
				</tr>
				
				
				<tr>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">주민번호(앞)</td>
						<td>${dto.jumin1}</td>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">성별</td>
						<td>${dto.gender}</td>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">핸드폰</td>
						<td>${dto.tel}</td>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">국적</td>
						<td>${dto.nation}</td>
				</tr>
				
				
				<tr>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">입사일자</td>
						<td>${dto.enterday}</td>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">연차</td>
						<td>${dto.nation}</td>
					<td style="text-align: center; cursor: default; background-color: #cccccc;" colspan="2">E-MAIL</td>
						<td>${dto.email_in}</td>
				</tr>
				<tr>
					<td style="text-align: center; cursor: default; background-color: #cccccc;" colspan="2">*연봉</td>
						<td><input type="text" name="salary" value="${dto.salary}"></td>
					<td style="text-align: center; cursor: default; background-color: #cccccc;" colspan="2">*계좌번호</td>
						<td><input type="text" name="account_number" value="${dto.account_number}"></td> 
				</tr>
				<input type=hidden name="id" value="${dto.id}">
			</c:forEach>
		</table>
		<input type="submit" value="수정">
	</form>
</body>
</html>