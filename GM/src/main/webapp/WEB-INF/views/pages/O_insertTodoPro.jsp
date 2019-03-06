<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>

	<h2>나의할일 등록 Pro</h2>
	<c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			alert("일정 등록 실패했습니다.");
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${insertCnt != 0}">
		<script type="text/javascript">
			// alert("일정 등록 완료했습니다.");
			window.location="W_listMyTodoView";
		</script>
	</c:if>
	
	
	
</body>
</html>