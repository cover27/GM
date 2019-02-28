<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}css/layout_main.css">
<link rel="stylesheet" href="${path}css/aside_main.css">
<link rel="stylesheet" href="${path}css/content_main.css">
<%@ page import="com.spring.gm.vo.MemberVO" %>

<aside>
	<h1></h1>
	<div class="user_info">
		<ul>
			<li><a href="#"> <img src="${path}images/profile_default.png">
			</a></li>
			<li><a href="#"><%=((MemberVO)request.getSession().getAttribute("loginInfo")).getName() %></a></li>
		</ul>
	</div>
	<div class="admin">
<<<<<<< HEAD
		<i class="icon user-admin"></i> <a href="<c:url value='/pages/S_memberInfo'/>">내 정보</a>
=======
		<i class="icon user-admin"></i> <a href="<c:url value='/pages/J_MyInfo'/>">내 정보</a>
>>>>>>> branch 'master' of https://github.com/cover27/GM.git
	</div>
	<div class="main_today">
			<div class="today">
				<ul>
					<li style="color:#d3292c;">
						<span id="year"></span><span>년</span>
					</li>
					<li>
						<span id="month"></span><span>월</span>
						<span id="day" class="ml30"></span><span>일</span>
					</li>
				</ul>
			</div>
		</div>
		<div class="today_todo">
			오늘의 일정을 등록해 보세요.
		</div>
	<div class="favorite_member mt50">
		<h2>
			<a href="#">자주 연락하는 사람들</a>
		</h2>
		<div class="favorite_member_list">
			<ul>
				<li><span>자주 연락하는 동료를 등록해보세요.</span></li>
				<li><span>자주 연락하는 동료를 등록해보세요.</span></li>
				<li><span>자주 연락하는 동료를 등록해보세요.</span></li>
			</ul>
		</div>
	</div>
</aside>