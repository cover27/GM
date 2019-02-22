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
	
	<c:if test="${sel == 1}">
		<script type="text/javascript">
			 window.location="<c:url value='/pages/P_listApprMyRequestView'/>"
		 </script>
	</c:if>
	
	<c:if test="${sel == 2}">
		<script type="text/javascript">
			 window.location="<c:url value='/pages/P_listApprTodoView'/>"
		 </script>
	</c:if>
	
	<c:if test="${sel == 3}">
		<script type="text/javascript">
			 window.location="<c:url value='/pages/P_listApprCompleteView'/>"
		 </script>
	</c:if>
	
	<c:if test="${sel == 4}">
		<script type="text/javascript">
			 window.location="<c:url value='/pages/P_readApprAllListView'/>"
		 </script>
	</c:if>
	
	<c:if test="${sel == 5}">
		<script type="text/javascript">
			 window.location="<c:url value='/pages/P_listApprRejectView'/>"
		 </script>
	</c:if>
	
	<c:if test="${sel == 6}">
		<script type="text/javascript">
			 window.location="<c:url value='/pages/P_listApprReferenceView'/>"
		 </script>
	</c:if>
	
	<c:if test="${sel == 7}">
		<script type="text/javascript">
			 window.location="<c:url value='/admin/P_managePayment'/>"
		 </script>
	</c:if>

</body>
</html>