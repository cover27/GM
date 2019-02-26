<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
</head>
<body>
	<div class="content_result">
		<form action="<c:url value='/pages/S_createMessagePro'/>" method="post">
			<input type="hidden" name="massage_num" value="${massage_num}">
			<h3>쪽지함 생성</h3>
			<label>
				<span>쪽지함 이름 : </span>
				<input type="text" name="name" maxlength="50" placeholder="쪽지함 이름을 입력해주세요." autofocus />
			</label>
			<div class="fright">
				<input class="modify_btn" type="submit" value="생성">
				<input class="delete_btn" type="button" value="취소" onclick="location.reload()">
			</div>
		</form>
	</div>
</body>
</html>