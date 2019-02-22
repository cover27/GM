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
			alert('삭제에 실패했습니다.');
			window.history.back();
		</script>
	</c:if>
	<c:if test="${cnt != 0}">
		<script type="text/javascript">
			 alert("삭제되었습니다");
			 window.location="<c:url value='/admin/P_managePayment' />";
		 </script>
	</c:if>
	
</body>
</html>