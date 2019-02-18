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
	function searchBonusInquiry() {
		var id = $('#id').val();
		var name = $('#name').val();
		var month = $('#month').val();
		var textLength = $('#month').val().length;
		if (textLength == 0) {
			alert("날짜를 입력해주십시오.");
		} else {
			$
					.ajax({
						url : '${pageContext.request.contextPath}/pages/searchBonusInquiry',
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
		}
	};
</script>
<section>
	<article>
		<div class="content_header">
			<h2>급여 조회</h2>
		</div>
		<div>
			<form method="post" name="searchform">
				<table border="1" style="width: 1800px;">
					<c:if test="${sys_rank == 1 }">
						<!-- 관리자인경우 -->
						<tr>
							<th width="10%">사업장</th>
							<c:forEach var="dto" items="${dtoss}">
								<td width="10%">${dto.c_name}</td>
							</c:forEach>
							<th width="10%">*급여년월</th>
							<td width="20%"><input type="month" id="month"></td>
							<td width="5%">아이디</td>
							<td width="25%"><input type="text" class="searchId" id="id">
								<button onclick="searchId()">검색</button> <input type="text"
								class="searchName" name="name"></td>
							<td><input type="button" onclick="searchBonusInquiry()"
								value="검색"></td>
						</tr>
					</c:if>
					<c:if test="${sys_rank != 1 }">
						<!-- 관리자가 아닐경우 -->
						<tr>
							<th width="10%">사업장</th>
							<c:forEach var="dto" items="${dtoss}">
								<td width="10%">${dto.c_name}</td>
							</c:forEach>
							<th width="10%">*급여년월</th>
							<td width="20%"><input type="month" id="month"></td>
							<td width="5%">아이디</td>
							<td width="25%"><input type="text" class="searchId" id="id"
								value="${id}" readonly> <input type="text"
								class="searchName" name="name" value="${name}" readonly>
							</td>
							<td><input type="button" onclick="searchBonusInquiry()"
								value="검색"></td>
						</tr>
					</c:if>
				</table>
				<div id="result">
					<table border="1">
						<tr>
							<td style="text-align: center; background-color: #cccccc;">등록기준일</td>
							<td style="text-align: center; background-color: #cccccc;">사원번호</td>
							<td style="text-align: center; background-color: #cccccc;">성명</td>
							<td style="text-align: center; background-color: #cccccc;">부서</td>
							<td style="text-align: center; background-color: #cccccc;">추가
								및 삭감구분</td>
							<td style="text-align: center; background-color: #cccccc;">사유</td>
							<td style="text-align: center; background-color: #cccccc;">지급액</td>
						</tr>
						<tr>
							<td colspan="7" style="height: 150px;" text-align="center">
								*데이터 정보가 없습니다.!!!!!!!</td>
						</tr>
						<tr>
							<td colspan="6">합계</td>
							<td style="text-align: center; background-color: #cccccc;">0</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</article>
</section>