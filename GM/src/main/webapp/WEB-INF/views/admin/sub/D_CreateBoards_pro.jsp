<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<body>
	<h3 align="center"> 게시판 생성  처리</h3>
	<c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			errorAlert(insertError);
		</script>
	</c:if>
	
	<c:if test="${insertCnt != 0}">
		<script type="text/javascript">
			alert("생성되었습니다.");
			window.history.back();
		</script>
	</c:if>
</body>
</html>