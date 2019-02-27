<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
	<h2>댓글 수정 처리</h2>
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("댓글 수정이 실패하였습니다.");
			window.history.back();
		</script>
	</c:if>
	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			alert("댓글이 수정되었습니다.");
			window.location="D_boardContent?pageNum=${pageNum}&num=${num}&boardnum=${boardnum}&number=${number+1}";
		</script>
	</c:if>
</body>
</html>