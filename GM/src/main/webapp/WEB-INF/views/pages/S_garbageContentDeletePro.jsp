<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
	<h2>글 수정 처리</h2>
	<c:if test="${deleteCnt == 0}">
		<script type="text/javascript">
			alert("메세지 휴지통 이동이 실패하였습니다.");
			window.history.back();
		</script>
	</c:if>
	<c:if test="${deleteCnt != 0}">
		<script type="text/javascript">
			alert("메세지가 휴지통으로 이동되었습니다.");
			window.location="S_garbageList?num=${num}&pageNum=${pageNum}";
		</script>
	</c:if>
</body>
</html>