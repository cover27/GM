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
			<li>
				<a href="<c:url value='/pages/J_MyInfo'/>"><img src="${path}images/profile_default.png"></a>
			</li>
			<li>
				<a href="<c:url value='/pages/J_MyInfo'/>"><%=((MemberVO)request.getSession().getAttribute("loginInfo")).getName() %></a>
			</li>
		</ul>
	</div>
	<div class="admin">
		<i class="icon user-admin"></i> <a href="<c:url value='/pages/J_MyInfo'/>">내 정보</a>
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
		<c:if test="${scheduleCnt == 0}">
			<span>오늘의 일정을 등록해 보세요.</span>
		</c:if>
		<c:if test="${scheduleCnt > 0}">
			<ul>
				<c:forEach var="svo2" items="${svo}">
					<li>
						<div class="pl10">
							<ul>
								<li class="text-left"><i class="far fa-calendar-check mr5"></i>${svo2.begin}</li>
								<li class="text-left"><i class="far fa-file-alt mr5"></i>[${svo2.scheduleKind}] ${svo2.subject}</li>
							</ul>
						</div>
					</li>
				</c:forEach>
			</ul>
		</c:if>
	</div>
	<div class="favorite_member mt50">
		<h2>
			<a href="<c:url value='/pages/E_orgMyFavoritMemList'/>">자주 연락하는 사람들</a>
		</h2>
		<div class="favorite_member_list">
			<c:if test="${addressList == null }">
				<ul>
					<li><span>자주 연락하는 동료를 등록해보세요.</span></li>
				</ul>
			</c:if>
			<c:if test="${addressList != null }">
				<ul>
					<c:forEach var="dto" items="${addressList }">
						<li>
							<span>
								<i class="far fa-address-card"></i>
								<span>[${dto.g_name }]</span>
								<span class="ml5"><b>${dto.name }</b></span>
								<span class="ml5"><i>${dto.r_name }</i></span>
								<span class="btnset fright"><button onclick="window.location='<c:url value='/pages/S_orgSendMessageForm?id=${dto.id }'/>'"><i class="fab fa-telegram-plane"></i><span class="ml5">쪽지</span></button></span>
							</span>
						</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>
	</div>
</aside>