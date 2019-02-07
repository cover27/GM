<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<c:if test="${cnt != 0}"> <!-- insert 실패 -->
	<script type="text/javascript">
		alert("처리되었습니다.");
		window.location="<c:url value='/admin/K_personal'/>";
	</script>
</c:if>

<c:if test="${cnt == 0}">
	<script type="text/javascript">
		alert("처리에 실패했습니다. 다시 시도하세요.");
		window.history.back();
	</script>
</c:if>