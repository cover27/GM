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
            <h2>메모</h2>
            <div class="category">
                <ul>
                	<li>
                		<span><a href="<c:url value='/pages/E_memoWriteForm' />">메모 등록</a></span>
                	</li>
                	<li>
                        <span><a href="<c:url value='/pages/E_memoList' />">모든 메모&nbsp;&nbsp;<span>1</span></a></span>
                    </li>
                    <li>
                        <span><a href="i03.jsp">중요 메모&nbsp;&nbsp;<span>1</span></a></span>
                    </li>
                    <li>
                        <span>나의 폴더</span>
                        <ul>
                        	<c:forEach var="dto" items="${side }">
                       				<li><a href="<c:url value='/pages/E_memoList?id=${dto.id }' />">${dto.name}</a></li>
                       		</c:forEach>
                        </ul>
                    </li>
                    <li>
                        <span><a href="i05.jsp">휴지통</a></span>
                    </li>
                    <li>
                        <span><a href="i06.jsp">폴더 관리</a></span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>