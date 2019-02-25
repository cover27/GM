<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section>
    <article id="main_aside">
        <div class="notice">
            <div class="notice_wrap">
                <h2>
                    NOTICE
                    <i class="fa fa-volume-up"></i>
                </h2>
                <div class="notice_title">
                    
                </div>
            </div>
            <div class="date_wrap">
                <div class="date">
                    <span>2019.01.17</span>
                    <em>AM 10:52:13</em>
                </div>
            </div>
        </div>
        <div class="main_portlet">
            <div id="portlet_main">
                <div class="main_menu">
                    <ul>
                        <%-- <li>
                            <a href="<c:url value='/pages/S_mail_inbox' />">
                                <h2>메일</h2>
                                <span class="mail"></span>
                            </a>
                        </li> --%>
                        <li onclick="window.location='<c:url value="/pages/P_listApprTodoView" />'">
                        	<h2>전자결제</h2>
                        	<span class="approval"></span>
                        </li>
                        <li onclick="window.location='<c:url value="/pages/D_allBoardList" />'">
                        	<h2>게시판</h2>
                        	<span class="board"></span>
                        </li>
                        <li onclick="window.location='<c:url value="/pages/O_calendar" />'">
                        	<h2>일정</h2>
                        	<span class="planner"></span>
                        </li>
                        <c:if test="${sys_rank == 1 }">
	                        <li onclick="window.location='<c:url value="/pages/O_listTodoView" />'">
	                        	<h2>업무관리</h2>
	                        	<span class="todo"></span>
	                        </li>
                        </c:if>
                        <c:if test="${sys_rank != 1 }">
                        	<li onclick="window.location='<c:url value="/pages/O_listTodoView" />'">
                        		<h2>업무관리</h2>
                        		<span class="todo"></span>
                        	</li>
						</c:if>
                        <li onclick="window.location='<c:url value="/pages/S_message_inbox" />'">
                        	<h2>쪽지</h2>
                        	<span class="message"></span>
                        </li>
                        <li onclick="window.location='<c:url value="/pages/E_organizationList" />'">
                        	<h2>조직도</h2>
                        	<span class="organization"></span>
                        </li>
                        <li onclick="window.location='<c:url value="/admin/K_member_manage"/>'">
                                <h2>인사</h2>
                                <span class="member_management"></span>
                        </li>
                        <li onclick="window.location='<c:url value="/pages/J_D_attendanceRegistration"/>'">
                        	<h2>근태관리</h2>
                        	<span class="work_management"></span>
                        </li>
                        <c:if test="${sys_rank == 1 }">
                        	<li onclick="window.location='<c:url value="/admin/J_SalaryDefaultSetting"/>'">
                        		<h2>급여관리</h2>
                                <span class="salary_management"></span>
                        	</li>
                        </c:if>
                        <c:if test="${sys_rank != 1 }">
                        <li onclick="window.location='<c:url value="/admin/J_SalaryDefaultSetting"/>'">
                        	<h2>급여관리</h2>
                        	<span class="salary_management"></span>
                        </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </article>
</section>