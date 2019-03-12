<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/find_account.css">

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
	<div class="findAccount_wrap">
		<div class="findAccount_box" style="left: 50%;">
			<h2>새로운 비밀번호 설정</h2>
			<form action="newPwd_pro" name="newpwdform" method="post" onsubmit="return checkinput();">
				<input type="hidden" name="id" value="${id }">
				<div class="form_area">
		   			<div class="input_area">
		   				<i class="i_pwd"></i>
		   				<input type="password" class="input_lg w100p" placeholder="비밀번호를 입력하세요." name="pwd" autofocus>
		   			</div>
		   			<div class="input_area">
		   				<i class="i_pwd"></i>
		   				<input type="password" class="input_lg w100p" placeholder="비밀번호를 다시 한번 입력하세요." name="repwd" autofocus>
		   			</div>
		   			<input type="submit" value="확인">
					<input type="button" value="취소" onclick="window.location='login';">
				</div>
			</form>
		</div>
	</div>
	
</c:if>

