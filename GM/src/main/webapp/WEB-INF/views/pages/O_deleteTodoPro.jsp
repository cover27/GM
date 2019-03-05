<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>

	<h2>나의 할일 삭제 Pro</h2>
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("할일 삭제 실패했습니다.");
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			alert("할일 삭제 완료했습니다.");
			window.location="W_listMyTodoView";
		</script>
	</c:if>
	
	
	
</body>
</html>