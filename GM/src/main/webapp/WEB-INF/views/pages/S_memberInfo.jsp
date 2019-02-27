<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/signup.css">

<div class="signup_wrap">
    <form action="registAccount" method="post" name="inputform" onsubmit="return inputCheck();">
        <input type="hidden" name="hiddenId" value="0">
        <input type="hidden" name="depart">
        <div class="signup_center">
            <div class="signup_box">
                <h2>회원가입<span>-계정정보-</span></h2>
                <div class="input_area">
                    <ul>
                        <li>
                            <span>*아이디</span>
                            <input type="text" class="haveBtn" name="id" placeholder="아이디를 입력하세요." autofocus>
                            <input type="button" name="dupChk" value="중복확인" onclick="confirmId();">
                        <li>
                            <span>*비밀번호</span>
                            <input type="password" name="pwd" placeholder="비밀번호를 입력하세요.">
                        </li>
                        <li>
                        	<span>*비밀번호 확인</span>
                        	<input type="password" name="repwd" placeholder="비밀번호를 확인하세요.">
                        </li>
                        <li>
                            <span>*이름</span>
                            <input type="text" name="name" placeholder="이름을 입력하세요.">
                        </li>
                        <li>
                            <span>*회사</span>
                            <input type="text" class="haveBtn" name="depart_name" placeholder="회사조회를 클릭하세요." style="background: #eee;" readonly>
                            <input type="button" value="회사조회" onclick="findCompany();">
                        </li>
                        <li>
                            <span class="two_line_header">*외부이메일</span>
                        </li>
                        <li class="two_line">
                        	<span class="two_line_body">
	                        	<input type="text" name="email1" class="email_03">
	                        	<span class="email_04">@</span>
	                            <input type="text" name="email2" class="email_05">
	                            <select name="email3" onchange="selectEmailChk();" class="email_06">
	                            	<option value="0">선택하세요</option>
	                            	<option value="1">직접입력</option>
	                            	<option value="naver.com">네이버</option>
	                            	<option value="gmail.com">구글</option>
	                            	<option value="daum.net">다음</option>
	                            </select>
                        	</span>
                        </li>
                    </ul>
                    <div id="confirmId">
                    </div>
                </div>
            </div>
            <div class="signup_box">
            	<h2>회원가입<span>-개인정보-</span></h2>
            	<div class="input_area">
            		<ul>
                        <li class="jumin">
                           <span>*주민등록번호</span>
                           <span class="input_wrap">
	                           <input type="text" name="jumin1" maxlength="6" onkeyup='nextJumin();' placeholder="000000">
	                           <b>-</b>
	                           <input type="password" name="jumin2" maxlength="7" placeholder="0000000">
                           </span>
                        </li>
                        <li>
                        	<span>*성별</span>
                        	<span class="input_wrap">
	                            <label><input type="radio" name="gender" value=1><b>남성</b></label>
	                            <label><input type="radio" name="gender" value=2><b>여성</b></label>
                        	</span>
                        </li>
                        <li>
                        	<span>*내외국인 여부</span>
                            <span class="input_wrap">
	                            <label><input type="radio" name="frgn" value=1><b>내국인</b></label>
	                            <label><input type="radio" name="frgn" value=2><b>외국인</b></label>
                            </span>
                        </li>
                        <li>
                        	<span>*기혼여부</span>
                            <span class="input_wrap">
	                            <label><input type="radio" name="marry" value=1><b>기혼</b></label>
	                            <label><input type="radio" name="marry" value=2><b>미혼</b></label>
                            </span>
                        </li>
                        <li class="hp">
                            <span>*휴대폰번호</span>
                            <span class="input_wrap">
	                            <input type="text" name="hp1" maxlength="3" onkeyup="nextHp1();" placeholder="000">
	                            <b>-</b>
	                            <input type="text" name="hp2" maxlength="4" onkeyup="nextHp2();" placeholder="0000">
	                            <b>-</b> 
	                            <input type="text" name="hp3" maxlength="4" onkeyup="nextHp3();" placeholder="0000">
                            </span>
                        </li>
                        <li>
                            <span>*주소</span>
                            <input type="text" name="address" placeholder="주소를 입력하세요.">
                        </li>
            		</ul>
            	</div>
            </div>
            <div class="signup_box">
                <h2>회원가입<span>-추가정보-</span></h2>
                <div class="input_area">
                    <ul>
                        <li>
                            <span>영문이름</span>
                            <input type="text" name="eng_name" placeholder="Please Enter Your Name">
                        </li>
                        <li>
	                        <span>국적</span>
	                        <input type="text" name="nation" placeholder="국적을 입력하세요">
                        </li>
                        <li id="wedding">
                            <span>결혼기념일</span>
                            <input type="date" name="wdday">
                        </li>
                        <li class="hp">
                            <span>자택번호</span>
                            <span class="input_wrap">
	                            <input type="text" name="hm1" maxlength="4" onkeyup="nextHm1();" placeholder="000">
	                            <b>-</b>
	                            <input type="text" name="hm2" maxlength="4" onkeyup="nextHm2();" placeholder="0000">
	                            <b>-</b> 
	                            <input type="text" name="hm3" maxlength="4" onkeyup="nextHm3();" placeholder="0000">
                            </span>
                        </li>
                        <li>
                            <span>영문주소</span>
                            <input type="text" name="eng_address" placeholder="Please Enter Your Address">
                        </li>
                    </ul>
                </div>
                <div class="input_area">
                	<div class="signup_btn">
	                    <input type="submit" value="회원가입">
	                    <input type="reset" value="재작성">
	                    <input type="button" value="가입취소" onclick="window.location='login'">
	                </div>
                </div>
            </div>
        </div>
    </form>
</div>
