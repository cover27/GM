<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}css/P_style.css" />
<style>
	.content {
		width: 580px;
	    margin: 0 auto;
	    position: relative;
	    top: 10px;
	}
	
	.content table {
		border-radius: 10px;
	}
	
	.content table td, .content table th {
		padding: 10px;
	}
</style>
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
	<div class="content" >
		<form action="P_payApprove_pro" method="post">
			<input type="hidden" name="num" value="${num }">
			<input type="hidden" name="id" value="${id }">
			<table>
				<tr>
					<th>상세내용</th>
				</tr>
				<tr>
					<td style="height: 195px;">
						<textarea name="content" style="width: 100%; height: 100%;" autofocus></textarea>
					</td>
				</tr>
				<tr>
					<td style="padding-top: 10px; text-align: right;">
						<input type="submit" value="결재">
						<input type="button" value="취소" onclick="self.close();">
					</td>
				</tr>
			</table>
		</form>
	</div>
</c:if>
	
</body>
</html>