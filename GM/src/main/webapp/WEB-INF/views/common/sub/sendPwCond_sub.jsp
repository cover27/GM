<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/find_account.css">
<script type="text/javascript">
	
</script>
<html>
	<div class="findAccount_wrap">
		<div class="findAccount_box" style="left: 50%;">
			<h2 style="line-height: 22px;font-size: 16px;">입력하신 ${email } 로<br>인증코드를 발송했습니다.</h2>
			<form action="createNewPw" method="post">
				<input type="hidden" name="id" value="${id }">
				<input type="hidden" name="key" value="${key }">
				<div class="form_area">
	    			<div class="input_area">
	    				<i class="i_name"></i>
						<input type="text" name="inputkey" class="input_lg w100p" placeholder="인증코드를 입력하세요.">
	    			</div>
	    			<input type="submit" value="인증코드 확인">
					<input type="button" value="비밀번호찾기 취소" onclick="window.location='login'" style="width: 49.2%; display: inline-block;">
					<input type="button" value="인증번호 재전송" onclick="window.location='sendPwCond?id=${id}'" style="width: 49.2%; display: inline-block;">
				</div>
			</form>
		</div>
	</div>
</html>
