<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/find_account.css">
<script type="text/javascript">
	function checkBlank(num){
		if(num == 1){
			if(!document.findidform.name.value){
				alert('이름을 입력하세요.');
				return false;
			} else if(!document.findidform.email.value){
				alert('이메일을 입력하세요.');
				return false;
			}
		} else if(num == 2){
			if(!document.findpwform.id.value){
				alert('아이디를 입력하세요.');
				return false;
			} else if(!document.findpwform.name.value){
				alert('이름을 입력하세요.');
				return false;
			} else if(!document.findpwform.email.value){
				alert('이메일을 입력하세요.');
				return false;
			}
		}
			
	}
</script>
<div class="findAccount_wrap">
	<div class="findAccount_box box1">
		<h2>아이디 찾기</h2>
    	<div class="form_area">
    		<form action="findId" name="findidform" method="post" onsubmit="return checkBlank(1);">
    			<div class="input_area">
    				<i class="i_name"></i>
    				<input type="text" name="name" class="input_lg w100p" placeholder="이름을 입력하세요.">
    			</div>
    			<div class="input_area">
    				<i class="i_email"></i>
    				<input type="text" name="email" class="input_lg w100p" placeholder="이메일 주소를 입력하세요.">
    			</div>
    			<input type="submit" value="아이디찾기">
    			<input type="button" value="뒤로가기" onclick="window.history.back();" class="back">
    		</form>
    	</div>
	</div>
	<div class="findAccount_box box2">
		<h2>비밀번호 찾기</h2>
		<div class="form_area">
			<form action="findPw" name="findpwform" method="post" onsubmit="return checkBlank(2);">
				<div class="input_area">
					<i class="i_id"></i>
					<input type="text" name="id" class="input_lg w100p" placeholder="아이디를 입력하세요.">
				</div>
				<div class="input_area">
					<i class="i_name"></i>
					<input type="text" name="name" class="input_lg w100p" placeholder="이름을 입력하세요.">
				</div>
				<div class="input_area">
					<i class="i_email"></i>
					<input type="text" name="email" class="input_lg w100p" placeholder="이메일 주소를 입력하세요.">
				</div>
				<input type="submit" value="비밀번호찾기">
			</form>
		</div>
	</div>
</div>