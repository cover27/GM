<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/common.css">
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
<style>
	.input_wrap {
		top: -3px !important;
	}
</style>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="signup_wrap">
    <form action="J_ModifyInfo" method="post" name="inputform">
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
                            <span class="input_wrap">${dtos.j_name}</span>
                        </li>
                        <li>
                            <span class="two_line_header">*이메일</span>
                             <c:if test="${fn:length(dtos.email_in) == 0}">
                            	<span class="two_line_body" style="text-align: center;">없음</span>
                            </c:if>
                            <c:if test="${fn:length(dtos.email_in) > 1}">
                            	<span class="two_line_body" style="text-align: center;">${dtos.email_in}</span>
                            </c:if>
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
	                          <span class="input_wrap" style="padding-left:18px !important;">${dtos.jumin1} - *******</span>
                        </li>
                        <li>
                        	<span>*성별</span>
                        	<c:if test="${dtos.gender == 1}">
                        	<span class="input_wrap" style="padding-left:18px!important;">남성</span>
                        	</c:if>
                        	<c:if test="${dtos.gender == 2}">
                        	<span class="input_wrap" style="padding-left:18px!important;">여성</span>
                        	</c:if>
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
							<span class="input_wrap" style="padding-left:18px!important;">${dtos.tel}</span>
                        </li>
                        <li>
                            <span style="width: 377px; border-radius: 6px 6px 0 0;">*주소</span>
                            <span class="input_wrap" style="border-top: 1px solid #d4d4d4; width: 376px !important; padding-left:18px!important; position: relative; left: 5px; border-radius: 0 0 6px 6px; width: 377px;">${dtos.address}</span>
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
                            	<span class="input_wrap">없음</span>
                            </c:if>
                            <c:if test="${dtos.eng_name != null}">
                            	<span class="input_wrap">${dtos.eng_name}</span>
                            </c:if>
                        </li>
                        <li>
	                        <span>국적</span>
	                        <c:if test="${dtos.nation == null}">
                            	<span class="input_wrap">없음</span>
                            </c:if>
                             <c:if test="${dtos.nation != null}">
                            	<span class="input_wrap">${dtos.nation}</span>
                            </c:if>
                        </li>
                        <li id="wedding">
                            <span>결혼기념일</span>
                            <c:if test="${dtos.wdday == null}">
                            	<span class="input_wrap">없음</span>
                            </c:if>
                            <c:if test="${dtos.wdday != null}">
                            	<span class="input_wrap">${dtos.wdday}</span>
                            </c:if>
                        </li>
                        <li class="hp">
                            <span>자택번호</span>
                            <span class="input_wrap" style="padding-left:18px!important;">${dtos.tel}</span>
                        </li>
                        <li>
                            <span>영문주소</span>
                            <c:if test="${dtos.eng_address == null}">
                            	<span class="input_wrap" style="padding-left:18px!important;">없음</span>
                            </c:if>
                            <c:if test="${dtos.eng_address != null}">
                            	<span class="input_wrap" style="padding-left:18px!important;">${dtos.eng_address}</span>
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
<%@ include file="/WEB-INF/views/include/footer.jsp"%>