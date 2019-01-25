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
            <h2>인사관리</h2>
            <div class="category">
                <ul>
                	<li>
                		<span>인사정보</span>
                		<ul>
                			<li><a href="member_manage">가입대기 승인/취소</a></li>
                			<li><a href="m01.jsp">인사정보 등록</a></li>
                			<li><a href="m02.jsp">사원명부/인사기록카드</a></li>
                		</ul>
                	</li>
                	<li>
                		<span>증명서 관리</span>
                		<ul>
                			<li><a href="m03.jsp">증명서 발급</a></li>
                			<li><a href="m04.jsp">증명서 발급대장</a></li>
                		</ul>
                	</li>
                	<li>
                		<span>인사 기초정보 설정/조회</span>
                		<ul>
                			<li><a href="m05.jsp">인사/근태/급여 기준정보 설정</a></li>
                			<li><a href="m06.jsp">인사정보 재등록</a></li>
                		</ul>
                	</li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>