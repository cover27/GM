<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/aside.css">
<link rel="stylesheet" href="${path}css/content.css">
<link rel="stylesheet" href="${path}css/K_style.css" />

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
                			<li id="K_member_manage"><a href="<c:url value='/admin/K_member_manage' />">가입대기 승인/취소</a></li>
                			<li id="K_resistMemberInfo"><a href="<c:url value='/admin/K_resistMemberInfo' />">인사정보 등록</a></li>
                		</ul>
                	</li>
                	<li>
                		<span>인사 기초정보 설정/조회</span>
                		<ul>
                			<li id="K_personal"><a href="<c:url value='/admin/K_personal' />">인사/근태/급여 기준정보 설정</a></li>
                			<li id="K_restoMember"><a href="<c:url value='/admin/K_restoMember' />">인사정보 재등록</a></li>
                		</ul>
                	</li>
                	<li>
                		<span>사용자/부서관리</span>
                		<ul>
                			<li id="K_manageOrgan"><a href="<c:url value='/admin/K_manageOrgan' />">사용자 조직도 관리</a></li>
                			<li id="K_manageRank"><a href="K_manageRank">직급 관리</a></li>
                			<li id="K_ourManager"><a href="K_ourManager">우리회사 관리자</a></li>
                		</ul>
                	</li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>