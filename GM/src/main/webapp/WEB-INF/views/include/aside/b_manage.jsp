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
            <h2>업무관리</h2>
            <div class="category">
                <ul>
                	<c:if test="${sys_rank != 1}">
                	<li>
                        <span><a href="<c:url value='/pages/O_createSelfTaskView' />">업무 등록</a></span>
                    </li>
                    <li>
                        <span>To - Do</span>
                        <ul>
                            <li><a href="<c:url value='/pages/O_listMyTodoView' />">나의 할 일</a></li>
                        </ul>
                    </li>
                    <li>
                        <span>업무 요청</span>
                        <ul>
                            <li><a href="<c:url value='/pages/O_listPureOrderView' />">내가 한 업무 요청</a></li>
                            <li><a href="<c:url value='/pages/O_listTodoView' />">수신 업무 요청</a></li>
                            <li><a href="<c:url value='/pages/O_listTodoReportView' />">업무 완료함</a></li>
                        </ul>
                    </li>
                    </c:if>
            		<c:if test="${sys_rank == 1}">
            		<li>
                        <span><a href="<c:url value='/pages/O_createSelfTaskView' />">업무 등록</a></span>
                    </li>
                    <li>
                        <span>To - Do</span>
                        <ul>
                            <li><a href="<c:url value='/pages/O_listMyTodoView' />">나의 할 일</a></li>
                        </ul>
                    </li>
                    <li>
                        <span>업무 요청</span>
                        <ul>
                            <li><a href="<c:url value='/pages/O_listPureOrderView' />">내가 한 업무 요청</a></li>
                            <li><a href="<c:url value='/pages/O_listTodoView' />">수신 업무 요청</a></li>
                            <li><a href="<c:url value='/pages/O_listTodoReportView' />">업무 완료함</a></li>
                        </ul>
                    </li>
                    <li>
                    	<span>관리자 메뉴</span>
                    	<ul>
                    		<li>
                    			<a href="<c:url value='/admin/O_listAdminDocManagement' />">업무 문서 관리</a>
                    		</li>
                    	</ul>
                    </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
    
</aside>