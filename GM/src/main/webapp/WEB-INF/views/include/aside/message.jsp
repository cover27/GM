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
                	<li class="aside_submit">
                        <span id="S_sendMessageForm">
                        	<a href="<c:url value='/pages/S_sendMessageForm'/>">
                        		<span>쪽지 쓰기</span>
                        		<i class="fas fa-check ml10"></i>
                        	</a>
                        </span>
                    </li>
                    <li>
                        <span><a>쪽지함</a></span>
                        <ul>
                            <li id="S_message_inbox"><a href="<c:url value='/pages/S_message_inbox'/>">받은 쪽지함<span>${messageCnt}</span></a></li>
                            <li id="S_sendMessageList"><a href="<c:url value='/pages/S_sendMessageList'/>">보낸 쪽지함</a></li>
                            <li id="S_garbageList"><a href="<c:url value='/pages/S_garbageList'/>">휴지통</a></li>
                        </ul>
                    </li> 
                </ul>
            </div>
        </div>
    </div>
    
</aside>