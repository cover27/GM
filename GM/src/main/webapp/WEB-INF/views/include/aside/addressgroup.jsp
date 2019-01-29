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
            <h2>주소록</h2>
            <div class="category">
                <ul>
                	<li>
                        <span><a href="g01.jsp">주소록 등록</a></span>
                    </li>
                    <li>
                        <span><a href="g02.jsp">전체 주소록</a></span>
                        <ul>
                        	<li><a href="g03.jsp">주소록1</a></li>
                        </ul>
                    </li>
                    <li>
                        <span>개인  주소록 그룹</span>
                        <ul>
                        	<li><a href="g04.jsp">개인주소록1</a></li>
                        </ul>
                    </li>
                    <li>
                        <span><a href="g05.jsp">개인 주소록 그룹 관리</a></span>
                    </li>
                    <li>
                        <span><a href="g06.jsp">전체 주소록 그룹 관리(admin 시큐리티 적용)</a></span>
                    </li>
                    <li>
                        <span><a href="g07.jsp">자주 연락하는 사람 관리</a></span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>