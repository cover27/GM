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

	<form action="P_payAgree_pro" method="post">
		<input type="hidden" name="num" value="${num }">
		<input type="hidden" name="id" value="${id }">
		<table>
			<tr>
				<th>상세내용</th>
			</tr>
			<tr>
				<td>
					<textarea name="content">
					</textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="합의">
					<input type="button" value="취소" onclick="self.close();">
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>