<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<c:if test="${state == 1}"> <!-- insert 실패 -->
	<script type="text/javascript">
		alert("처리되었습니다.");
		window.location="<c:url value='/admin/K_member_manage'/>";
	</script>
</c:if>

<c:if test="${state == -1}">
	<script type="text/javascript">
		alert("한개 이상 선택해야 합니다.");
		window.history.back();
	</script>
</c:if>

<c:if test="${state == 0}">
	<script type="text/javascript">
		alert("요청이 수행되지 않았습니다. 다시 한번 확인해주세요.");
		window.history.back();
	</script>
</c:if>