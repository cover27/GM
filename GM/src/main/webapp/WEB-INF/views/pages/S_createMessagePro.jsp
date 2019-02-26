<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<body>
	<h3 align="center"> 메세지함 생성 처리</h3>
	<c:if test="${creCnt == 0}">
		<script type="text/javascript">
		alert("메세지함생성에 실패했습니다.");
		window.history.back();
		</script>
	</c:if>
	
	<c:if test="${creCnt != 0}">
		<script type="text/javascript">
			alert("메시지함이 생성되었습니다.");
			window.location="S_receiveMessage";
		</script>
	</c:if>
</body>
</html>