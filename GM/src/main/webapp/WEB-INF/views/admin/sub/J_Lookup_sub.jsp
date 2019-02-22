<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	//휴가 목록 뽑아오기
	function holiday() {
		var month = $("#month").val();
		$.ajax({
			url : '${pageContext.request.contextPath}/admin/holiday',
			type : 'POST',
			data : {
				'month' : month
			}, //전송할 데이터
			success : function(result) {
				$('#result').html(result);
			},
			error : function() {
				alert('오류');
			}
		});
	};
	//연장근무 목록 뽑아오기
	function overtime() {
		var month = $("#month").val();
		$.ajax({
			url : '${pageContext.request.contextPath}/admin/overtime',
			type : 'POST',
			data : {
				'month' : month
			}, //전송할 데이터
			success : function(result) {
				$('#result').html(result);
			},
			error : function() {
				alert('오류');
			}
		});
	};
	//야간 목록 뽑아오기
	function nighttime() {
		var month = $("#month").val();
		$.ajax({
			url : '${pageContext.request.contextPath}/admin/nighttime',
			type : 'POST',
			data : {
				'month' : month
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
			<h2>휴일/연장/야간근무 조희</h2>
		</div>
		<div>
			*검색 날짜를 선택한 후 -> 휴일,연장,야간 버튼을 클릭하십시오.
			
		</div>
		<div>
			<span class="bold5px">사업장 :</span>
			<c:forEach var="dto" items="${dtoss}">
				<span name="search_title" id="search_title" class="bold5px">${dto.c_name}</span>
			</c:forEach>
			*근무년월<input type="month" id="month" value="${month}">
		</div>
		<script>
			document.getElementById('month').value = new Date().toISOString().slice(0, 7);
		</script>
		<br>
		<br>
		<br>

		<div>
			<span>휴일/연장/야간 근무조회</span>
			<input type="button" value="휴일" onclick="holiday()">
			<input type="button" value="연장" onclick="overtime()">
			<input type="button" value="야간" onclick="nighttime()">
		</div>
		<div id="result">
			<table border="1">
				<tr>
					<td>등록번호</td>
					<td>사원번호</td>
					<td>성명</td>
					<td>직급</td>
					<td>부서</td>
					<td>근태종류</td>
					<td>근태시간</td>
					<td>근태일자</td>
				</tr>
				<tr>
					<td colspan="8" style="height: 250px;">정보가 없습니다.</td>
				</tr>
			</table>
		</div>
	</article>
</section>