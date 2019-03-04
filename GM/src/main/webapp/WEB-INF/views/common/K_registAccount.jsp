<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
	<c:if test="${insertCnt == 0}"> <!-- insert 실패 -->
		<script type="text/javascript">
			alert("회원가입에 실패했습니다.");
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${newOld == 1}">
		<script type="text/javascript">
			alert('사업자님 환영합니다.');
		</script>
	</c:if>
	
	<c:if test="${insertCnt != 0}">
		<script type="text/javascript">
			alert("회원가입에 성공했습니다. 입력하신 이메일에 인증메일을 확인해주세요.");
			window.location = "login";
		</script>
	</c:if>