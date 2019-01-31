<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<link rel="stylesheet" href="${path}/css/D_style.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
</head>
<body>
<div class="notice">
	<ul>
		<li><i class="fa fa-exclamation-circle"></i> 게시판 트리 상에서 상위 게시판에 권한이 없는 경우 하위 게시판 읽기/쓰기 권한과 무관하게 조회되지 않습니다.</li>
		<li><i class="fa fa-exclamation-circle"></i> 게시판 순서는 Drag&amp;Drop으로 이동하여 변경할 수 있습니다.</li>
	</ul>
</div>
</body>
</html>