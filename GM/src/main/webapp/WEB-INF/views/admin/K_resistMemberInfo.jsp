<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<script src="${path}js/J_script.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/aside/member_manage.jsp"%>
<%@ include file="/WEB-INF/views/admin/sub/K_resistMemberInfo_sub.jsp"%>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>