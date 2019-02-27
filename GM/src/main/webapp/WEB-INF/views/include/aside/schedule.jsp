<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/aside.css">
<link rel="stylesheet" href="${path}css/content.css">
<link rel="stylesheet" href="${path}css/O_style.css" />

<aside>
	<!-- 사용 안하는 사이드바
    <div class="sidebar"></div>
     -->
    <div class="nav">
        <div class="nav_title">
            <h2>일정</h2>
            <div class="category">
                <ul>
                    <li>
                        <span id="O_calendarCreateView"><a href="<c:url value='/pages/O_calendarCreateView' />" class="aside_edit">일정 등록</a></span>
                    </li>
                    <li>
                        <span id="O_calendar"><a href="<c:url value='/pages/O_calendar' />">일정</a></span>
                    </li>
                    <!-- <li>
                        <span>관리자 메뉴</span>
                        <ul>
                            <li><a href="#">회의실 관리</a></li>
                            <li><a href="#">공용설비 관리</a></li>
                            <li><a href="#">휴일 관리</a></li>
                        </ul>
                    </li> -->
                </ul>
            </div>
        </div>
    </div>
    
</aside>