<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
/* 메인화면 */
$(document).ready(function(){
	$(".approval_bg").hover(function(){
		$(".approval_wrap").css('background', 'rgba(255, 255, 255, 0.9)');
		$(".approval_wrap").css('box-shadow', '1px 1px 50px #bbb');
	}, function(){
		$(".approval_wrap").css('background', 'transparent');
		$(".approval_wrap").css('box-shadow', 'none');
	});
	$(".board_bg").hover(function(){
		$(".board_wrap").css('background', 'rgba(255, 255, 255, 0.9)');
		$(".board_wrap").css('box-shadow', '1px 1px 50px #bbb');
	}, function(){
		$(".board_wrap").css('background', 'transparent');
		$(".board_wrap").css('box-shadow', 'none');
	});
	$(".planner_bg").hover(function(){
		$(".planner_wrap").css('background', 'rgba(255, 255, 255, 0.9)');
		$(".planner_wrap").css('box-shadow', '1px 1px 50px #bbb');
	}, function(){
		$(".planner_wrap").css('background', 'transparent');
		$(".planner_wrap").css('box-shadow', 'none');
	});
	$(".todo_bg").hover(function(){
		$(".todo_wrap").css('background', 'rgba(255, 255, 255, 0.9)');
		$(".todo_wrap").css('box-shadow', '1px 1px 50px #bbb');
	}, function(){
		$(".todo_wrap").css('background', 'transparent');
		$(".todo_wrap").css('box-shadow', 'none');
	});
	$(".message_bg").hover(function(){
		$(".message_wrap").css('background', 'rgba(255, 255, 255, 0.9)');
		$(".message_wrap").css('box-shadow', '1px 1px 50px #bbb');
	}, function(){
		$(".message_wrap").css('background', 'transparent');
		$(".message_wrap").css('box-shadow', 'none');
	});
	$(".organization_bg").hover(function(){
		$(".organization_wrap").css('background', 'rgba(255, 255, 255, 0.9)');
		$(".organization_wrap").css('box-shadow', '1px 1px 50px #bbb');
	}, function(){
		$(".organization_wrap").css('background', 'transparent');
		$(".organization_wrap").css('box-shadow', 'none');
	});
	$(".member_management_bg").hover(function(){
		$(".member_management_wrap").css('background', 'rgba(255, 255, 255, 0.9)');
		$(".member_management_wrap").css('box-shadow', '1px 1px 50px #bbb');
	}, function(){
		$(".member_management_wrap").css('background', 'transparent');
		$(".member_management_wrap").css('box-shadow', 'none');
	});
	$(".work_management_bg").hover(function(){
		$(".work_management_wrap").css('background', 'rgba(255, 255, 255, 0.9)');
		$(".work_management_wrap").css('box-shadow', '1px 1px 50px #bbb');
	}, function(){
		$(".work_management_wrap").css('background', 'transparent');
		$(".work_management_wrap").css('box-shadow', 'none');
	});
	$(".salary_management_bg").hover(function(){
		$(".salary_management_wrap").css('background', 'rgba(255, 255, 255, 0.9)');
		$(".salary_management_wrap").css('box-shadow', '1px 1px 50px #bbb');
	}, function(){
		$(".salary_management_wrap").css('background', 'transparent');
		$(".salary_management_wrap").css('box-shadow', 'none');
	});
});

$(function(){
	printClock()
});

function printClock() {

    var clock = document.getElementById("clock"); // 출력할 장소 선택
    var currentDate = new Date(); // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth() + 1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = 'AM'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(), 2);
    var currentMinute = addZeros(currentDate.getMinutes(), 2);
    var currentSeconds = addZeros(currentDate.getSeconds(), 2);

    if (currentHours >= 12) { // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
        amPm = 'PM';
        currentHours = addZeros(currentHours - 12, 2);
    }

    if (currentSeconds >= 50) { // 50초 이상일 때 색을 변환해 준다.
        currentSeconds = '<span style="color:#de1951;">' + currentSeconds + '</span>'
    }
    clock.innerHTML = currentHours + ":" + currentMinute + ":" + currentSeconds + " <span style='font-size:15px;'>" + amPm + "</span>"; //날짜를 출력해 줌

    setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
    var zero = '';
    num = num.toString();
    if (num.length < digit) {
        for (i = 0; i < digit - num.length; i++) {
            zero += '0';
        }
    }
    return zero + num;
}

$(function(){
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd='0'+dd
	} 

	if(mm<10) {
	    mm='0'+mm
	} 

	today = yyyy+'.'+mm+'.'+dd;
	year = yyyy;
	month = mm;
	day = dd;
	$("#today").text(today);
	$("#year").text(year);
	$("#month").text(month);
	$("#day").text(day);
});
/* 메인화면 끝 */
</script>
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