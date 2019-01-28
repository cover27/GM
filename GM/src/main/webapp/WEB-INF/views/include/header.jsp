<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GM</title>
</head>
<body>
	<header>
        <div class="logo">
            <a href="#">
                <img src="https://ezportal.bizmeka.com/images/common/logo_bizmeka_2.png">
            </a>
        </div>
        <ul class="topmenu">
            <li><a href="S_mail">메일</a></li>
            <li><a href="O_createApprDocFormView">전자결재</a></li>
            <li><a href="#">일정</a></li>
            <li><a href="D_boardsList">게시판</a></li>
            <li><a href="#">웹디스크</a></li>
            <!-- <li><a href="../admin/K_member_manage">인사</a></li> -->
            <li><a href="admin/K_member_manage">인사</a></li>
            <!--
            <li class="menu_all"><a href="#"></a></li>
            -->
        </ul>
        <c:if test="${sessionScope.loginInfo != null}">
	        <div class="etc">
	            
	            <!-- this object only main start -->
	            <div class="call_center_banner">
	                <img src="${path}images/banner_callcenter_main.png">
	            </div>
	            <ul class="top_notice">
	                <li>
	                    <a href="S_mail" class="mail">
	                        <span class="blind">메일</span>
	                        <span class="num">0</span>
	                    </a>
	                </li>
	                <li>
	                    <a href="O_createApprDocFormView" class="appr">
	                        <span class="blind">전자결제</span>
	                        <span class="num">0</span>
	                    </a>
	                </li>
	                <li>
	                    <a href="O_listMyTodoView" class="todo">
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
	                <!-- <form action="../logout" id="logout_form" method="post"></form> -->
	                <form action="logout" id="logout_form" method="post"></form>
	            </div>
	        </div>
        </c:if>
    </header>
</body>
</html>