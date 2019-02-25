<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	function modify(num) {
		var date = $("#date").val();
		$.ajax({
			url : '${pageContext.request.contextPath}/admin/modify',
			type : 'POST',
			data : {
				'num' : num,
				'date' : date
			}, //전송할 데이터
			success : function(result) {
				$('#result').html(result);
			},
			error : function() {
				alert('오류');
			}
		});
	};
	
	function allList() {
		var date = $("#date").val();
		window.location="J_A_management?date=" + date; 
	};
	//휴가승인된 목록 보기	
	function vacationList() {
		var date = $('#date').val();
		var url = "vacationList?date=" + date;
		window.open(url, "vacationList", "menubar=no, width=1000, height=560");
	}
	
	

</script>
<section>
	<article>
		<form action="modifyUpdate" method="post">
		<div class="content_header">
			<h2>사원 근태 관리</h2>
		</div>
		<div>
			*근무일자<input type="date" id="date" name="date" value="${date}"><input type="button" value="검색" onclick="allList()">
		</div>
		<c:if test="${date == null}">
		<script>
			document.getElementById('date').value = new Date().toISOString().slice(0, 10);
		</script>
		</c:if>
		<br>
		<br>
		<input type="button" value="휴가승인목록" onclick="vacationList()">
		<div id="result">
			<table border="1">
				<tr>
					<td>등록번호</td>
					<td>사원 번호</td>
					<td>성명</td>
					<td>출근시간</td>
					<td>퇴근시간</td>
					<td>근무시간</td>
					<td>연장근로</td>
					<td>야간근로</td>
					<td>지각시간</td>
					<td>조퇴시간</td>
					<td>기능</td>
				</tr>
				<c:if test="${cnt == 0}">
					<tr>
						<td width="100%">데이터 정보가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${cnt > 0}">
					<c:forEach var="dtos" items="${dtos}">
						<tr>
							<td>${dtos.num}</td>
							<td>${dtos.id}</td>
							<td>${dtos.name}</td>
							<td>${dtos.gos}</td>
							<td>${dtos.offs}</td>
							<td>${dtos.worktimes}</td>
							<td>${dtos.overtimes}</td>
							<td>${dtos.nighttimes}</td>
							<c:if test="${dtos.perceptiontimes ne '00:00'}"><td style="background-color: red;">${dtos.perceptiontimes}</td></c:if>
							<c:if test="${dtos.perceptiontimes eq '00:00'}"><td>${dtos.perceptiontimes}</td></c:if>
							<c:if test="${dtos.departuretimes ne '00:00'}"><td style="background-color: yellow;">${dtos.departuretimes}</td></c:if>
							<c:if test="${dtos.departuretimes eq '00:00'}"><td>${dtos.departuretimes}</td></c:if>
							<td><input type="button" value="변경" onclick="modify('${dtos.num}')"></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
		</form>
	</article>
</section>