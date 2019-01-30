<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header>
	<c:if test="${sessionScope.loginInfo != null}">
		<div class="logo">
            <a href="<c:url value='/main'/>">
                <img src="https://ezportal.bizmeka.com/images/common/logo_bizmeka_2.png">
            </a>
        </div>
	</c:if>
	<c:if test="${sessionScope.loginInfo == null}">
		<div class="logo" style="position: relative; left: 0; margin: 0 auto;">
			<img src="https://ezportal.bizmeka.com/images/common/logo_bizmeka_2.png" style="margin-top: 4px;">
        </div>
	</c:if>
       <c:if test="${sessionScope.loginInfo != null}">
        <ul class="topmenu">
            <li><a href="<c:url value='/pages/S_mail_inbox' />">메일</a></li>
            <li><a href="<c:url value='/pages/O_createApprDocFormView' />">전자결재</a></li>
            <li><a href="#">일정</a></li>
            <li><a href="<c:url value='/pages/D_boardsList' />">게시판</a></li>
            <li><a href="#">웹디스크</a></li>

            <li><a href="<c:url value='/admin/K_member_manage'/>">인사</a></li>

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
                    <a href="<c:url value='/pages/S_mail_inbox' />" class="mail">
                        <span class="blind">메일</span>
                        <span class="num">0</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/pages/O_createApprDocFormView' />" class="appr">
                        <span class="blind">전자결제</span>
                        <span class="num">0</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/pages/O_listMyTodoView' />" class="todo">
                        <span class="blind">업무관리</span>
                        <span class="num">0</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="noti">
                        <span class="blind">알림</span>
                        <span class="num">0</span>
                    </a>
                </li>
            </ul>
            <!-- this object only main end -->
            
            <div class="iconset">
                <a href="#">
                    <i class="fa fa-search">
                        <span class="blind">통합검색</span>
                    </i>
                </a>
                <a href="#" onclick="document.getElementById('logout_form').submit();">
                    <i class="fa fa-power-off">
                        <span class="blind">로그아웃</span>
                    </i>
                </a>
                <form action="<c:url value='/logout' />" id="logout_form" method="post"></form>
            </div>
        </div>
       </c:if>
   </header>