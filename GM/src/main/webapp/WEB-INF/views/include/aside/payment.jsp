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
                            <li><a href="<c:url value='O_createApprDocFormView' />">기안문 작성</a></li>
                            <li><a href="<c:url value='O_listApprMyRequestView' />">결재 요청함<span>2</span></a></li>
                            <li><a href="<c:url value='O_listApprTempView' />">임시 저장함</a></li>
                        </ul>
                    </li>
                    <li>
                        <span>결재</span>
                        <ul>
                            <li><a href="<c:url value='O_listApprTodoView' />">결재 대기함</a></li>
                            <li><a href="<c:url value='O_listApprCompleteView' />">결재 진행함</a></li>
                            <li><a href="<c:url value='O_readApprAllListView' />">완료 문서함</a></li>
                            <li><a href="<c:url value='O_listApprRejectView' />">반려 문서함</a></li>
                            <li><a href="<c:url value='O_listApprReferenceView' />">참조/열람 문서함</a></li>
                        </ul>
                    </li>
                    <li>
                        <span>관리자 메뉴</span>
                        <ul>
                            <li><a href="<c:url value='O_listApprDocAllAdminView' />">결재문서 관리</a></li>
                            <!-- <li><a href="b10.jsp">양식 관리</a></li>
                            <li><a href="b11.jsp">발신 공문 설정</a></li> -->
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>