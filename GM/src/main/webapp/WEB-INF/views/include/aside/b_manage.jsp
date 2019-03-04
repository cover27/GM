<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/aside.css">
<link rel="stylesheet" href="${path}css/content.css">
<link rel="stylesheet" href="${path}css/P_style.css">

<aside>
	<!-- 사용 안하는 사이드바
    <div class="sidebar"></div>
     -->
    <div class="nav">
        <div class="nav_title">
            <h2>업무관리</h2>
            <div class="category">
                <ul>
                	<li>
                        <span id="W_createSelfTaskView">
                        	<a href="<c:url value='/pages/W_createSelfTaskView' />">
                        		<span>업무 등록</span>
                        		<i class="fas fa-check ml10"></i>
                        	</a>
                        </span>
                    </li>
                    <li>
                        <span>To - Do</span>
                        <ul>
                            <li id="W_listMyTodoView"><a href="<c:url value='/pages/W_listMyTodoView' />">나의 할 일</a></li>
                        </ul>
                    </li>
                    <li>
                        <span>업무 요청</span>
                        <ul>
                            <li id="W_listPureOrderView"><a href="<c:url value='/pages/W_listPureOrderView' />">내가 한 업무 요청</a></li>
                            <li id="W_listTodoView"><a href="<c:url value='/pages/W_listTodoView' />">수신 업무 요청</a></li>
                            <li id="W_listTodoReportView"><a href="<c:url value='/pages/W_listTodoReportView' />">업무 완료함</a></li>
                        </ul>
                    </li>
                    <c:if test="${sys_rank == 1}">
	                    <li>
	                    	<span>관리자 메뉴</span>
	                    	<ul>
	                    		<li id="W_listAdminDocManagement">
	                    			<a href="<c:url value='/admin/W_listAdminDocManagement' />">업무 문서 관리</a>
	                    		</li>
	                    	</ul>
	                    </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
    
</aside>