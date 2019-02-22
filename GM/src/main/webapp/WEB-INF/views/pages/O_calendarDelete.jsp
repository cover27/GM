<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>

	<h2>일정 삭제 Pro</h2>
	<c:if test="${deleteCnt == 0}">
		<script type="text/javascript">
			alert("일정 삭제 실패했습니다.");
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${deleteCnt != 0}">
		<script type="text/javascript">
			alert("일정 삭제 완료했습니다.");
			opener.location.reload();	//윈도우창으로 연 부모창(opener)에 대한 특정 작업 처리 후 refresh
			self.close();
		</script>
	</c:if>

</body>
</html>