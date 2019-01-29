<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/aside.css">
<link rel="stylesheet" href="${path}css/content.css">
<link rel="stylesheet" href="${path}css/S_css/mail.css" />

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
                        <span>메일작성</span>
                        <ul class="send_mail">
                            <li><a href="a01.jsp">메일 쓰기</a></li>
                            <li><a href="a02.jsp">내게 쓰기</a></li>
                        </ul>
                    </li>
                    <li>
                        <span><a href="a03.jsp">전체 메일</a></span>
                        <ul>
                            <li><a href="<c:url value='S_mail_inbox' />">받은 메일함<span>2</span></a></li>
                            <li><a href="a05.jsp">내게 쓴 메일함</a></li>
                            <li><a href="a06.jsp">보낸 메일함</a></li>
                            <li><a href="a07.jsp">임시 보관함</a></li>
                            <li><a href="a08.jsp">스팸 메일함</a></li>
                            <li><a href="a09.jsp">휴지통</a></li>
                        </ul>
                    </li> 
                </ul>
            </div>
        </div>
    </div>
    
</aside>