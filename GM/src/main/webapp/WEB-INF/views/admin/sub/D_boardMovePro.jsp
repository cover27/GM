<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
	<h2>글 이동 처리</h2>
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("이동에 실패하였습니다.");
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			alert("이동되었습니다.");
			window.location="<c:url value='/admin/D_allBoardAdmin'/>";
		</script>
	</c:if>
</body>
</html>