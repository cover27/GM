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
		<table border="1">
			<c:forEach var="dto" items="${dtos}">
				<tr>
					<td>상여금/삭감</td>
					<td>지급/공제(상태)</td>
					<td>금액</td>
					<td>사유</td>
				</tr>
				<tr>
					<td><input type="text" name="class" value="${dto.type}"></td>
					<td><input type="text" name="state" value="${dto.state}"></td>
					<td><input type="text" name="salary" value="${dto.salary}"></td>
					<td><input type="text" name="content" value="${dto.content}"></td>
				</tr>
				<input type=hidden name="id" value="${dto.id}">
			</c:forEach>
		</table>
		<input type="submit" value="저장">
	</form>
</body>
</html>