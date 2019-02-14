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
	<form action="K_updateDepartName" method="post">
		<input type="hidden" name="depart" value="${depart }">
		<table>
			<tr>
				<th>선택 부서</th>
				<th>${departName}</th>
			</tr>
			<tr>
				<th colspan="2">
					<input type="text" name="dname" required>
					<input type="submit" value="변경">
					<input type="button" value="취소" onclick="self.close();">
				</th>
			</tr>
		</table>
	</form>
</body>
</html>