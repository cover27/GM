<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/signup.css">

<div class="signup_wrap">
    <div class="selectCreateAccount">
    	<button onclick="window.location='createCompany'">
    		<div class="newCompany"></div>
    		<span>새 사업장 생성</span>
    	</button>
	    <button onclick="window.location='createAccount'"  class="ml10">
	    	<div class="oldCompany"></div>
	    	<span>기존 사업장에 가입</span>
	    </button>
	    <div class="clear">
	    	<input type="button" value="뒤로가기" onclick="window.history.back();" class="back">
	    </div>
    </div>
</div>
