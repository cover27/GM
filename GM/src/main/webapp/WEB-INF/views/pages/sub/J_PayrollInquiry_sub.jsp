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
	function searchPayrollInquiry() {
		var id = $('#id').val();
		var name = $('#name').val();
		var month = $('#month').val();
		var textLength = $('#month').val().length;
		if (textLength == 0) {
			alert("날짜를 입력해주십시오.");
		} else {
			$
			.ajax({
				url : '${pageContext.request.contextPath}/pages/searchPayrollInquiry',
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
		<div class="content">
			<form method="post" name="searchform">
				<div class="search-wrap">
					<div class="form-group">
						<c:if test="${sys_rank == 1 }"> <!-- 관리자인경우 -->
							<span class="bold5px">사업장 : </span>
							<c:forEach var="dto" items="${dtoss}">
								<span id="search_title" class="bold5px">${dto.c_name}</span>
							</c:forEach>
							<span class="ml50 bold5px">아이디</span>
							<span><input type="text" class="searchId" id="id"></span>
							<span><a href="#" onclick="searchId()" class="find_btn"><i class="fa fa-search fa-fw"></i></a></span>
							<span class="bold5px ml50">이름 : </span>
							<span><input type="text" class="searchName" name="name" readonly placeholder="아이디를 조회하세요." style="background: #f3f3f3;"></span>
							<span class="ml50 bold5px">*급여년월</span>
							<span><input type="month" id="month"></span>
							<span><input type="button" onclick="searchPayrollInquiry()" value="조회" style="background:#d3292c;"></span>
						</c:if>
						<c:if test="${sys_rank != 1 }"> <!-- 관리자가 아닐경우 -->
							<span class="bold5px">사업장</span>
							<c:forEach var="dto" items="${dtoss}">
								<span class="bold5px">${dto.c_name}</span>
							</c:forEach>
							<span class="bold5px ml50">아이디</span>
							<span><input type="text" class="searchId" id="id" value="${id}" readonly></span>
							<span class="bold5px ml50">이름 : </span>
							<span><input type="text" class="searchName" name="name" value="${name}" readonly placeholder="아이디를 조회하세요."></span>
							<span class="bold5px ml50">*급여년월</span>
							<span><input type="month" id="month"></span>
							<span><input type="button" onclick="searchPayrollInquiry()" value="조회" style="background:#d3292c;"></span>
						</c:if>	
						<script>document.getElementById('month').value= new Date().toISOString().slice(0, 7);</script>
					</div>
				</div>
				<div class="subtitle">
					<h3>급여 목록</h3>
				</div>
				<div id="result" class="salary_info_result">
					<table>
							<tr>
								<th style="border-bottom: 1px #c0c0c0 solid;">지급기준일</th>
								<th style="border-bottom: 1px #c0c0c0 solid;">사원번호</th>
								<th style="border-bottom: 1px #c0c0c0 solid;">성명</th>
								<th style="border-bottom: 1px #c0c0c0 solid;">부서</th>
								<th style="border-bottom: 1px #c0c0c0 solid;">기본급</th>
								<th style="border-bottom: 1px #c0c0c0 solid;">추가 및 삭감</th>
								<th style="border-bottom: 1px #c0c0c0 solid;">지급총액</th>
							</tr>
							<tr>
								<td colspan="7">
								*데이터 정보가 없습니다.</td>
							</tr>
							<tr>
								<td colspan="6" style="border-bottom: 1px #c0c0c0 solid;">합계</td>
								<td style="border-bottom: 1px #c0c0c0 solid;">0</td>
							</tr>
					</table>
				</div>
			</form>
		</div>
	</article>
</section>