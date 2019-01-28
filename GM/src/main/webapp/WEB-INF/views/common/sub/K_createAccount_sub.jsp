<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="/gm/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	// 필수입력항목 다 입력했는지 확인하는 함수
	function inputCheck(){
		if(!document.inputform.id.value){
			alert('아이디를 입력하세요.');
			document.inputform.id.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.pwd.value){
			alert('비밀번호를 입력하세요.');
			document.inputform.pwd.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.repwd.value){
			alert('비밀번호를 확인하세요.');
			document.inputform.repwd.focus();
			return false; //다음으로 못넘김
		} else if(document.inputform.pwd.value != document.inputform.repwd.value){
			alert('비밀번호가 일치하지 않습니다. 다시 확인 해주세요');
			document.inputform.pwd.value = "";
			document.inputform.repwd.value = "";
			document.inputform.pwd.focus();
			return false;
		} else if(!document.inputform.name.value){
			alert('이름을 입력하세요');
			document.inputform.name.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.jumin1.value){
			alert('생년월일을 입력하세요.');
			document.inputform.jumin1.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.jumin2.value){
			alert('주민등록번호를 정확히 입력하세요.');
			document.inputform.jumin2.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.gender.value){
			alert('성별을 확인해주세요.');
			document.inputform.gender.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.frgn.value){
			alert('기혼여부를 확인해주세요.');
			document.inputform.frgn.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.hp1.value){
			alert('휴대폰번호를 입력해주세요.');
			document.inputform.hp1.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.hp2.value){
			alert('휴대폰번호를 입력해주세요.');
			document.inputform.hp2.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.hp3.value){
			alert('휴대폰번호를 입력해주세요.');
			document.inputform.hp3.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.email1.value){
			alert('이메일을 입력하세요.');
			document.inputform.email1.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.email2.value){
			alert('이메일을 입력하세요.');
			document.inputform.email2.focus();
			return false; //다음으로 못넘김
		} else if(!document.inputform.address.value){
			alert('주소를 입력하세요.');
			document.inputform.address.focus();
			return false; //다음으로 못넘김
		} else if(document.inputform.hiddenId.value == 0){
			alert('아이디 중복확인을 눌러주세요.');
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
		
		var url="confirmId?id="+ document.inputform.id.value; //confirmId 컨트롤러로 새창화면출력
		window.open(url, "confirm", "menubar=no, width=300, height=200");
	}
	
	function findCompany(){
		var url="findCompany";
		window.open(url, "confirm", "menubar=no, width=800, height=600");
	}
	
	function nextJumin(){
		if(document.inputform.jumin1.value.length >= 6){
			document.inputform.jumin2.focus();
		}
	}
	
	function nextHp1(){ //다입력하면 다음칸으로 넘어가는함수
		if(document.inputform.hp1.value.length >= 3){
			document.inputform.hp2.focus();
		}
	}

	function nextHp2(){ //다입력하면 다음칸으로 넘어가는함수
		if(document.inputform.hp2.value.length >= 4){
			document.inputform.hp3.focus();
		}
	}

	function nextHp3(){ //다입력하면 다음칸으로 넘어가는함수
		if(document.inputform.hp3.value.length >= 4){
			document.inputform.hm1.focus();
		}
	}
	
	function nextHm1(){ //다입력하면 다음칸으로 넘어가는함수
		if(document.inputform.hm1.value.length >= 4){
			document.inputform.hm2.focus();
		}
	}

	function nextHm2(){ //다입력하면 다음칸으로 넘어가는함수
		if(document.inputform.hm2.value.length >= 4){
			document.inputform.hm3.focus();
		}
	}

	function nextHm3(){ //다입력하면 다음칸으로 넘어가는함수
		if(document.inputform.hm3.value.length >= 4){
			document.inputform.email1.focus();
		}
	}
	
	function selectEmailChk(){ //이메일 선택하면 자동으로 생성
		if(document.inputform.email3.value == "0"){
			document.inputform.email2.value = "";
			document.inputform.email2.focus();
		} else{
			document.inputform.email2.value = document.inputform.email3.value;
		}
	}
	
	$(function(){
		$('#marry').keyup(function(){
			var marry = $('#marry').val();
			if(marry == '1'){
				$('#wedding').css("visibility", "visible");
			} else{
				$('#wedding').css("visibility", "hidden");
			}
		});
	});
	</script>

<section>
	<article>
		<div class="content_header">
			<h2>회원가입</h2>
		</div>
		<br><br><br><br><br><br>
		<form action="registAccount" method="post" name="inputform" onsubmit="return inputCheck();">
			
			<input type="hidden" name="hiddenId" value="0">
			<input type="hidden" name="depart">
			
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
				<tr>
					<th>*</th>
					<th>비밀번호확인</th>
					<td><input type="password" name="repwd" placeholder="비밀번호를 확인하세요."></td>
				</tr>
				<tr>
					<th>*</th>
					<th>회사</th>
					<td>
						<input type="text" name="depart_name" readonly>
						<input type="button" value="검색" onclick="findCompany();">
					</td>
				</tr>
				<tr>
					<th>*</th>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th></th>
					<th>영문이름</th>
					<td><input type="text" name="eng_name"></td>
				</tr>
				<tr>
					<th>*</th>
					<th>주민등록번호</th>
					<td>
						<input type="text" name="jumin1" maxlength="6" onkeyup='nextJumin();'>
						-
						<input type="password" name="jumin2" maxlength="7">
					</td>
				</tr>
				<tr>
					<th>*</th>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" value=1>남성
						<input type="radio" name="gender" value=2>여성
					</td>
				</tr>
				<tr>
					<th>*</th>
					<th>기혼여부</th>
					<td>
						<input type="radio" name="marry" value=1>기혼
						<input type="radio" name="marry" value=2>미혼
					</td>
				</tr>
				<div id="wedding">
					<tr>
						<th></th>
						<th>결혼기념일</th>
						<td>
							<input type="date" name="wdday">
						</td>
					</tr>
				</div>
				<tr>
					<th>*</th>
					<th>내외국인 여부</th>
					<td>
						<input type="radio" name="frgn" value=1>내국인
						<input type="radio" name="frgn" value=2>외국인
					</td>
				</tr>
				<tr>
					<th></th>
					<th>국적</th>
					<td><input type="text" name="nation"></td>
				</tr>
				<tr>
					<th>*</th>
					<th>휴대폰번호</th>
					<td>
						<input type="text" name="hp1" maxlength="3" onkeyup="nextHp1();">
						-
						<input type="text" name="hp2" maxlength="4" onkeyup="nextHp2();">
						-
						<input type="text" name="hp3" maxlength="4" onkeyup="nextHp3();">
					</td>
				</tr>
				<tr>
					<th></th>
					<th>자택번호</th>
					<td>
						<input type="text" name="hm1" maxlength="4" onkeyup="nextHm1();">
						-
						<input type="text" name="hm2" maxlength="4" onkeyup="nextHm2();">
						-
						<input type="text" name="hm3" maxlength="4" onkeyup="nextHm3();">
					</td>
				</tr>
				<tr>
					<th>*</th>
					<th>외부이메일</th>
					<td>
						<input type="text" name="email1">
						@
						<input type="text" name="email2">
						<select name="email3" onchange="selectEmailChk();">
							<option value="0">직접입력</option>
							<option value="naver.com">네이버</option>
							<option value="gmail.com">구글</option>
							<option value="daum.net">다음</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>*</th>
					<th>주소</th>
					<td>
						<input type="text" name="address">
					</td>
				</tr>
				<tr>
					<th></th>
					<th>영문주소</th>
					<td>
						<input type="text" name="eng_address">
					</td>
				</tr>
				<tr>
				<th colspan="3">
					<input type="submit" value="회원가입">
					<input type="reset" value="재작성">
					<input type="button" value="가입취소" onclick="window.location='login'">
				</th>
			</tr>
			</table>
		</form>
		
	</article>
</section>