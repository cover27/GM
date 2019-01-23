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
                	<li>
                        <span><a href="O_createSelfTaskView">업무 등록</a></span>
                    </li>
                    <li>
                        <span>To - Do</span>
                        <ul>
                            <li><a href="O_listMyTodoView">나의 할 일</a></li>
                        </ul>
                    </li>
                    <li>
                        <span>업무 요청</span>
                        <ul>
                            <li><a href="O_listPureOrderView">내가 한 업무 요청</a></li>
                            <li><a href="O_listTodoView">수신 업무 요청</a></li>
                            <li><a href="e05.jsp">참조 업무 요청</a></li>
                        </ul>
                    </li>
                    <li>
                        <span>업무 보고</span>
                        <ul>
                            <li><a href="e06.jsp">내가 한 업무 보고</a></li>
                            <li><a href="e07.jsp">수신 업무 보고</a></li>
                            <li><a href="e08.jsp">참조 업무 보고</a></li>
                        </ul>
                    </li>
                    <li>
                        <span>임시 저장함</span>
                    </li>
                    <li>
                    	<span>업무 보관함</span>
                    </li>
                    <li>
                    	<span><a href="e09.jsp">업무 보관함 관리</a></span>
                    </li>
                    <li>
                    	<span>관리자 메뉴</span>
                    	<ul>
                    		<li>
                    			<a href="e10.jsp">업무 문서 관리</a>
                    		</li>
                    	</ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>