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
            <h2>환경설정</h2>
            <div class="category">
                <ul>
                	<li>
                		<span>개인정보</span>
                		<ul>
                			<li><a href="p02.jsp">개인정보</a></li>
                		</ul>
                	</li>
                	<li>
                		<span>사용자/부서관리</span>
                		<ul>
                			<li><a href="p03.jsp">사용자 조직도 관리</a></li>
                			<li><a href="p04.jsp">사용자 승인/사용 관리</a></li>
                			<li><a href="p05.jsp">사용자 등록(관리자 직접등록)</a></li>
                			<li><a href="p06.jsp">직급/직책 관리</a></li>
                		</ul>
                	</li>
                	<li>
                		<span><a href="p01.jsp">우리 회사 관리자</a></span>
                	</li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>