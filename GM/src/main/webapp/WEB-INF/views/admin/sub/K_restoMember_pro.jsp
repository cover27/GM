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

	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert('복구에 실패했습니다.');
			window.history.back();
		</script>
	</c:if>
	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			 alert("회원정보가 복구되었습니다");
			 window.location="<c:url value='/admin/K_restoMember' />";
		 </script>
	</c:if>

</body>
</html>