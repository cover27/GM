<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
sdgsdgsdg
<body>
	asdasdasdasdasdas
	<form action="" method="post">
		<table border="1">
			<tr>
				<td>상여금/삭감</td>
				<td>지급/공제(상태)</td>
				<td>금액</td>
				<td>사유</td>
			</tr>
			<c:if test="${cnt > 0}">
				<c:forEach var="dto" items="${dtos}">
					<tr>
						<td><input type="text" name="class" value="${dto.type}"></td>
						<td><input type="text" name="state" value="${dto.state}"></td>
						<td><input type="text" name="salary" value="${dto.salary}"></td>
						<td><input type="text" name="content" value="${dto.content}"></td>
					</tr>
					<input type=hidden name="id" value="${dto.id}">
				</c:forEach>
			</c:if>
			<c:if test="${cnt == 0}">
				<tr>
					<td colspan="4" text-align="center">데이터가 없습니다.</td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</c:if>
		</table>
		<input type="submit" value="저장">
	</form>
	asdasd
</body>
</html>