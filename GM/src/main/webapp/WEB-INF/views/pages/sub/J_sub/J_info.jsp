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
					<td style="text-align: center; cursor: default;" colspan="2">
						<div class="hdrcell" id="leftGrid_0">사원번호</div>
					</td>
					<td>${dto.id}</td>
					<td style="text-align: center; cursor: default;">
						<div class="hdrcell" id="leftGrid_1">성명</div>
					</td>
					<td>${dto.name}</td>
					<td style="text-align: center; cursor: default;">
						<div class="hdrcell" id="leftGrid_2">직급</div>
					</td>
					<td>${dto.rank}</td>
				</tr>
				<tr>
					<td style="text-align: center; cursor: default;">
						<div class="hdrcell" id="leftGrid_3">부서</div>
					</td>
					<td>${dto.depart}</td>
					<td style="text-align: center; cursor: default;">
						<div class="hdrcell" id="leftGrid_4">입사일자</div>
					</td>
					<td>${dto.enterday}</td>
					<td style="text-align: center; cursor: default;">
						<div class="hdrcell" id="leftGrid_5">핸드폰</div>
					<td>${dto.tel}</td>
				</tr>
				<tr>
					<td style="text-align: center; cursor: default;">
						<div class="hdrcell" id="leftGrid_6">E-MAIL</div>
					</td>
					<td>${dto.email_in}</td>
					<td style="text-align: center; cursor: default;">
						<div class="hdrcell" id="leftGrid_7">연봉</div>
					</td>
					<td><input type="text" name="salary" value="${dto.salary}"></td>
					<td style="text-align: center; cursor: default;">
						<div class="hdrcell" id="leftGrid_8">계좌번호</div>
					</td>
					<td><input type="text"name="account_number" value="${dto.account_number}"></td>
				</tr>
				<input type=hidden name="id" value="${dto.id}">
			</c:forEach>
		</table>
		<input type="submit" value="수정">
	</form>
</body>
</html>