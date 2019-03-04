/**
 * 
 */
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