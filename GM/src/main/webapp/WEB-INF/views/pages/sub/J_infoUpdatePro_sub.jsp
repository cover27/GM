<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>
<html>
<body>
<%
	int cnt = (Integer)request.getAttribute("updateCnt");
	if(cnt == 0){ //업데이트 실패
%>
	<script type="text/javascript">
	errorAlert(insertError);
	</script>
<%
	}else{	//업데이트 성공
		//cnt를 가지고 mainSuccess.do로 이동
		response.sendRedirect("mainSuccess?cnt=" + cnt);
	}
%>
	
</body>
</html>