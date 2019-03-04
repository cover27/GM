<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/signup.css">
<script type="text/javascript">
	
</script>
<html>
	<div class="login_wrap" style="position: relative; top: 300px;">
		<h3>입력하신 ${email } 로 인증코드를 발송했습니다.</h3>
		<form action="createNewPw" method="post">
			<input type="hidden" name="id" value="${id }">
			<input type="hidden" name="key" value="${key }">
			<table>
				<tr>	
					<th>인증코드</th>
				</tr>
				<tr>	
					<th><input type="text" name="inputkey"></th>
				</tr>
				<tr>	
					<th>
						<input type="submit" value="인증코드 확인">
						<input type="button" value="비밀번호찾기 취소" onclick="window.location='login'">
						<input type="button" value="인증번호 재전송" onclick="window.location='sendPwCond?id=${id}'">
					</th>
				</tr>
			</table>
		</form>
	</div>
</html>
