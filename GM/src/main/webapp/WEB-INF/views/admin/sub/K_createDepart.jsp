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

	<c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			alert('생성에 실패했습니다.');
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${insertCnt == -1}">
		<script type="text/javascript">
			alert('이름을 입력해야 합니다.');
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${insertCnt == 1}">
		<script type="text/javascript">
			 alert("부서가 생성되었습니다.");
			 window.location="<c:url value='/admin/K_manageOrgan' />";
		 </script>
	</c:if>

</body>
</html>