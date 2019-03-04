<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
	<c:if test="${cnt == 0}"> <!-- insert 실패 -->
		<script type="text/javascript">
			alert("입력하신 정보가 정확하지 않습니다. 다시 입력해주세요.");
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt != 0}"> <!-- insert 실패 -->
		<script type="text/javascript">
			window.location='sendPwCond?id=${id}';
		</script>
	</c:if>