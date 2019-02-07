<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/aside.css">
<link rel="stylesheet" href="${path}css/content.css">
<link rel="stylesheet" href="${path}css/D_style.css" />

<aside>
	<!-- 사용 안하는 사이드바
    <div class="sidebar"></div>
     -->
    <div class="nav">
        <div class="nav_title">
            <h2>게시판</h2>
            <div class="category">
                <ul>
                    <li>
                        <span><a href="<c:url value='/pages/D_boardsSetting' />">게시판 목록</a></span>
                        <ul>
                        	<c:forEach var="b_dtos" items="${b_dtos}">
                        		<li><a href="<c:url value='/pages/D_boardList?num=${b_dtos.num}'/>">${b_dtos.b_name}</a></li>                        	</c:forEach>
                        </ul>
                    </li>
                    <li>
                        <span><a href="c03.jsp">임시 저장함</a></span>
                    </li>
                    <li>
                        <span>관리자 메뉴</span>
                        <ul>
                            <li><a href="<c:url value='/pages/D_boardsSetting' />">게시판 관리</a></li>
                            <li><a href="c05.jsp">게시물 관리</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>