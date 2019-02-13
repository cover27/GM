<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<c:if test="${mgiList.size() == 0}">
	<script type="text/javascript">
		alert('구성원이 없어 부서장을 지정할 수 없습니다.');
		self.close();
	</script>
</c:if>

<c:if test="${mgiList.size() != 0}">
	<form action="K_departLeader_pro" method="post">
		<input type="hidden" name="depart" value="${depart }">
		<c:forEach var="dto" items="${mgiList }">
			<c:if test="${dto.leader == 1 }">
				현재 부서장&nbsp;:&nbsp;${dto.name}
			</c:if>
		</c:forEach>
		<div style="overflow-y: scroll; height: 200px;">
			<table>
				<tr>
					<th>선택</th>
					<th>이름</th>
					<th>직급</th>
					<th>이메일</th>
				</tr>
				<c:forEach var="dto" items="${mgiList }">
					<tr>
						<th><input type="radio" name="check" value="${dto.id }"></th>
						<th>${dto.name }</th>
						<th>${dto.rankName }</th>
						<th>${dto.email }</th>
					</tr>
				</c:forEach>
			</table>
		</div>
		<table>
			<tr>
				<th colspan="2">
					<input type="submit" value="변경">
					<input type="button" value="취소" onclick="self.close();">
				</th>
			</tr>
		</table>
	</form>
</c:if>
	
</body>
</html>