<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<html>
<body>
	
	<c:if test="${checkCnt == 1 }">
		<script type="text/javascript">
			window.location = 'main';
		</script>
	</c:if>
	
	<c:if test="${checkCnt == 2 }">
		<script type="text/javascript">
			alert('비밀번호가 일치하지 않습니다.');
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${checkCnt == 3 }">
		<script type="text/javascript">
			alert('아이디가 존재하지 않습니다.');
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${checkCnt == 0 }">
		<script type="text/javascript">
			alert('로그인에 문제가 발생했습니다. 다시 시도해주세요.');
			window.history.back();
		</script>
	</c:if>
	
	
</body>
</html>