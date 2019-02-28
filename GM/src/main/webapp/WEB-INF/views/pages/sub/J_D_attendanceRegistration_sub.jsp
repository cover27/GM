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
		<div class="content">
			<div class="search-wrap">
				<div class="form-group">
					<span class="bold5px">근무일자</span>
					<span>
						<input type="date" id="date" >
					</span>
					<span>
						<input type="button" value="검색" onclick="searchList()" style="background: #d3292c;">
					</span>
					<span class="fright" style="font-size: 12px;position: relative; top: 4px;">
						※ 근무시간,휴일,연장,야간,지각,조퇴시간이 계산되지 않는 경우 담당에게 문의하세요.
					</span>
				</div>
			</div>
			<script>
				document.getElementById('date').value = new Date().toISOString().slice(0, 10);
			</script>
			<h3>일일근태현황</h3>
			<div id="result" class="mt20">
				<c:if test="${cnt == 0}">
					<input type="button" value="출근" onclick="go()">
					<input type="button" value="퇴근" onclick="error()">
				</c:if>
				<c:if test="${cnt == 1}">
					<input type="button" value="출근" onclick="error()">
					<input type="button" value="퇴근" onclick="off('${num}','${gos}')">
				</c:if>
				<div class="table_top">
					<table>
						<colgroup>
							<col width="177px" />
							<col width="178px" />
							<col width="175px" />
							<col width="175px" />
							<col width="175px" />
							<col width="175px" />
							<col width="175px" />
							<col width="175px" />
							<col width="*" />
						</colgroup>
						<thead>
							<tr>
								<th>사원 번호</th>
								<th>성명</th>
								<th>출근시간</th>
								<th>퇴근시간</th>
								<th>근무시간</th>
								<th>연장근로</th>
								<th>야간근로</th>
								<th>지각시간</th>
								<th>조퇴시간</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="salary_info">
					<table>
						<colgroup>
							<col width="177px" />
							<col width="178px" />
							<col width="175px" />
							<col width="175px" />
							<col width="175px" />
							<col width="175px" />
							<col width="175px" />
							<col width="175px" />
							<col width="*" />
						</colgroup>
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
						<c:if test="${cnt == 1}">
							<c:forEach var="dtos" items="${dtos}">
								<td>${id}</td>
								<td>${name}</td>
								<td>${dtos.gos}</td>
								<td>${dtos.offs}</td>
								<td>${dtos.worktimes}</td>
								<td>${dtos.overtimes}</td>
								<td>${dtos.nighttimes}</td>
								<c:if test="${dtos.perceptiontimes ne '00:00'}">
									<td style="color: #d3292c;font-weight: bold;">${dtos.perceptiontimes}</td>
								</c:if>
								<td style="color: #d3292c;font-weight: bold;">${dtos.departuretimes}</td>
							</c:forEach>
						</c:if>
						<c:if test="${cnt > 1}">
								<td colspan="7">출근관리 문제가 생겼습니다. 관리자에게 문의 하십시오.</td>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</article>
</section>