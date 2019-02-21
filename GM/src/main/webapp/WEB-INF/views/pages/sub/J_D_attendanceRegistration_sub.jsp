<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script>
	//출근처리
	function go() {
		var con_test = confirm("출근 처리 하시겠습니까?.");
		if (con_test == true) {
			$
			// alert(id);
			$.ajax({
				url : '${pageContext.request.contextPath}/pages/goInsert', //컨트롤러/basic1_sub로 가라
				type : 'POST',
				data : {}, //전송할 데이터
				success : function(result) { //콜백함수 - 정상적으로 처리되었을 때의 결과가 result에 들어간다.
					//변수명이 반드시 .html(result)일 필요는 없으나 위 콜백함수의 변수명result와 일치해야 한다.
					$('#result').html(result);
				},
				error : function() {
					alert('오류');
				}
			});
		} else if (con_test == false) {
			return false;
		}
	};
	//퇴근처리
	function off(num, gos) {
		var con_test = confirm("퇴근 처리 하시겠습니까?.");
		if (con_test == true) {
			$
			// alert(id);
			$.ajax({
				url : '${pageContext.request.contextPath}/pages/offUpdate', //컨트롤러/basic1_sub로 가라
				type : 'POST',
				data : {
					'num' : num,
					'gos' : gos
				}, //전송할 데이터
				success : function(result) { //콜백함수 - 정상적으로 처리되었을 때의 결과가 result에 들어간다.
					//변수명이 반드시 .html(result)일 필요는 없으나 위 콜백함수의 변수명result와 일치해야 한다.
					$('#result').html(result);
				},
				error : function() {
					alert('오류');
				}
			});
		} else if (con_test == false) {
			return false;
		}
	};

	//한번더 클릭시
	function error() {
		alert("확인후 다시 시도해 주십시오.");
	};
	
	//날짜 검색
	function searchList() {
			// alert(id);
			var date = $('#date').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/pages/searchList', //컨트롤러/basic1_sub로 가라
				type : 'POST',
				data : {
					'date' : date
				}, //전송할 데이터
				success : function(result) { //콜백함수 - 정상적으로 처리되었을 때의 결과가 result에 들어간다.
					//변수명이 반드시 .html(result)일 필요는 없으나 위 콜백함수의 변수명result와 일치해야 한다.
					$('#result').html(result);
				},
				error : function() {
					alert('오류');
				}
			});
	};
	
	
</script>
<section>
	<article>
		<div class="content_header">
			<h2>일일 근태등록</h2>
		</div>
		<div>
			*근무일자<input type="date" id="date"><input type="button" value="검색" onclick="searchList()">
		</div>
		<br> <br> 
		<div>*근무시간,휴일,연장,야간,지각,조퇴시간이 계산되지 않는 경우 담당에게 문의하세요.</div>
		<div id="result">
			<c:if test="${cnt == 0}">
				<input type="button" value="출근" onclick="go()">
				<input type="button" value="퇴근" onclick="error()">
			</c:if>
			<c:if test="${cnt > 0}">
				<input type="button" value="출근" onclick="error()">
				<input type="button" value="퇴근" onclick="off('${num}','${gos}')">
			</c:if>
			<table border="1">
				<tr>
					<td>사원 번호</td>
					<td>성명</td>
					<td>출근시간</td>
					<td>퇴근시간</td>
					<td>근무시간</td>
					<td>연장근로</td>
					<td>야간근로</td>
					<td>지각시간</td>
					<td>조퇴시간</td>
				</tr>
				<c:if test="${cnt == 0}">
					<tr>
						<td>${id}</td>
						<td>${name}</td>
						<td>00:00</td>
						<td>00:00</td>
						<td>00:00</td>
						<td>00:00</td>
						<td>00:00</td>
						<td>00:00</td>
						<td>00:00</td>
					</tr>
				</c:if>
				<c:if test="${cnt > 0}">
					<c:forEach var="dtos" items="${dtos}">
						<td>${id}</td>
						<td>${name}</td>
						<td>${dtos.gos}</td>
						<td>${dtos.offs}</td>
						<td>${dtos.worktimes}</td>
						<td>${dtos.overtimes}</td>
						<td>${dtos.nighttimes}</td>
						<c:if test="${dtos.perceptiontimes ne '00:00'}"><td style="background-color: red;">${dtos.perceptiontimes}</td></c:if>
						<td style="background-color: yellow;">${dtos.departuretimes}</td>
					</c:forEach>
				</c:if>

			</table>
		</div>
	</article>
</section>