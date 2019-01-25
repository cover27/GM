<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table cellpadding="0" cellspacing="0" class="obj row20px"
		style="width: 1197px; table-layout: fixed;">
		<tr>
			<td style="text-align: center; cursor: default;">
				<div class="hdrcell" id="leftGrid_0">사원번호</div>
			</td>
			<td style="text-align: center; cursor: default;">
				<div class="hdrcell" id="leftGrid_1">성명</div>
			</td>
			<td style="text-align: center; cursor: default;">
				<div class="hdrcell" id="leftGrid_2">직급</div>
			</td>
			<td style="text-align: center; cursor: default;">
				<div class="hdrcell" id="leftGrid_3">부서</div>
			</td>
			<td style="text-align: center; cursor: default;">
				<div class="hdrcell" id="leftGrid_4">입사일자</div>
			</td>
			<td style="text-align: center; cursor: default;">
				<div class="hdrcell" id="leftGrid_5">핸드폰</div>
			</td>
			<td style="text-align: center; cursor: default;">
				<div class="hdrcell" id="leftGrid_6">E-MAIL</div>
			</td>
		</tr>
		<c:forEach var="dto" items="${dtos}">
			<tr>
				<td>${dto.id}</td>
				<td>${dto.name}</td>
				<td>${dto.rank}</td>
				<td>${dto.depart}</td>
				<td>${dto.enterday}</td>
				<td>${dto.tel}</td>
				<td>${dto.email_in}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>