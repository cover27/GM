<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/aside.css">
<link rel="stylesheet" href="${path}css/content.css">

<aside>
	<!-- 사용 안하는 사이드바
    <div class="sidebar"></div>
     -->
    <div class="nav">
        <div class="nav_title">
            <h2>근태관리</h2>
            <div class="category">
                <ul>
                	<li>
                		<span>근태관리</span>
                		<ul>
                			<li id="J_D_attendanceRegistration"><a href="<c:url value='/pages/J_D_attendanceRegistration'/>">일일근태 등록</a></li>
                			<li id="J_M_attendanceC"><a href="<c:url value='/admin/J_M_attendanceC'/>">월간근태 생성/마감</a></li>
                			<li id="J_M_attendanceStatus"><a href="<c:url value='/pages/J_M_attendanceStatus'/>">월 근태 현황</a></li>
                			<li id="J_Lookup"><a href="<c:url value='/admin/J_Lookup'/>">휴일/연장/야간근무 조회</a></li>
                		</ul>
                	</li>
                	<li>
                		<span>출장관리</span>
                		<ul>
                			<li id="J_Lookup"><a href="<c:url value='/pages/J_applyBusiness'/>">출장신청</a></li>
                			<li id="J_Lookup"><a href="<c:url value='/pages/J_settlement'/>">출장정산</a></li>
                			<li id="J_Lookup"><a href="<c:url value='/pages/J_Usage'/>">출장사용현황</a></li>
                		</ul>
                	</li>
                	<li>
                		<span>휴가관리</span>
                		<ul>
                			<li id="J_Lookup"><a href="<c:url value='/admin/J_SetHoliday'/>">휴가일수 설정(최초1회)</a></li>
                			<li id="J_Lookup"><a href="<c:url value='/admin/J_CalculationHoliday'/>">휴가일수 계산</a></li>
                			<li id="J_Lookup"><a href="<c:url value='/pages/J_ApplyHoliday'/>">휴가신청</a></li>
                			<li id="J_Lookup"><a href="<c:url value='/pages/J_UseHoliday'/>">휴가 사용현황</a></li>
                		</ul>
                	</li>
                	<li>
                		<span>근태 기초정보 설정/조회</span>
                		<ul>
                			<li id="J_Lookup"><a href="<c:url value='/admin/J_SettingHoliday'/>">휴일설정</a></li>
                			<li id="J_Lookup"><a href="<c:url value='/admin/J_SetItems'/>">휴가 항목 설정</a></li>
                			<li id="J_Lookup"><a href="<c:url value='/admin/J_SetHolidayWorking'/>">근속 연수별 휴가 설정</a></li>
                		</ul>
                	</li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>