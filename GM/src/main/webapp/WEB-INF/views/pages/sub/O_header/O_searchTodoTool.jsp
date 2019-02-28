<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무관리 view 페이지단 검색기능</title>
</head>
<body>

	<c:if test="${sel == 1}">
		<script type="text/javascript">
			 window.location="<c:url value='/pages/W_listPureOrderView?search=1'/>"
		 </script>
	</c:if>
	
	<c:if test="${sel == 2}">
		<script type="text/javascript">
			 window.location="<c:url value='/pages/W_listTodoView?search=1'/>"
		 </script>
	</c:if>
	
	<c:if test="${sel == 3}">
		<script type="text/javascript">
			 window.location="<c:url value='/pages/W_listTodoReportView?search=1'/>"
		 </script>
	</c:if>
	
	<c:if test="${sel == 4}">
		<script type="text/javascript">
			 window.location="<c:url value='/admin/W_listAdminDocManagement?search=1'/>"
		 </script>
	</c:if>



</body>
</html>