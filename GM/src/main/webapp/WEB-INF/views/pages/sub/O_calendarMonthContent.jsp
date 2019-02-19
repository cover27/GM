<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value='/resources/js/fullcalendar/fullcalendar.min.css' />">
<link rel="stylesheet" media="print" href="<c:url value='/resources/js/fullcalendar/fullcalendar.print.min.css' />">
<script type="text/javascript" src="<c:url value='/resources/js/fullcalendar/lib/moment.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/fullcalendar/fullcalendar.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/fullcalendar/ko.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/fullcalendar/gcal.js' />"></script>
<script>

  $(document).ready(function() {

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
      events: [
        {
          title: '한글적용',
          start: '2019-02-01',
        },
        {
          title: 'Long Event',
          start: '2019-02-07',
          end: '2019-02-10'
        },
        {
//           id: 999,
          title: 'Repeating Event',
          start: '2019-02-09T16:00:00'
        }
      ],
      googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE",      // Google API KEY
      eventSources : [
          // 대한민국의 공휴일
          {
                googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
              , className : "koHolidays"
              , color : "#FF0000"
              , textColor : "#FFFFFF"
          }
	  ]
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