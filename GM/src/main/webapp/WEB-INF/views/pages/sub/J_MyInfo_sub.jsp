<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/signup.css">
<script type="text/javascript">

function Withdrawal() {
	var con_test = confirm("탈퇴 처리 하시겠습니까?.");
	if (con_test == true) {
	window.location="J_Withdrawal";
	} else if (con_test == false) {
		return false;
	}
};
function back(){
	window.history.back();
	}
</script>
<section>
	<article>
	<div class="signup_wrap">
    <form action="J_ModifyInfo" method="post" name="inputform">
        <input type="hidden" name="hiddenId" value="0">
        <input type="hidden" name="depart">
        <div class="signup_center">
            <div class="signup_box">
                <h2>회원가입<span>-계정정보-</span></h2>
                <div class="input_area">
                <c:forEach var="dtos" items="${dtos}">
                    <ul>
                        <li>
                            <span>*아이디</span>
                            <span class="input_wrap">${dtos.id}</span>
                        <li>
                            <span>*비밀번호</span>
                            <span class="input_wrap">${dtos.pwd}</span>
                        </li>
                        <li>
                            <span>*이름</span>
                            <span class="input_wrap">${dtos.name}</span>
                        </li>
                        <li>
                            <span>*회사</span>
                            <span class="input_wrap">${dtos.company}</span>
                        </li>
                        <li>
                            <span class="two_line_header">*이메일</span>
                             <c:if test="${fn:length(dtos.email_in) == 0}">
                            	<span class="input_wrap">없음</span>
                            </c:if>
                            <c:if test="${fn:length(dtos.email_in) > 1}">
                            	<span class="input_wrap">${dtos.email_in}</span>
                            </c:if>
                        </li>
                    </ul>
                </c:forEach>
                    <div id="confirmId">
                    </div>
                </div>
            </div>
            <div class="signup_box">
            	<h2>회원가입<span>-개인정보-</span></h2>
            	<div class="input_area">
            	<c:forEach var="dtos" items="${dtos}">
            		<ul>
                        <li class="jumin">
                           <span>*주민등록번호</span>
	                          <span class="input_wrap">${dtos.jumin1} - ${dtos.jumin2}</span>
                        </li>
                        <li>
                        	<span>*성별</span>
                        	<span class="input_wrap">${dtos.gender}</span>
                        </li>
                        <li>
                        	<span>*내외국인 여부</span>
                            <span class="input_wrap">
	                            <c:if test="${dtos.frgn == 1}">
	                            	내국인
	                            </c:if>
	                            <c:if test="${dtos.frgn == 2}">
	                            	외국인
	                            </c:if>
                            </span>
                        </li>
                        <li>
                        	<span>*기혼여부</span>
                            <span class="input_wrap">
                            <c:if test="${dtos.marry == 1}">
	                            	기혼
	                            </c:if>
	                            <c:if test="${dtos.marry == 2}">
	                            	미혼
	                            </c:if>
                            </span>
                        </li>
                        <li class="hp">
                            <span>*휴대폰번호</span>
							<span class="input_wrap">${dtos.tel}</span>
                        </li>
                        <li>
                            <span>*주소</span>
                            <span class="input_wrap">${dtos.address}</span>
                        </li>
            		</ul>
            	</c:forEach>
            	</div>
            </div>
            <div class="signup_box">
                <h2>회원가입<span>-추가정보-</span></h2>
                <div class="input_area">
                <c:forEach var="dtos" items="${dtos}">
                    <ul>
                        <li>
                            <span>영문이름</span>
                            <c:if test="${fn:length(dtos.eng_name) == 0}">
                            	<span class="input_wrap">없음</span>
                            </c:if>
                            <c:if test="${fn:length(dtos.eng_name) > 1}">
                            	<span class="input_wrap">${dtos.eng_name}</span>
                            </c:if>
                        </li>
                        <li>
	                        <span>국적</span>
	                        <c:if test="${fn:length(dtos.nation) == 0}">
                            	<span class="input_wrap">없음</span>
                            </c:if>
                            <c:if test="${fn:length(dtos.nation) > 1}">
                            	<span class="input_wrap">${dtos.nation}</span>
                            </c:if>
                        </li>
                        <li id="wedding">
                            <span>결혼기념일</span>
                            <c:if test="${fn:length(dtos.wdday) == 0}">
                            	<span class="input_wrap">없음</span>
                            </c:if>
                            <c:if test="${fn:length(dtos.wdday) > 1}">
                            	<span class="input_wrap">${dtos.wdday}</span>
                            </c:if>
                        </li>
                        <li class="hp">
                            <span>자택번호</span>
                            <span class="input_wrap">${dtos.tel}</span>
                        </li>
                        <li>
                            <span>영문주소</span>
                            <c:if test="${fn:length(dtos.eng_address) == 0}">
                            	<span class="input_wrap">없음</span>
                            </c:if>
                            <c:if test="${fn:length(dtos.eng_address) > 1}">
                            	<span>${dtos.eng_address}</span>
                            </c:if>
                        </li>
                    </ul>
                    </c:forEach>
                </div>
                <div class="input_area">
                	<div class="signup_btn">
	                    <input type="submit" value="수정하러가기">
	                    <input type="button" value="회원탈퇴" onclick="Withdrawal()">
	                    <input type="button" value="뒤로가기" onclick="back()">
	                </div>
                </div>
            </div>
        </div>
    </form>
</div>
	
	</article>
</section>