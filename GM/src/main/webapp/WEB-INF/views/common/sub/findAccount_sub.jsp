<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/signup.css">
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
<html>
	<div class="login_wrap" style="position: relative; top: 300px;">
		<div class="fleft w50p">
		    <form action="findId" name="findidform" method="post" onsubmit="return checkBlank(1);">
		    	<h3>아이디 찾기</h3>
		    	<table>
		    		<tr>
		    			<th>이름</th>
		    			<th><input type="text" name="name"></th>
		    		</tr>
		    		<tr>
		    			<th>이메일</th>
		    			<th><input type="text" name="email"></th>
		    		</tr>
		    		<tr>
		    			<td>
		    				<input type="submit" value="아이디찾기">
		    			</td>
		    		</tr>
		    	</table>
		    </form>
		</div>
		
		<div class="fright w50p">
		    <form action="findPw" name="findpwform" method="post" onsubmit="return checkBlank(2);">
		    	<h3>비밀번호 찾기</h3>
		    	<table>
		    		<tr>
		    			<th>아이디</th>
		    			<th><input type="text" name="id"></th>
		    		</tr>
		    		<tr>
		    			<th>이름</th>
		    			<th><input type="text" name="name"></th>
		    		</tr>
		    		<tr>
		    			<th>이메일</th>
		    			<th><input type="text" name="email"></th>
		    		</tr>
		    		<tr>
		    			<td>
		    				<input type="submit" value="비밀번호찾기">
		    			</td>
		    		</tr>
		    	</table>
		    </form>
		</div>
	</div>
</html>
