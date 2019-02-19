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

<c:if test="${cnt == 0}">
	<script type="text/javascript">
		alert('오류');
		self.close();
	</script>
</c:if>

<c:if test="${cnt == 2}">
	<script type="text/javascript">
		alert('이전 결재가 진행되지 않았습니다.');
		self.close();
	</script>
</c:if>

<c:if test="${cnt == 1}">
	<form action="P_payApprove_pro" method="post">
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
					<input type="submit" value="결재">
					<input type="button" value="취소" onclick="self.close();">
				</td>
			</tr>
		</table>
	</form>
</c:if>
	
</body>
</html>