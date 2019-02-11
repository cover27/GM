<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/views/setting.jsp"%> --%>
<script type="text/javascript">

    function add_item(){
        // pre_set 에 있는 내용을 읽어와서 처리..
        var div = document.createElement('div');
        div.innerHTML = document.getElementById('pre_set').innerHTML;
        document.getElementById('field').appendChild(div);
    }
 
    function remove_item(obj){
        // obj.parentNode 를 이용하여 삭제
        document.getElementById('field').removeChild(obj.parentNode);
    }

</script>
<section>
	<article>
		<div class="content_header">
			<h2>근태/급여 기준정보 설정</h2>
		</div>
		<br>
		<div id="pre_set" style="display:none">
		   	 입사연차 : <input type="text" name="year" > 년 이상
		   	 연차허용일수 : <input type="text" name="day" > <input type="button" value="삭제" onclick="remove_item(this)">
		</div>
		<form action="<c:url value='/admin/registpersonal'/>" method="post">
			여름휴가 : <input type="text" name="holiday" value="${holiday }"> 일
			<hr>
			<div id="field">
				<c:forEach var="dto" items="${dayoffList }">
					<div id="pre_set">
					    입사연차 : <input type="text" name="year" value="${dto.year }"> 년 이상
					    연차허용일수 : <input type="text" name="day" value="${dto.day }"> <input type="button" value="삭제" onclick="remove_item(this)">
					</div>
				</c:forEach>
			</div>
		 	
			<input type="button" value=" 추가 " onclick="add_item()"><br>
			<hr>
			근무시각 <input type="time" name="go" value="${attended.gos }"><input type="time" name="off" value="${attended.offs }"><br>
			휴게시각 <input type="time" name="rest_start" value="${attended.rest_starts }"><input type="time" name="rest_end" value="${attended.rest_ends }"><br>
			연장근로시각 <input type="time" name="over_start" value="${attended.over_starts }"><input type="time" name="over_end" value="${attended.over_ends }"><br>
			야간근무시각 <input type="time" name="night_start" value="${attended.night_starts }"><input type="time" name="night_end" value="${attended.night_ends }"><br>
			연장근무시간당 수당<input type="text" name="over_sal" value="${attended.over_sal }"><br>
			야간근무시간당 수당<input type="text" name="night_sal" value="${attended.night_sal }"><br>
			
			<input type="submit" value="저장">
		</form>
		
	</article>
</section>