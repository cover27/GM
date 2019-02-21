<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<body>
	<h3 align="center"> 댓글 생성 처리</h3>
	<c:if test="${insertCnt == 0}">
		<script type="text/javascript">
		alert("댓글 입력에 실패했습니다.");
		window.history.back();
		</script>
	</c:if>
	
	<c:if test="${insertCnt != 0}">
		<script type="text/javascript">
			alert("댓글이 생성되었습니다.");
			window.location="D_boardContent?num=${num}&pageNum=${pageNum}&boardnum=${boardnum}&number=${number}";
		</script>
	</c:if>
</body>
</html>