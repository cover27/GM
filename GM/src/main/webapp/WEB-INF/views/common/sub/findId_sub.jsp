<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/signup.css">

<c:if test="${cnt == 0 }">
	<script type="text/javascript">
		alert('검색결과가 없습니다.');
		window.history.back();
	</script>
</c:if>

<c:if test="${cnt != 0 }">
	<h3>입력하신 정보로 검색한 아이디는 다음과 같습니다.</h3>
	<div class="login_wrap" style="position: relative; top: 300px;">
		<form action="sendPwCond" name="findidform" method="post" onsubmit="return checkSelect();">
			<table>
				<tr>
					<th>선택</th>
					<th>아이디</th>
					<th>가입시기</th>
				</tr>
				<%
					int i = 0;
				%>
				<c:forEach var="dto" items="${list }">
					<tr>
						<%
							if(i == 0){
						%>
							<td><input type="radio" name="id" value="${dto.id }" checked></td>
						<%
							} else{
						%>
							<td><input type="radio" name="id" value="${dto.id }"></td>
						<%
							}
							i++;
						%>
						<td>${dto.id }</td>
						<td>${dto.enterday }</td>
					</tr>
				</c:forEach>
				<tr>
					<td><input type="submit" value="이메일로 비밀번호 찾기"></td>
					<td><input type="button" value="뒤로" onclick="window.history.back()"></td>
				</tr>
			</table>
		</form>
	</div>
</c:if>

