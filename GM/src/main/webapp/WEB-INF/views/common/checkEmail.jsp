<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<c:if test="${cnt != 0 }">
	<script type="text/javascript">
		alert('인증되었습니다. 관리자의 승인 이후 이용가능합니다.');
		window.location="login";
	</script>
</c:if>

<c:if test="${cnt == 0 }">
	<script type="text/javascript">
		alert('인증에 실패했습니다.');
		window.history.back();
	</script>
</c:if>