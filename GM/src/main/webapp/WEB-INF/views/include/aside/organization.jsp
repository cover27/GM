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
                        <span><a href="<c:url value='/pages/E_organizationList' />">전체 구성원 목록</a></span>
                    </li>
                    <li>
                        <span>조직도</span>
                        <ul>	<!-- 사내 그룹 리스트 ( 기획부, 사업부, 인사부 각각 클릭시 해당부서 구성원 출력.. ) -->
                        	<li><a href="<c:url value='/pages/E_organVipGroupList?depart=${company }' />">${c_name}</a></li>	
                       			<c:forEach var="dto" items="${side }">
                       				<li><a href="<c:url value='/pages/E_organVipGroupList?depart=${dto.groupId }' />">${dto.g_name}</a></li>
                       			</c:forEach>
                        </ul>
                    </li>
                    <%--
                    <li>
                        <span>개인그룹</span>
                        <ul>
                        	<li><a href="<c:url value='/pages/E_myGroupList?depart=${company }' />">개인 그룹 목록</a></li>
                        </ul>
                    </li>
                    <li>
                        <span><a href="<c:url value='/pages/E_myGroupManage' />">개인그룹 관리</a></span>
                    </li>
                    --%>
                    <li>
                        <span><a href="<c:url value='/pages/E_orgMyFavoritMemList' />">자주 연락하는 사람 관리</a></span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>