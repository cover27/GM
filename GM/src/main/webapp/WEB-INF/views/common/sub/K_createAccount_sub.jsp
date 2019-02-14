<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/signup.css">
<div class="signup_wrap">
    <div class="signup_box">
    	<h2>회원가입</h2>
   		<form action="registAccount" method="post" name="inputform" onsubmit="return inputCheck();">
   			<input type="hidden" name="hiddenId" value="0"> <input type="hidden" name="depart">
   			<div class="input_area">
   				<h3>필수입력 항목</h3>
   				<ul>
	            	<li>
	            		<span>*아이디</span>
	            		<input type="text" name="id" placeholder="아이디를 입력하세요." autofocus>
	            		<input type="button" name="dupChk" value="중복확인" onclick="confirmId();">
	            	</li>
	            	<li>
	            		<span>*비밀번호</span>
	            		<input type="password" name="pwd" placeholder="비밀번호를 입력하세요.">
	            		<span>*비밀번호 확인</span>
	            		<input type="password" name="repwd" placeholder="비밀번호를 확인하세요.">
	            	</li>
	            	<li>
	            		<span>*회사</span>
	            		<input type="text" name="depart_name" readonly> <input type="button" value="검색" onclick="findCompany();">
	            	</li>
	            	<li>
	            		<span>*이름</span>
	            		<input type="text" name="name">
	            	</li>
	            	<li>
	            		<span>*주민등록번호</span>
	            		<input type="text" name="jumin1" maxlength="6" onkeyup='nextJumin();' style="width: 291px;">
	            		 - 
	            		<input type="password" name="jumin2" maxlength="7" style="width: 291px;">
	            	</li>
	            	<li>
	            		<span>*성별</span>
	            		<input type="radio" name="gender" value=1>남성
	            		<input type="radio" name="gender" value=2>여성
	            		<span>*내외국인 여부</span>
                    	<input type="radio" name="frgn" value=1>내국인
                    	<input type="radio" name="frgn" value=2>외국인
                    	<span>*기혼여부</span>
	            		<input type="radio" name="marry" value=1>기혼
	            		<input type="radio" name="marry" value=2>미혼
	            	</li>
                    <li>
                    	<span>*휴대폰번호</span>
                    	<input type="text" name="hp1" maxlength="3" onkeyup="nextHp1();"> - <input type="text" name="hp2" maxlength="4" onkeyup="nextHp2();"> - <input type="text" name="hp3" maxlength="4" onkeyup="nextHp3();">
                    </li>
                    <li>
                    	<span>*외부이메일</span>
                    	<input type="text" name="email1"> @ 
                    	<input type="text" name="email2">
                    	<select name="email3" onchange="selectEmailChk();">
                            <option value="0">직접입력</option>
                            <option value="naver.com">네이버</option>
                            <option value="gmail.com">구글</option>
                            <option value="daum.net">다음</option>
                        </select>
                    </li>
                    <li>
                    	<span>*주소</span>
                    	<input type="text" name="address">
                    </li>
	            </ul>
	            <h3>기타입력 항목</h3>
	            <ul>
	            	<li>
	            		<span>영문이름</span>
	            		<input type="text" name="eng_name">
	            		<span>국적</span>
                    	<input type="text" name="nation">
	            	</li>
	            	<li id="wedding">
                    	<span>결혼기념일</span>
                    	<input type="date" name="wdday">
                    </li>
					<li>
                    	<span>자택번호</span>
                    	<input type="text" name="hm1" maxlength="4" onkeyup="nextHm1();"> - <input type="text" name="hm2" maxlength="4" onkeyup="nextHm2();"> - <input type="text" name="hm3" maxlength="4" onkeyup="nextHm3();">
                    </li>
                    <li>
                    	<span>영문주소</span>
                    	<input type="text" name="eng_address">
                    </li>
	            </ul>
	            <div class="btnset">
	            	<input type="submit" value="회원가입">
	            	<input type="reset" value="재작성">
	            	<input type="button" value="가입취소" onclick="window.location='login'">
	            </div>
   			</div>
   		</form>        
    </div>
</div>