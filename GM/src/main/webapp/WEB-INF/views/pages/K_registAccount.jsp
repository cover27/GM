<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<html>
<body>

	<c:if test="${insertCnt == 0}"> <!-- insert 실패 -->
		<script type="text/javascript">
			alert("회원가입에 실패했습니다.");
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${insertCnt != 0}">
		<script type="text/javascript">
			alert("회원가입에 성공했습니다. 로그인을 진행하세요.!!");
			window.location = "test";
		</script>
	</c:if>

</body>
</html>