<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../setting.jsp"%>
	<c:if test="${cnt == -3}">
	<script>
	 alert("계좌 혿은 연봉이 등록되지 않았습니다. 확인후 다시 시도해주세여.");
	 window.location="J_PayrollRegistration";
	 </script>
	 </c:if>
	 <c:if test="${cnt == -1}">
	<script>
	 alert("검색 실패하였습니다. 확인 후 다시 시도해주세요.");
	 window.location="J_PayrollRegistration";
	</script>
	</c:if>
	
