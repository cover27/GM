<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/signup.css">

<script type="text/javascript">
	function checkinput(){
		if(!document.newpwdform.pwd.value){
			alert('비밀번호를 입력하세요.');
			document.newpwdform.pwd.focus();
			return false;
		} else if(!document.newpwdform.repwd.value){
			alert('비밀번호 확인을 입력하세요.');
			document.newpwdform.repwd.focus();
			return false;
		} else if(document.newpwdform.pwd.value != document.newpwdform.repwd.value){
			alert('비밀번호가 일치하지 않습니다.');
			document.newpwdform.repwd.focus();
			return false;
		}
	}
</script>

<c:if test="${key != inputkey }">
	<script type="text/javascript">
		alert('인증코드가 일치하지 않습니다.');
		window.location='sendPwCond?id=${id}';
	</script>
</c:if>

<c:if test="${key == inputkey }">
	<h3>새로운 비밀번호 설정</h3>
	<div class="login_wrap" style="position: relative; top: 300px;">
		<form action="newPwd_pro" name="newpwdform" method="post" onsubmit="return checkinput();">
			<input type="hidden" name="id" value="${id }">
			<table>
				<tr>
					<th>새로운 비밀번호</th>
					<td><input type="password" name="pwd" autofocus></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="repwd"></td>
				</tr>
				<tr>
					<th>
						<input type="submit" value="확인">
						<input type="button" value="취소" onclick="window.location='login';">
					</th>
				</tr>
			</table>
		</form>	
	</div>
</c:if>

