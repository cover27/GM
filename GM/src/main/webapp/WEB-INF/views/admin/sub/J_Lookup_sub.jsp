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
		<div class="content">
			<div class="search-wrap">
				<div class="form-group">
					<span class="bold5px">사업장 :</span>
					<c:forEach var="dto" items="${dtoss}">
						<span name="search_title" id="search_title" class="bold5px">${dto.c_name}</span>
					</c:forEach>
					<span class="ml50">*근무년월</span>
					<span><input type="month" id="month" value="${month}"></span>
					<span style="font-size: 12px;">※ 검색 날짜를 선택한 후 -> 휴일,연장,야간 버튼을 클릭하십시오.</span>
					<span class="ml50"><input type="button" value="휴일" onclick="holiday()"></span>
					<span><input type="button" value="연장" onclick="overtime()"></span>
					<span><input type="button" value="야간" onclick="nighttime()"></span>
				</div>
			</div>
			<script>
				document.getElementById('month').value = new Date().toISOString().slice(0, 7);
			</script>
			
			<div id="result">
				<div class="table_top">
					<table>
						<colgroup>
							<col width="198px" />
							<col width="198px" />
							<col width="198px" />
							<col width="197px" />
							<col width="197px" />
							<col width="*" />
						</colgroup>
						<thead>
							<tr>
								<th>등록번호</th>
								<th>사원번호</th>
								<th>성명</th>
								<th>직급</th>
								<th>부서</th>
								<th>근태종류</th>
								<th>근태시간</th>
								<th>근태일자</th>
								<th>지급상태</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="salary_info" style="height:700px;">
					<table>
						<colgroup>
							<col width="198px" />
							<col width="198px" />
							<col width="198px" />
							<col width="197px" />
							<col width="197px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<td colspan="8" style="height: 250px;">정보가 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</article>
</section>