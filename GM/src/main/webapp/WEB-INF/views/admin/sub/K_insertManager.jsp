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

	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert('등록에 실패했습니다. 다시 시도해주세요.');
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt == -1}">
		<script type="text/javascript">
			alert('1명 이상 선택해야 합니다.');
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt > 0}">
		<script type="text/javascript">
			 alert("관리자로 등록되었습니다.");
			 window.location ="<c:url value='/admin/K_ourManager' />";
		 </script>
	</c:if>

</body>
</html>