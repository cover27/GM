<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${deleteCnt == -1}">
		<script type="text/javascript">
			alert('구성원이 포함된 부서는 삭제할 수 없습니다.');
			window.history.back();
		</script>
	</c:if>

	<c:if test="${deleteCnt == 0}">
		<script type="text/javascript">
			alert('부서삭제에 실패했습니다. 다시 시도해주세요.');
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${deleteCnt == 1}">
		<script type="text/javascript">
			 alert("부서가 삭제되었습니다.");
			 window.location ="<c:url value='/admin/K_manageOrgan' />";
		 </script>
	</c:if>

</body>
</html>