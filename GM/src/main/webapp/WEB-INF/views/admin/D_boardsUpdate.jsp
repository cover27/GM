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
	<form action="<c:url value='/admin/D_boardsUpdatePro' />" method="post" name="D_boardsUpdate" class="boards_trees">
		<input type="hidden" name="num" value="${num}">
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
			<input class="modify_btn ml50" type="submit" value="수정">
			<input class="delete_btn" type="button" value="취소" onclick="location.reload()">
		</div>
	</form>
</body>
</html>