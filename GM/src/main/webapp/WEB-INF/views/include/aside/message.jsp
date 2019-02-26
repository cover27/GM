<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/aside.css">
<link rel="stylesheet" href="${path}css/content.css">
<link rel="stylesheet" href="${path}css/S_style.css" />

<aside>
	<!-- 사용 안하는 사이드바
    <div class="sidebar"></div>
     -->
    <div class="nav">
        <div class="nav_title">
            <h2>메일</h2>
            <div class="category">
                <ul>
                    <li>
                        <span>쪽지 작성</span>
                        <ul class="send_message">
                            <li><a href="<c:url value='/pages/S_sendMessageForm'/>">쪽지 쓰기</a></li>
                        </ul>
                    </li>
                    <li>
                        <span><a href="a04.jsp">전체 쪽지</a></span>
                        <ul>
                            <li><a href="<c:url value='/pages/S_receiveMessage'/>">받은 쪽지함<span>2</span></a></li>
                            <li><a href="<c:url value='/pages/S_sendMessageList'/>">보낸 쪽지함</a></li>
                            <li><a href="<c:url value='/pages/S_garbageList'/>">휴지통</a></li>
                        </ul>
                    </li> 
                    
                    <li>
                    	<span><a href="a04.jsp">나의 쪽지함</a></span>
                    	<ul>
                    		
                    	</ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>