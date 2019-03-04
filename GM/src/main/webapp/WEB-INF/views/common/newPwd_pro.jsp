<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
	<c:if test="${cnt == 0}"> <!-- insert 실패 -->
		<script type="text/javascript">
			alert("비밀번호 변경에 실패했습니다.");
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt != 0}"> <!-- insert 실패 -->
		<script type="text/javascript">
			alert("비밀번호를 성공적으로 변경했습니다.");
			window.location = 'login';
		</script>
	</c:if>