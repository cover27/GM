<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>

	<h2>업무 처리 Pro</h2>
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("업무 처리 실패했습니다.");
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			alert("업무 처리 반영했습니다.");
			window.location="W_listTodoView";
		</script>
	</c:if>
	
	
	
</body>
</html>