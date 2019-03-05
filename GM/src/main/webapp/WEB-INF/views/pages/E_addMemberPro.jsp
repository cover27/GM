<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<body>
	<h3 align="center"> 자주 연락하는 사람 추가 처리</h3>
	<c:if test="${addCnt == 0}">
		<script type="text/javascript">
		alert("이미 목록에 있는 사람입니다.");
		window.history.back();
		</script>
	</c:if>
	
	<c:if test="${addCnt != 0}">
		<script type="text/javascript">
			alert("자주 연락하는 목록에 추가되었습니다.");
			window.location="E_orgnaizationMemberList";
		</script>
	</c:if>
</body>
</html>