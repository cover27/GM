<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	// 필수입력항목 다 입력했는지 확인하는 함수
	function inputCheck(){
		if(!document.inputform.id.value){
			alert(msg_id);
			document.inputform.id.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.pwd.value){
			alert(msg_pwd);
			document.inputform.pwd.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.repwd.value){
			alert(msg_repwd);
			document.inputform.repwd.focus();
			return false; //다음으로 못넘김
		} else if(document.inputform.pwd.value != document.inputform.repwd.value){
			alert(msg_pwdChk);
			document.inputform.pwd.value = "";
			document.inputform.repwd.value = "";
			document.inputform.pwd.focus();
			return false;
		} else if(!document.inputform.name.value){
			alert(msg_name);
			document.inputform.name.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.email1.value){
			alert(msg_email);
			document.inputform.email1.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.email2.value){
			alert(msg_email);
			document.inputform.email2.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.hint_q.value){
			alert(msg_hint);
			document.inputform.hint_q.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.hint_a.value){
			alert(msg_hint);
			document.inputform.hint_a.focus();
			return false; //다음으로 못넘김
		} else if(document.inputform.hiddenId.value == 0){
			alert(msg_confirmId);
			document.inputform.dupChk.focus();
			return false;
		}
	}

	// id 중복확인체크함수
	function confirmId(){
		//id값 미입력시
		if(!document.inputform.id.value){
			alert('아이디를 입력하세요');
			document.inputform.id.focus();
			return false;
		}
		
		var url="confirmId?id="+ document.inputform.id.value;
		window.open(url, "confirm", "menubar=no, width=300, height=200");
	}
	</script>

<section>
	<article>
		<div class="content_header">
			<h2>회원가입</h2>
		</div>
		<br><br><br><br><br><br>
		<form action="registAccount" method="post" name="inputform" onsubmit="return inputCheck();">
			
			<input type="hidden" name="hiddenId" value="0">
			
			<table>
				<tr>
					<th>*</th>
					<th>아이디</th>
					<td><input type="text" name="id" placeholder="아이디를 입력하세요."></td>
					<td><input type="button" name="dupChk" value="중복확인" onclick="confirmId();"></td>
				</tr>
				<tr>
					<th>*</th>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" placeholder="비밀번호를 입력하세요."></td>
				</tr>
			</table>
		</form>
		
	</article>
</section>