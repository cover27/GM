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

	<c:if test="${checkCnt != 0}">
		<script type="text/javascript">
			alert('구성원에 부여된 직급은 삭제할 수 없습니다.');
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${checkCnt == 0}">
		<script type="text/javascript">
			 window.location ="<c:url value='/admin/K_manageRank?state=1' />";
		 </script>
	</c:if>

</body>
</html>