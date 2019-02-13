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
                            <li id="O_createApprDocFormView"><a href="<c:url value='/pages/O_createApprDocFormView' />">기안문 작성</a></li>
                            <li id="O_listApprMyRequestView"><a href="<c:url value='/pages/O_listApprMyRequestView' />">결재 요청함<span>2</span></a></li>
                            <li id="O_listApprTempView"><a href="<c:url value='/pages/O_listApprTempView' />">임시 저장함</a></li>
                        </ul>
                    </li>
                    <li>
                        <span>결재</span>
                        <ul>
                            <li id="O_listApprTodoView"><a href="<c:url value='/pages/O_listApprTodoView' />">결재 대기함</a></li>
                            <li id="O_listApprCompleteView"><a href="<c:url value='/pages/O_listApprCompleteView' />">결재 진행함</a></li>
                            <li id="O_readApprAllListView"><a href="<c:url value='/pages/O_readApprAllListView' />">완료 문서함</a></li>
                            <li id="O_listApprRejectView"><a href="<c:url value='/pages/O_listApprRejectView' />">반려 문서함</a></li>
                            <li id="O_listApprReferenceView"><a href="<c:url value='/pages/O_listApprReferenceView' />">참조/열람 문서함</a></li>
                        </ul>
                    </li>
                    <li>
                        <span>관리자 메뉴</span>
                        <ul>
                            <li id="O_listApprDocAllAdminView"><a href="<c:url value='/pages/O_listApprDocAllAdminView' />">결재문서 관리</a></li>
                            <!-- <li><a href="b10.jsp">양식 관리</a></li>
                            <li><a href="b11.jsp">발신 공문 설정</a></li> -->
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>