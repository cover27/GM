<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../setting.jsp"%>
<html>
<body>
	<c:if test="${cnt == -3}">
	<script type="text/javascript">
	 alert("검색 실패하였습니다. <br>확인 후 다시 시도해주세요.");
	 window.location="<c:url value='/admin/J_BasicAllowanceManagement' />";
	</script>
	</c:if>
	<c:if test="${cnt != 0 && cnt != -3}">
	<script type="text/javascript">
	 alert("저장되었습니다");
	 window.location="<c:url value='/admin/J_BasicAllowanceManagement' />";
	 </script>
	</c:if>
	
</body>
</html>