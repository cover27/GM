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
			alert('변경에 실패했습니다. 다시 시도해주세요.');
			alert('결과 : ${updateCnt}');
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			 alert("부서장이 변경되었습니다.");
			 window.opener.location.href ="<c:url value='/admin/K_manageOrgan' />";
			 self.close();
		 </script>
	</c:if>

</body>
</html>