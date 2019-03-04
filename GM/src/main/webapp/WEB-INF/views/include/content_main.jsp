<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
    <article id="main_aside">
        <div class="notice">
            <div class="notice_wrap">
                <h2 onclick="window.location='<c:url value='/pages/K_noticeBoard' />'" style="cursor: pointer;">
                    NOTICE
                    <i class="fa fa-volume-up"></i>
                </h2>
                <div class="notice_title">
                    <a href="<c:url value='/pages/K_noticeContent?num=${notice.getBoardnum() }' />">${notice.getSubject() }</a>
                </div>
            </div>
            <div class="date_wrap">
                <div class="date">
                    <span id="today"></span>
                    <em id="clock"></em>
                </div>
            </div>
        </div>
        <div class="main_portlet">
            <div id="portlet_main">
                <div class="main_menu">
                    <ul>
                    	<li onclick="window.location='<c:url value="/pages/P_listApprTodoView" />'" class="approval_bg">
                        	<div class="menu_wrap approval_wrap">
	                        	<div>
		                        	<div class="approval"></div>
		                        	<h2>전자결재</h2>
	                        	</div>
                        	</div>
                        </li>
                        <li onclick="window.location='<c:url value="/pages/D_allBoardList" />'" class="board_bg">
                        	<div class="menu_wrap board_wrap">
	                        	<div>
		                        	<div class="board"></div>
		                        	<h2>게시판</h2>
	                        	</div>
                        	</div>
                        </li>
                        <li onclick="window.location='<c:url value="/pages/O_calendar" />'" class="planner_bg">
                        	<div class="menu_wrap planner_wrap">
	                        	<div>
		                        	<div class="planner"></div>
		                        	<h2>일정</h2>
	                        	</div>
                        	</div>
                        </li>
                        <c:if test="${sys_rank == 1 }">
	                        <li onclick="window.location='<c:url value="/pages/W_listTodoView" />'" class="todo_bg">
	                        	<div class="menu_wrap todo_wrap">
	                        		<div>
		                        		<div class="todo"></div>
		                        		<h2>업무관리</h2>
	                        		</div>
	                        	</div>
	                        </li>
                        </c:if>
                        <c:if test="${sys_rank != 1 }">
                        	<li onclick="window.location='<c:url value="/pages/W_listTodoView" />'" class="todo_bg">
                        		<div class="menu_wrap todo_wrap">
                        			<div>
	                        			<div class="todo"></div>
	                        			<h2>업무관리</h2>
                        			</div>
                        		</div>
                        	</li>
						</c:if>
                        <li onclick="window.location='<c:url value="/pages/S_message_inbox" />'" class="message_bg">
                        	<div class="menu_wrap message_wrap">
                        		<div>
	                        		<div class="message"></div>
	                        		<h2>쪽지</h2>
                        		</div>
                        	</div>
                        </li>
                        <li onclick="window.location='<c:url value="/pages/E_orgnaizationMemberList" />'" class="organization_bg">
                        	<div class="menu_wrap organization_wrap">
	                        	<div>
		                        	<div class="organization"></div>
		                        	<h2>조직도</h2>
	                        	</div>
                        	</div>
                        </li>
                        <c:if test="${sys_rank == 1 }">
                        	<li onclick="window.location='<c:url value="/admin/K_resistMemberInfo"/>'" class="member_management_bg">
                                <div class="menu_wrap member_management_wrap">
	                                <div>
		                                <div class="member_management"></div>
		                                <h2>인사</h2>
	                                </div>
                                </div>
                        	</li>
                        </c:if>
                        <li onclick="window.location='<c:url value="/pages/J_D_attendanceRegistration"/>'" class="work_management_bg">
                        	<div class="menu_wrap work_management_wrap">
	                        	<div>
		                        	<div class="work_management"></div>
		                        	<h2>근태관리</h2>
	                        	</div>
                        	</div>
                        </li>
                        <c:if test="${sys_rank == 1 }">
                        	<li onclick="window.location='<c:url value="/admin/J_SalaryDefaultSetting"/>'" class="salary_management_bg">
                                <div class="menu_wrap salary_management_wrap">
	                                <div>
		                                <div class="salary_management"></div>
		                        		<h2>급여관리</h2>
	                                </div>
                                </div>
                        	</li>
                        </c:if>
                        <c:if test="${sys_rank != 1 }">
                        <li onclick="window.location='<c:url value="/pages/J_PayrollInquiry"/>'" class="salary_management_bg">
                        	<div class="menu_wrap salary_management_wrap">
	                        	<div>
		                        	<div class="salary_management"></div>
		                        	<h2>급여관리</h2>
	                        	</div>
                        	</div>
                        </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </article>
</section>