<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/aside.css">
<link rel="stylesheet" href="${path}css/content.css">
<%@page import="com.spring.gm.vo.MemberVO" %>

<aside>
	<!-- 사용 안하는 사이드바
    <div class="sidebar"></div>
     -->
    <div class="nav">
        <div class="nav_title">
            <h2><a href="<c:url value='/pages/E_organizationList' />" style="color: white">조직도</a></h2>
            <div class="category">
            
                <ul>
                	<li>	<!-- 로그인된 계정이 소속된 회사에서 그어떤 그룹에도 속하지 않는 모든 구성원 목록 -->
                        <span><a href="<c:url value='/pages/E_orgnaizationMemberList' />">전체 구성원 목록</a></span>
                    </li>
                    <li>
                        <span>조직도</span>
                        <ul>	
                       		<c:forEach var="dto" items="${c_dtos}">
                       			<li><a href="<c:url value='/pages/E_departMemberList?groupId=${dto.groupId}'/>">${dto.g_name}</a></li>
                       		</c:forEach>
                        </ul>
                    </li>
                    <li>
                        <span><a href="<c:url value='/pages/E_orgMyFavoritMemList' />">자주 연락하는 사람 관리</a></span>
                        <ul>
                        	<c:forEach var="dtos" items="${mf_dtos}">
                        		<li><a href="<c:url value=''/>">${dtos.id}</a></li>
                        	</c:forEach>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>