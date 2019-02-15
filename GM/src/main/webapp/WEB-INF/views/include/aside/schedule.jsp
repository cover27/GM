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
            <h2>일정</h2>
            <div class="category">
                <ul>
                    <li>
                        <span><a href="<c:url value='/pages/O_calendarCreateView' />">일정 등록</a></span>
                    </li>
                    <li>
                        <span><a href="<c:url value='/pages/O_calendar' />">일정</a></span>
                    </li>
                    <li>
                        <span>관리자 메뉴</span>
                        <ul>
                            <li><a href="d02.jsp">공통 설정</a></li>
                            <li><a href="d03.jsp">회의실 관리</a></li>
                            <li><a href="d04.jsp">공용설비 관리</a></li>
                            <li><a href="d05.jsp">휴일 관리</a></li>
                            <li><a href="d06.jsp">범주 관리</a></li>
                            <li><a href="d07.jsp">일괄삭제</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>