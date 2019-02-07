<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
</head>
<body>
	<div class="content_result">
		<form action="<c:url value='/admin/D_boardsUpdatePro'/>" method="post" name="D_boardsUpdate">
			<input type="hidden" name="num" value="${num}">
			<table>
				<tr>
					<th>게시판명</th>
					<td>
						<input class="input" type="text" name="b_name" maxlength="50" style="width: 270px" placeholder="${bvo.b_name}">
					</td>
				</tr>
	
				<tr>
					<th>익명여부</th>
					<td>
						<input type="radio" name="anon" value="0"> 실명
						<input type="radio" name="anon" value="1"> 익명
					</td>
				</tr>
	
				<tr>
					<th colspan="2">
						<input class="inputButton" type="submit" value="수정">
						<input class="inputButton" type="button" value="수정취소" onclick="location.reload()">
					</th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>