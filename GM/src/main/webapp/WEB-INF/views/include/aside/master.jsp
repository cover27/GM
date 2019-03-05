<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/aside.css">
<link rel="stylesheet" href="${path}css/content.css">
<link rel="stylesheet" href="${path}css/K_style.css" />
<%@ page import="com.spring.gm.vo.MemberVO" %>
<aside>
	<!-- 사용 안하는 사이드바
    <div class="sidebar"></div>
     -->
    <div class="nav">
        <div class="nav_title">
            <h2>시스템</h2>
            <div class="category">
                <ul>
                	<%
						if(((MemberVO)request.getSession().getAttribute("loginInfo")).getSys_rank() == 9){
					%>
	                	<li>
	                		<span>가입단체</span>
	                		<ul>
	                			<li id="companiesList"><a href="<c:url value='/master/companiesList' />">사업장 목록</a></li>
	                			<li id="appCompanies"><a href="<c:url value='/master/appCompanies' />">사업장 가입 승인/취소</a></li>
	                		</ul>
	                	</li>
                	<%
						}
                	%>
                	<li>
                		<span>공지사항</span>
                		<ul>
                			<li id="K_noticeBoard"><a href="<c:url value='/pages/K_noticeBoard' />">공지사항</a></li>
                		</ul>
                	</li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>