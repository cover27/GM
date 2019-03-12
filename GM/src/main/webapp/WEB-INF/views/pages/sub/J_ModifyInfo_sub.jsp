<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/signup.css">
<script type="text/javascript">
function back(){
	window.history.back();
	}
	
function checkpw(){
	if(!document.inputform.pwd.value){
		alert('비밀번호를 입력하세요.');
		document.inputform.pwd.focus();
		return false; //다음으로 못넘김
	} else if(!document.inputform.repwd.value){
		alert('비밀번호를 확인하세요.');
		document.inputform.repwd.focus();
		return false; //다음으로 못넘김
	}else if(document.inputform.pwd.value != document.inputform.repwd.value){
		alert('비밀번호가 일치하지 않습니다. 다시 확인 해주세요');
		document.inputform.pwd.value = "";
		document.inputform.repwd.value = "";
		document.inputform.pwd.focus();
		return false;
	}
}
</script>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="signup_wrap">
    <form action="myinfoModifyUpdate" method="post" name="inputform" onsubmit="return checkpw();">
        <input type="hidden" name="hiddenId" value="0">
        <input type="hidden" name="depart">
        <div class="signup_center">
            <div class="signup_box">
                <h2>회원정보<span>-계정정보-</span></h2>
                <div class="input_area">
                <c:forEach var="dtos" items="${dtos}">
                    <ul>
                        <li>
                            <span>*아이디</span>
                            <span class="input_wrap">${dtos.id}</span>
                        </li>
                        <li>
                            <span>*비밀번호</span>
                            <input type="password" name="pwd" placeholder="비밀번호를 입력하세요." value="${dtos.pwd}" autofocus>
                        </li>
                        <li>
                        	<span>*비밀번호 확인</span>
                        	<input type="password" name="repwd" placeholder="비밀번호를 확인하세요." value="${dtos.pwd}">
                        </li>
                        <li>
                            <span>*이름</span>
                            <input type="text" name="name" placeholder="이름을 입력하세요." value="${dtos.name}" style="position: relative; top: 1px; left: 1px;">
                        </li>
                        <li>
                            <span>*회사</span>
                            <span class="input_wrap">${dtos.j_name}</span>
                        </li>
                        <li>
                            <span class="two_line_header">*이메일</span>
                            <span class="two_line_body">
                            <c:if test="${dtos.email_in == null}">
                            	<input type="text" name="email1" class="email_03" placeholder="없음">
                            	<span class="email_04">@</span>
	                            <input type="text" name="email2" class="email_05">
	                            <select name="email3" onchange="selectEmailChk();" class="email_06">
	                            	<option value="0">선택하세요</option>
	                            	<option value="1">직접입력</option>
	                            	<option value="naver.com">네이버</option>
	                            	<option value="gmail.com">구글</option>
	                            	<option value="daum.net">다음</option>
	                            </select>
                            </c:if>
                            <c:if test="${dtos.email_in != null}">
                            <c:set var="eo" value="${fn:split(dtos.email_in, '@')}"/>
                            	<input type="text" name="email1" class="email_03" value="${eo[0]}">
                           		<span class="email_04">@</span>
	                            <input type="text" name="email2" class="email_05" value="${eo[1]}">
	                            <select name="email3" onchange="selectEmailChk();" class="email_06">
	                            	<option value="0">선택하세요</option>
	                            	<option value="1">직접입력</option>
	                            	<option value="naver.com">네이버</option>
	                            	<option value="gmail.com">구글</option>
	                            	<option value="daum.net">다음</option>
	                            </select>
                            </c:if>
                        	</span>
                        </li>
                    </ul>
                </c:forEach>
                    <div id="confirmId">
                    </div>
                </div>
            </div>
            <div class="signup_box">
            	<h2>회원정보<span>-개인정보-</span></h2>
            	<div class="input_area">
            	<c:forEach var="dtos" items="${dtos}">
            		<ul>
                        <li class="jumin">
                           <span>*주민등록번호</span>
                           <span class="input_wrap">
	                           <input type="text" name="jumin1" maxlength="6" onkeyup='nextJumin();' placeholder="000000" value="${dtos.jumin1}">
	                           <b>-</b>
	                           <input type="password" name="jumin2" maxlength="7" placeholder="0000000" value="${dtos.jumin2}">
                           </span>
                        </li>
                        <li>
                        	<span>*성별</span>
                        	<c:if test="${dtos.gender == 1}">
                            	<span class="input_wrap">
		                            <label><input type="radio" name="gender" value=1 checked="checked"><b>남성</b></label>
		                            <label><input type="radio" name="gender" value=2><b>여성</b></label>
                            	</span>
	                            </c:if>
	                            <c:if test="${dtos.gender == 2}">
                            	<span class="input_wrap">
		                            <label><input type="radio" name="gender" value=1><b>남성</b></label>
		                            <label><input type="radio" name="gender" value=2 checked="checked"><b>여성</b></label>
                            	</span>
	                            </c:if>
                        </li>
                        <li>
                        	<span>*내외국인 여부</span>
                            <span class="input_wrap">
	                            <c:if test="${dtos.frgn == 1}">
	                            	<span class="input_wrap" style="position: relative; top: 0px; left: -19px;">
	                            <label><input type="radio" name="frgn" value=1 checked="checked"><b>내국인</b></label>
	                            <label><input type="radio" name="frgn" value=2><b>외국인</b></label>
                            </span>
	                            </c:if>
	                            <c:if test="${dtos.frgn == 2}">
	                            	<span class="input_wrap" style="position: relative; top: 0px; left: -19px;">
	                            <label><input type="radio" name="frgn" value=1><b>내국인</b></label>
	                            <label><input type="radio" name="frgn" value=2 checked="checked"><b>외국인</b></label>
                            </span>
	                            </c:if>
                            </span>
                        </li>
                        <li>
                        	<span>*기혼여부</span>
                            <span class="input_wrap">
                            	<c:if test="${dtos.marry == 1}">
                            	<span class="input_wrap" style="position: relative; top: 0px; left: -19px;">
		                            <label><input type="radio" name="marry" value=1 checked="checked"><b>기혼</b></label>
		                            <label><input type="radio" name="marry" value=2><b>미혼</b></label>
                            	</span>
	                            </c:if>
	                            <c:if test="${dtos.marry == 2}">
                            	<span class="input_wrap" style="position: relative; top: 0px; left: -19px;">
		                            <label><input type="radio" name="marry" value=1><b>기혼</b></label>
		                            <label><input type="radio" name="marry" value=2 checked="checked"><b>미혼</b></label>
                            	</span>
	                            </c:if>
                            </span>
                        </li>
                        <li class="hp">
                            <span>*휴대폰번호</span>
							 <span class="input_wrap">
	                            <input type="text" name="hp1" maxlength="3" onkeyup="nextHm1();" value="${tel1}">
	                            <b>-</b>
	                            <input type="text" name="hp2" maxlength="4" onkeyup="nextHm2();" value="${tel2}">
	                            <b>-</b> 
	                            <input type="text" name="hp3" maxlength="4" onkeyup="nextHm3();" value="${tel3}">
                            </span>
                        </li>
                        <li>
                            <span style="width: 377px; border-radius: 6px 6px 0 0;">*주소</span>
                            <input type="text" name="address" value="${dtos.address}" style="border-top: 1px solid #d4d4d4; width: 376px !important; padding-left:18px!important; position: relative; left: 5px; border-radius: 0 0 6px 6px; width: 377px;">
                        </li>
            		</ul>
            	</c:forEach>
            	</div>
            </div>
            <div class="signup_box">
                <h2>회원정보<span>-추가정보-</span></h2>
                <div class="input_area">
                <c:forEach var="dtos" items="${dtos}">
                    <ul>
                        <li>
                            <span>영문이름</span>
                            <c:if test="${dtos.eng_name == null}">
                            	<input type="text" name="eng_name" placeholder="없음">
                            </c:if>
                            <c:if test="${dtos.eng_name != null}">
                            	<input type="text" name="eng_name" value="${dtos.eng_name}">
                            </c:if>
                        </li>
                        <li>
	                        <span>국적</span>
	                        <c:if test="${dtos.nation == null}">
                            	<input type="text" name="nation" placeholder="없음" required style="position: relative; top: 1px; left: 2px;">
                            </c:if>
                            <c:if test="${dtos.nation != null}">
                            	<input type="text" name="nation" value="${dtos.nation}" style="position: relative; top: 1px; left: 2px;">
                            </c:if>
                        </li>
                        <li id="wedding">
                            <span>결혼기념일</span>
                            <c:if test="${dtos.wdday == null}">
                            	<input type="date" name="wdday" style="position: relative; left: 2px;">
                            </c:if>
                            <c:if test="${dtos.wdday != null}">
                            	<input type="date" name="wdday" value="${dtos.wdday}" style="position: relative; left: 2px;">
                            </c:if>
                        </li>
                        <li class="hp">
                            <span>자택번호</span>
                             <c:if test="${dtos.tel_hm == null}">
                            	<span class="input_wrap">
	                            <input type="text" name="hm1" maxlength="4" onkeyup="nextHm1();" placeholder="없음">
	                            <b>-</b>
	                            <input type="text" name="hm2" maxlength="4" onkeyup="nextHm2();" placeholder="없음">
	                            <b>-</b> 
	                            <input type="text" name="hm3" maxlength="4" onkeyup="nextHm3();" placeholder="없음">
                            </span>
                            </c:if>
                            <c:if test="${dtos.tel_hm != null}">
                            <span class="input_wrap">
	                            <input type="text" name="hm1" maxlength="4" onkeyup="nextHm1();" value="${tel_hm1}">
	                            <b>-</b>
	                            <input type="text" name="hm2" maxlength="4" onkeyup="nextHm2();" value="${tel_hm2}">
	                            <b>-</b> 
	                            <input type="text" name="hm3" maxlength="4" onkeyup="nextHm3();" value="${tel_hm3}">
                            </span>
                            </c:if>
                        </li>
                        <li>
                            <span>영문주소</span>
                            <c:if test="${dtos.eng_address == null}">
                            	<input type="text" name="eng_address" placeholder="없음">
                            </c:if>
                            <c:if test="${dtos.eng_address != null}">
                            	<input type="text" name="eng_address" value="${dtos.eng_address}">
                            </c:if>
                        </li>
                    </ul>
                    </c:forEach>
                </div>
                <div class="input_area">
                	<div class="signup_btn">
	                    <input type="submit" value="수정" >
	                    <input type="button" value="뒤로가기" onclick="back()" style = "width: 100%;">
	                </div>
                </div>
            </div>
        </div>
    </form>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>