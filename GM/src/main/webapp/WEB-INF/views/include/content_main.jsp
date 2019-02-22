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
                        <li>
                            <a href="<c:url value='/pages/S_mail_inbox' />">
                                <h2>메일</h2>
                                <span class="mail"></span>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/pages/P_listApprTodoView' />">
                                <h2>전자결제</h2>
                                <span class="approval"></span>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/pages/D_allBoardList' />">
                                <h2>게시판</h2>
                                <span class="board"></span>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/pages/O_calendar' />">
                                <h2>일정</h2>
                                <span class="planner"></span>
                            </a>
                        </li>
                        <li>
                        	<c:if test="${sys_rank == 1 }">
                            <a href="<c:url value='/pages/O_listTodoView' />">
                                <h2>업무관리</h2>
                                <span class="todo"></span>
                            </a>
                            </c:if>
                        	<c:if test="${sys_rank != 1 }">
                            <a href="<c:url value='/pages/O_listTodoView' />">
                                <h2>업무관리</h2>
                                <span class="todo"></span>
                            </a>
                            </c:if>
                        </li>
                        <li>
                            <a href="<c:url value='/pages/S_message_inbox' />">
                                <h2>쪽지</h2>
                                <span class="message"></span>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/pages/E_addressList' />">
                                <h2>주소록</h2>
                                <span class="contact"></span>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/pages/E_organizationList' />">
                                <h2>조직도</h2>
                                <span class="organization"></span>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/pages/E_memoList' />">
                                <h2>메모</h2>
                                <span class="note"></span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <h2>온라인투표</h2>
                                <span class="poll"></span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <h2>메신저</h2>
                                <span class="messenger"></span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <h2>웹디스크</h2>
                                <span class="webdisk"></span>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/admin/K_member_manage'/>">
                                <h2>인사</h2>
                                <span class="member_management"></span>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/pages/J_D_attendanceRegistration'/>">
                                <h2>근태관리</h2>
                                <span class="work_management"></span>
                            </a>
                        </li>
                        <li>
                        	<script>console.log("가즈아~!::::${sys_rank}")</script>
                        	<c:if test="${sys_rank == 1 }">
                        	<script>console.log("${sys_rank}")</script>
                        	<a href="<c:url value='/admin/J_SalaryDefaultSetting'/>">
                                <h2>급여관리</h2>
                                <span class="salary_management"></span>
                            </a>
                        	</c:if>
                        	
                        	<c:if test="${sys_rank != 1 }">
                        	<script>console.log("${sys_rank}")</script>
                        	<a href="<c:url value='/pages/J_PayrollInquiry'/>">
                                <h2>급여관리</h2>
                                <span class="salary_management"></span>
                            </a>
                        	</c:if>
                        </li>
                        <!-- 사용안함
                        <li>
                            <a href="#">
                                <h2>CEO 리포트</h2>
                                <span class="ceo_report"></span>
                            </a>
                        </li>
                         -->
                    </ul>
                </div>
            </div>
            <!-- 우측 사이드바
            <div class="portlet_right">
                <div class="private"></div>
            </div>
            -->
        </div>
    </article>
</section>