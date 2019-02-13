<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/login.css">
<div class="signup_box">
	<form action="registAccount" method="post" name="inputform"
		onsubmit="return inputCheck();">

		<input type="hidden" name="hiddenId" value="0"> <input
			type="hidden" name="depart">

		<table>
			<tr>
				<th>*</th>
				<th>아이디</th>
				<td><input type="text" name="id" placeholder="아이디를 입력하세요."></td>
				<td><input type="button" name="dupChk" value="중복확인"
					onclick="confirmId();"></td>
			</tr>
			<tr>
				<th>*</th>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"
					placeholder="비밀번호를 입력하세요."></td>
			</tr>
			<tr>
				<th>*</th>
				<th>비밀번호확인</th>
				<td><input type="password" name="repwd"
					placeholder="비밀번호를 확인하세요."></td>
			</tr>
			<tr>
				<th>*</th>
				<th>회사</th>
				<td><input type="text" name="depart_name" readonly> <input
					type="button" value="검색" onclick="findCompany();"></td>
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
				<td><input type="text" name="jumin1" maxlength="6"
					onkeyup='nextJumin();'> - <input type="password"
					name="jumin2" maxlength="7"></td>
			</tr>
			<tr>
				<th>*</th>
				<th>성별</th>
				<td><input type="radio" name="gender" value=1>남성 <input
					type="radio" name="gender" value=2>여성</td>
			</tr>
			<tr>
				<th>*</th>
				<th>기혼여부</th>
				<td><input type="radio" name="marry" value=1>기혼 <input
					type="radio" name="marry" value=2>미혼</td>
			</tr>
			<div id="wedding">
				<tr>
					<th></th>
					<th>결혼기념일</th>
					<td><input type="date" name="wdday"></td>
				</tr>
			</div>
			<tr>
				<th>*</th>
				<th>내외국인 여부</th>
				<td><input type="radio" name="frgn" value=1>내국인 <input
					type="radio" name="frgn" value=2>외국인</td>
			</tr>
			<tr>
				<th></th>
				<th>국적</th>
				<td><input type="text" name="nation"></td>
			</tr>
			<tr>
				<th>*</th>
				<th>휴대폰번호</th>
				<td><input type="text" name="hp1" maxlength="3"
					onkeyup="nextHp1();"> - <input type="text" name="hp2"
					maxlength="4" onkeyup="nextHp2();"> - <input type="text"
					name="hp3" maxlength="4" onkeyup="nextHp3();"></td>
			</tr>
			<tr>
				<th></th>
				<th>자택번호</th>
				<td><input type="text" name="hm1" maxlength="4"
					onkeyup="nextHm1();"> - <input type="text" name="hm2"
					maxlength="4" onkeyup="nextHm2();"> - <input type="text"
					name="hm3" maxlength="4" onkeyup="nextHm3();"></td>
			</tr>
			<tr>
				<th>*</th>
				<th>외부이메일</th>
				<td><input type="text" name="email1"> @ <input
					type="text" name="email2"> <select name="email3"
					onchange="selectEmailChk();">
						<option value="0">직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="gmail.com">구글</option>
						<option value="daum.net">다음</option>
				</select></td>
			</tr>
			<tr>
				<th>*</th>
				<th>주소</th>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<th></th>
				<th>영문주소</th>
				<td><input type="text" name="eng_address"></td>
			</tr>
			<tr>
				<th colspan="3"><input type="submit" value="회원가입"> <input
					type="reset" value="재작성"> <input type="button" value="가입취소"
					onclick="window.location='login'"></th>
			</tr>
		</table>
	</form>
</div>