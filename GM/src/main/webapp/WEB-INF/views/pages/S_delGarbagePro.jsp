<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<body>
	<h3 align="center"> 휴지통 삭제처리</h3>
	<c:if test="${deleteCnt == 0}">
		<script type="text/javascript">
		alert("삭제에 실패했습니다.");
		window.history.back();
		</script>
	</c:if>
	
	<c:if test="${deleteCnt != 0}">
		<script type="text/javascript">
			alert("삭제되었습니다.");
			window.location="S_garbageList?pageNum=${pageNum}&num=${num}";
		</script>
	</c:if>
</body>
</html>