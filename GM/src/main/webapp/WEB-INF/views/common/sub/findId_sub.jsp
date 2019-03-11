<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/find_account.css">

<style>
	.find_id {
		border-radius: 10px;
	}
	
	.find_id tr:hover {
		font-weight: bold;
	}
	
	.find_id th {
		background: #f7f7f7;
	}
	
	.find_id th:first-child {
		border-radius: 10px 0 0 0;
	}
	
	.find_id th:last-child {
		border-radius: 0 10px 0 0;
	}
	
	.find_id th, td {
		height: 48px;
		padding: 10px;
		border-right: 1px solid #eee;
		border-bottom: 1px solid #eee;
	}
	
	.find_id th:last-child, .find_id td:last-child {
		border-right: 0;
	}
	
	.find_id tr:last-child td {
		border-bottom: 0;
	}
	
	.find_id td:first-child {
		text-align: center;
	}
</style>

<c:if test="${cnt == 0 }">
	<script type="text/javascript">
		alert('검색결과가 없습니다.');
		window.history.back();
	</script>
</c:if>

<c:if test="${cnt != 0 }">
	<div class="findAccount_wrap">
		<div class="findAccount_box" style="left: 50%; height: 400px;">
			<h2>입력하신 정보로 검색한 아이디는 다음과 같습니다.</h2>
			<form action="sendPwCond" name="findidform" method="post" onsubmit="return checkSelect();">
				<div class="form_area">
					<table class="find_id">
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
					</table>
					<input type="submit" value="이메일로 비밀번호 찾기">
					<input type="button" value="뒤로" onclick="window.history.back()">
		   		</div>
			</form>
		</div>
	</div>
</c:if>

