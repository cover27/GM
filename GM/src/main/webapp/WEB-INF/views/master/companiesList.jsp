<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${path}js/J_script.js"></script>
<title>${title}</title>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/aside/master.jsp"%>
<%@ include file="/WEB-INF/views/master/sub/companiesList_sub.jsp"%>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>