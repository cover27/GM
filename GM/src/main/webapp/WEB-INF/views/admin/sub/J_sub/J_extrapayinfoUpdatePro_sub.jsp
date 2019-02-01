<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../setting.jsp"%>
<html>
<body>
	<c:if test="${cnt == 0}">
	<script type="text/javascript">
	alert("저장에 실패하셨습니다.");
	</script>
	</c:if>
	<c:if test="${cnt != 0}">
	<script type="text/javascript">
	 alert("저장되었습니다");
	 window.location="<c:url value='/admin/J_BasicAllowanceManagement' />";
	 </script>
	</c:if>
	
</body>
</html>