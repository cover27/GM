<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../setting.jsp"%>
<html>
<body>
<%-- <%
	int cnt = (Integer)request.getAttribute("updateCnt");
	if(cnt == 0){ //업데이트 실패
%>
	<script type="text/javascript">
	errorAlert(insertError);
	</script>
<%
	}else{	//업데이트 성공
		response.sendRedirect("J_SalaryDefaultSetting");
	}
%> --%>
	<c:if test="${updateCnt == 0}">
	<script type="text/javascript">
	errorAlert(updateError);
	</script>
	</c:if>
	<c:if test="${updateCnt != 0}">
	<script type="text/javascript">
	 alert("수정되었습니다");
	 window.location="<c:url value='/admin/J_SalaryDefaultSetting' />";
	 </script>
	</c:if>
	
</body>
</html>