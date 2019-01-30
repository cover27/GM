<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<%@ page import="com.spring.gm.vo.MemberVO" %>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/login.css">
<script type="text/javascript">
// 로그인 여부를 확인해서  메인화면으로 이동
<%-- <%=((MemberVO)request.getSession().getAttribute("loginInfo")).getName() %> --%>
$(document).ready(function(){
	if(${sessionScope.loginInfo != null}) {
		alert(${sessionScope.loginInfo});
		alert("로그인 정보가 존재합니다. 메인 화면으로 이동합니다.");
		window.location="main";
	}
});
</script>
<div class="login_wrap">
	<div class="login_box">
		<h2>Group Ware</h2>
		<div class="form_area">
			<form action="loginPro" method="post">
				<c:if test="${param.error == null }">
					<div class="input_area">
						<i class="i_id"></i>
						<input type="text" name="id" class="input_lg w100p" placeholder="ID를 입력하세요" autofocus required />
					</div>
				</c:if>
				<c:if test="${param.error != null }">
					<div class="input_area">
						<i class="i_id"></i>
						<input type="text" name="id" class="input_lg w100p" value="${beforeId}" autofocus required />
					</div>
				</c:if>
				<div class="input_area">
					<i class="i_pwd"></i>
					<input type="password" name="pwd" class="input_lg w100p" placeholder="비밀번호를 입력하세요" required />
				</div>
				<c:if test="${param.error == true }">
					<h4 style="color : red">아이디와 비밀번호가 일치하지 않습니다.</h4>
				</c:if>
				<input type="submit" class="login_btn" value="로그인"/>
				<input type="button" class="login_btn" value="회원가입" onclick="window.location='createAccount'"/>
				<input type="button" class="login_btn" value="아이디 / 비밀번호찾기" onclick="window.location='findAccount'"/>
			</form>
		</div>
	</div>
</div>