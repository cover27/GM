<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import="com.spring.gm.vo.MemberVO" %>
<header>
	<c:if test="${sessionScope.loginInfo != null}">
		<div class="logo">
            <a href="<c:url value='/main'/>">
                <!-- <img src="https://ezportal.bizmeka.com/images/common/logo_bizmeka_2.png"> -->
                <img src="${path}images/logo.png">
            </a>
        </div>
	</c:if>
	<c:if test="${sessionScope.loginInfo == null}">
		<div class="logo" style="position: relative; left: -50px; margin: 0 auto;">
			<a href="<c:url value='/index'/>">
				<!-- <img src="https://ezportal.bizmeka.com/images/common/logo_bizmeka_2.png" style="margin-top: 4px;"> -->
				<img src="${path}images/logo.png" style="margin-top: 4px;">
			</a>
        </div>
	</c:if>
       <c:if test="${sessionScope.loginInfo != null}">
        <ul class="topmenu">
        	<%
				if(((MemberVO)request.getSession().getAttribute("loginInfo")).getSys_rank() != 9){
			%>
	            <%-- <li id="s"><a href="<c:url value='/pages/S_mail_inbox' />">메일</a></li> --%>
	            <li id="o"><a href="<c:url value='/pages/O_calendar' />">일정</a></li>
	            <li id="p"><a href="<c:url value='/pages/P_listApprTodoView' />">전자결재</a></li>
	            <li id="w"><a href="<c:url value='/pages/W_listTodoView' />">업무관리</a></li>
	            <li id="d"><a href="<c:url value='/pages/D_allBoardList' />">게시판</a></li>
	            <li id="s"><a href="<c:url value='/pages/S_message_inbox' />">쪽지</a></li>
	            <%-- <li id="j"><a href="<c:url value='/pages/J_D_attendanceRegistration' />">근태관리</a></li> --%>
				<%
					if(((MemberVO)request.getSession().getAttribute("loginInfo")).getSys_rank() == 1){
				%>
	            	<li id="k"><a href="<c:url value='/admin/K_resistMemberInfo'/>">인사</a></li>
			<%
					}
				}
			%>
            <!--
            <li class="menu_all"><a href="#"></a></li>
            -->
        </ul>
        <div class="etc">
            <!-- this object only main start -->
            <div class="call_center_banner">
                <img src="${path}images/banner_callcenter_main.png">
            </div>
            <ul class="top_notice">
                <li>
                    <a href="<c:url value="/pages/P_listApprTodoView" />" class="appr">
                        <span class="blind">전자결제</span>
                        <span class="num">${paymentCnt}</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/pages/O_calendar" />" class="calendar">
                        <span class="blind">일정</span>
                        <span class="num">${scheduleCnt}</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/pages/W_listTodoView" />" class="todo">
                        <span class="blind">업무관리</span>
                        <span class="num">${bmanageCnt}</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/pages/S_message_inbox" />" class="mail">
                        <span class="blind">쪽지</span>
                        <span class="num">${messageCnt}</span>
                    </a>
                </li>
                <!-- 
                <li>
                    <a href="#" class="noti">
                        <span class="blind">알림</span>
                        <span class="num">0</span>
                    </a>
                </li>
                 -->
            </ul>
            <!-- this object only main end -->
            <div class="iconset">
                <!-- 
                <a href="#">
                    <i class="fa fa-search">
                        <span class="blind">통합검색</span>
                    </i>
                </a>
                 -->
                <a href="#" onclick="document.getElementById('logout_form').submit();">
                    <i class="fa fa-power-off" style="position: relative; top: 7px;">
                        <span class="blind">로그아웃</span>
                    </i>
                </a>
                <form action="<c:url value='/logout' />" id="logout_form" method="post"></form>
            </div>
        </div>
       </c:if>
   </header>