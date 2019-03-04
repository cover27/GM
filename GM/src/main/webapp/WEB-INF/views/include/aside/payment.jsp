<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/aside.css">
<link rel="stylesheet" href="${path}css/content.css">
<link rel="stylesheet" href="${path}css/P_style.css">
<%@ page import="com.spring.gm.vo.MemberVO" %>
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
                    	<span id="P_createApprDocFormView">
                    		<a href="<c:url value='/pages/P_createApprDocFormView' />">
                    			<span>기안문 작성</span>
                    			<i class="fas fa-check ml10"></i>
                    		</a>
                    	</span>
                    </li>
                    <li>
                        <span>결재</span>
                        <ul>
                        	<li id="P_listApprMyRequestView"><a href="<c:url value='/pages/P_listApprMyRequestView' />">결재 요청함</a></li>
                            <li id="P_listApprTodoView"><a href="<c:url value='/pages/P_listApprTodoView' />">결재 대기함</a></li>
                            <li id="P_listApprCompleteView"><a href="<c:url value='/pages/P_listApprCompleteView' />">결재 진행함</a></li>
                            <li id="P_readApprAllListView"><a href="<c:url value='/pages/P_readApprAllListView' />">완료 문서함</a></li>
                            <li id="P_listApprRejectView"><a href="<c:url value='/pages/P_listApprRejectView' />">반려 문서함</a></li>
                            <li id="P_listApprReferenceView"><a href="<c:url value='/pages/P_listApprReferenceView' />">참조/열람 문서함</a></li>
                        </ul>
                    </li>
                    <%
						if(((MemberVO)request.getSession().getAttribute("loginInfo")).getSys_rank() == 1){
					%>
	                    <li>
	                        <span>관리자메뉴</span>
	                        <ul>
	                            <li id="P_managePayment"><a href="<c:url value='/admin/P_managePayment' />">결재문서관리</a></li>
	                        </ul>
	                    </li>
                    <%
						}
                    %>
                </ul>
            </div>
        </div>
    </div>
    
</aside>