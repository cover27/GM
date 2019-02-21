<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
function modify(num) {
		$.ajax({
			url : '${pageContext.request.contextPath}/admin/modify',
			type : 'POST',
			data : {
				'num' : num
			}, //전송할 데이터
			success : function(result) {
				$('#result').html(result);
			},
			error : function() {
				alert('오류');
			}
		});
};
	function modifyUpdate(num) {
		var go = $("#go").val();
		var off = $("#off").val();
		var work = $("#work").val();
		var over = $("#over").val();
		var night = $("#night").val();
		var per = $("#per").val();
		var depar = $("#depar").val();
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/modifyUpdate',
				type : 'POST',
				data : {
					'num' : num,
					'go' : go,
					'off' : off,
					'work' : work,
					'over' : over,
					'night' : night,
					'per' : per,
					'depar' : depar
				}, //전송할 데이터
				success : function(result) {
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
			<h2>사원 근태 관리</h2>
		</div>
		<div>
			*근무일자<input type="date" id="date"><input type="button"value="검색">
		</div>
		<script>document.getElementById('date').value= new Date().toISOString().slice(0, 10);</script>
		<br> <br> 
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
					<td style="background-color: red;">${dtos.perceptiontimes}</td>
					<td style="background-color: yellow;">${dtos.departuretimes}</td>
					<td><input type="button" value="변경" onclick="modify('${dtos.num}')"></td>
				</tr>
				</c:forEach>
			</c:if>
		</table>
		</div>
	</article>
</section>