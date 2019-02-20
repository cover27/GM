<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value='/resources/js/fullcalendar/fullcalendar.min.css' />">
<link rel="stylesheet" media="print" href="<c:url value='/resources/js/fullcalendar/fullcalendar.print.min.css' />">
<script type="text/javascript" src="<c:url value='/resources/js/fullcalendar/lib/moment.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/fullcalendar/fullcalendar.min.js' />"></script>
<!-- ko.js는 영문을 한글로 바꿔주는 스크립트 -->
<script type="text/javascript" src="<c:url value='/resources/js/fullcalendar/ko.js' />"></script>
<!-- gcal.js는 google 캘린더의 데이터를 사용하여 공휴일을 받아오도록 설정하는 스크립트 -->
<script type="text/javascript" src="<c:url value='/resources/js/fullcalendar/gcal.js' />"></script>
<script>
	
  $(document).ready(function() {
	  //아래의 events:에 dataset 변수 값을 넘겨준다
	   var dataset =[
		<c:forEach var="dto" items="${dtos}">
			{
				"id":'<c:out value="${dto.getId()}" />',
				"title":'<c:out value="${dto.getSubject()}" />',
				"start":'<c:out value="${dto.getBegin()}" />',
				"end":'<c:out value="${dto.getEnd()}" />',
				"num":'<c:out value="${dto.getNum()}" />'
			},
		</c:forEach>
		]; 

    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listMonth'
      },
      defaultDate: new Date(),
      navLinks: true, // can click day/week names to navigate views
      editable: false, //일정을 표시한 바를 마우스로 이동할 수 있게 하는 기능
      eventLimit: true, // allow "more" link when too many events
      views:{
    	  agenda:{
    		  eventLimit:6
    	  }
      },
      events:dataset,
      googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE",      // Google API KEY
      eventSources : [
          // 대한민국의 공휴일
          {
                googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
              , className : "koHolidays"
              , color : "#FF0000"
              , textColor : "#FFFFFF"
          }
	  ],
	  dayClick:function(date, jsEvent, view){	// 해당 날짜 클릭 시
		  alert('Clicked on:' + date.format());	// 클릭한 날짜를 띄어주며
		  $(this).css('background-color', '#ddfbff'); //해당 배경 색깔 바뀜
	  },
	  eventClick:function(calEvent, jsEvent, view){
		  alert('Event: ' + calEvent.title);
		  $(this).css('border-color', 'red');
		  var url='O_calendarDetail?num='+calEvent.num;
		  window.open(url, 'O_calendarDetail', 'width=600, height=500');
		  return false;
	  },
	  
    });

  });
  
</script>
<style>
 #calendar {
   max-width: 85%;
   margin: 0 auto;
 }
</style>
<section>
	<article>
		<div class="content_header">
			<h2>일정</h2>
		</div>
		
		<div class="content_body" style="margin-top:10px;">
		<!-- id=calendar로 API를 호출 -->
			<div id="calendar"></div>
		</div>
	</article>
</section>