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
		<form action="<c:url value='/admin/D_CreateBoards_pro'/>" method="post" name="D_boardsUpdate">
			<input type="hidden" name="num" value="${num}">
			<h3>게시판 생성</h3>
			<label>
				<span>게시판명 : </span>
				<input type="text" name="b_name" maxlength="50" placeholder="${b_name}" autofocus />
			</label>
			<span class="ml50">익명여부 : </span>
			<select name="anon">
				<option value="0">실명</option>
				<option value="1">익명</option>
			</select>
			<div class="fright">
				<input class="modify_btn" type="submit" value="생성">
				<input class="delete_btn" type="button" value="취소" onclick="location.reload()">
			</div>
		</form>
	</div>
</body>
</html>