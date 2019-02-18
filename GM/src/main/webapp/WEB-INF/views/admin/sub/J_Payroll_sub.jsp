<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	function searchId() {
		var id = $('.searchId').val();
		var url = "J_searchId_sub?id=" + id;
		window.open(url, "J_searchId", "menubar=no, width=700, height=560");
	}

	function back(id, name) {
		opener.document.searchform.id.value = id;
		opener.document.searchform.name.value = name;
		self.close();
	}

	//검색 결과값으로 정보 가져오기
	function searchPayroll() {
		var id = $('#id').val();
		var name = $('#name').val();
		var month = $('#month').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/searchPayroll',
				type : 'POST',
				data : {
					'id' : id,
					'name' : name,
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
	function searchPayroll2(year) {
		var id = $('#id').val();
		var name = $('#name').val();
		var month = $('#month').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/searchPayroll2',
				type : 'POST',
				data : {
					'id' : id,
					'name' : name,
					'month' : month,
					'year' : year
				}, //전송할 데이터
				success : function(result) {
					$('#result').html(result);
				},
				error : function() {
					alert('오류');
				}
			});
	};
	function searchPayroll3(year) {
		var id = $('#id').val();
		var name = $('#name').val();
		var month = $('#month').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/searchPayroll3',
				type : 'POST',
				data : {
					'id' : id,
					'name' : name,
					'month' : month,
					'year' : year
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
			<h2>급여 대장</h2>
		</div>
		<form method="post" name="searchform">
			<table border="1">
				<tr>
					<th width="10%">사업장</th>
					<c:forEach var="dto" items="${dtoss}">
						<td width="10%">${dto.c_name}</td>
					</c:forEach>
					<th width="10%">*급여년월</th>
					<td width="5%">아이디</td>
					<td width="25%"><input type="text" class="searchId" id="id">
						<button onclick="searchId()">검색</button> <input type="text"
						class="searchName" name="name"></td>
					<td>
					<input type="button" onclick="searchPayroll()" value="검색">
					<input type="button" onclick="yearPayroll()" value="이번년도검색">
					</td>
				</tr>
			</table>
			<br>
			<br>
			<div id="result">
			<table border="1">
				<tr>
					<td>사원 번호</td>
					<td>사원 이름</td>
					<td>부서</td>
					<td>회사명</td>
					<td>연차</td>
					<td>기본급</td>
					<td>추가 및 삭감금</td>
					<td>실제 수령금액</td>
					<td>지급날짜</td>
				</tr>
				<tr>
					<td colspan="9">데이터 정보가 없습니다.</td>
				</tr>
				<tr>
					<td colspan="6"></td>
					<td>0</td>
					<td>0</td>
					<td></td>
				</tr>
			</table>
			</div>
		</form>
	</article>
</section>