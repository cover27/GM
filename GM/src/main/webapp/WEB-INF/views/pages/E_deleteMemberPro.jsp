<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<body>
	<h3 align="center"> 자주 연락하는 맴버 삭제 처리</h3>
	<c:if test="${deleteCnt == 0}">
		<script type="text/javascript">
		alert("맴버삭제에 실패했습니다.");
		window.history.back();
		</script>
	</c:if>
	
	<c:if test="${deleteCnt != 0}">
		<script type="text/javascript">
			alert("맴버가 삭제되었습니다.");
			window.location="E_orgMyFavoritMemList?pageNum=${pageNum}&num=${num}";
		</script>
	</c:if>
</body>
</html>