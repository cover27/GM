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
	<table>
		<tr>
			<th>이름</th>
			<th>부서명</th>
			<th>직급명</th>
			<th>전화번호</th>
			<th>이메일</th>
		</tr>
		<c:forEach var="dto" items="${mgiList }">
			<tr>
				<c:if test="${dto.leader == 1 }">
					<td style="background:yellow;">${dto.name }&nbsp;&nbsp;&nbsp;부서장</td>
				</c:if>
				<c:if test="${dto.leader != 1 }">
					<td>${dto.name }</td>
				</c:if>
				<td>${dto.departName }</td>
				<td>${dto.rankName }</td>
				<td>${dto.tel }</td>
				<td>${dto.email }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>