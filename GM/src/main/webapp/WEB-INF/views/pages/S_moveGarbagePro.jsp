<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<body>
	<h3 align="center"> 메세지 휴지통 이동 처리</h3>
	<c:if test="${moveCnt == 0}">
		<script type="text/javascript">
		alert("휴지통 보네기에 실패했습니다.");
		window.history.back();
		</script>
	</c:if>
	
	<c:if test="${moveCnt != 0}">
		<script type="text/javascript">
			alert("휴지통으로 보네졌습니다.");
			window.location="S_receiveMessage?pageNum=${pageNum}&num=${num}";
		</script>
	</c:if>
</body>
</html>