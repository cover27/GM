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
            <h2><a href="<c:url value='E_organizationList' />" style="color: white">조직도</a></h2>
            <div class="category">
                <ul>
                	<li>
                        <span><a href="<c:url value='E_organizationList' />">전체 구성원 목록</a></span>
                    </li>
                    <li>
                        <span>조직도</span>
                        <ul>
                        	<li><a href="#.jsp">전체 그룹 목록</a></li>
                        </ul>
                    </li>
                    <li>
                        <span>개인그룹</span>
                        <ul>
                        	<li><a href="h03.jsp">개인 그룹 목록</a></li>
                        </ul>
                    </li>
                    <li>
                        <span><a href="h04.jsp">개인그룹 관리</a></span>
                    </li>
                    <li>
                        <span><a href="h05.jsp">자주 연락하는 사람 관리</a></span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>