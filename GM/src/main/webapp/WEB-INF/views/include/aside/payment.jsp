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
            <h2>전자결재</h2>
            <div class="category">
                <ul>
                    <li>
                        <span>기안</span>
                        <ul>
                            <li><a href="O_createApprDocFormView">기안문 작성</a></li>
                            <li><a href="b02.jsp">결제 요청함<span>2</span></a></li>
                            <li><a href="b03.jsp">임시 저장함</a></li>
                        </ul>
                    </li>
                    <li>
                        <span>결재</span>
                        <ul>
                            <li><a href="b04.jsp">결제 대기함</a></li>
                            <li><a href="b05.jsp">결제 진행함</a></li>
                            <li><a href="b06.jsp">완료 문서함</a></li>
                            <li><a href="b07.jsp">반려 문서함</a></li>
                            <li><a href="b08.jsp">참조/열람 문서함</a></li>
                        </ul>
                    </li>
                    <li>
                        <span>관리자 메뉴</span>
                        <ul>
                            <li><a href="b09.jsp">결제문서 관리</a></li>
                            <li><a href="b10.jsp">양식 관리</a></li>
                            <li><a href="b11.jsp">발신 공문 설정</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>