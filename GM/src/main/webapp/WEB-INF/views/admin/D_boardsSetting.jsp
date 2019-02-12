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
<!-- 게시판 목록 -->
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/aside/boards.jsp"%>
<%@ include file="/WEB-INF/views/admin/sub/D_boardsSetting_sub.jsp"%>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>