<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">


	// 페이지 로딩될 때 이번 년도 출력하는 함수
	$(function() {
		var year = new Date().toISOString().slice(0, 4);
		$("#year").text(year);
	});
	// 페이지 로딩될 때 이번 년도 출력하는 함수 끝
	

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
	// 년도별 검색
	function yearPayroll() {
		var month = $('#month').val();
		var textLength = $('#month').val().length;
		if (textLength == 0) {
			alert("날짜를 입력해주십시오.");
		}else if(textLength > 0 && textLength < 4){
			alert("날짜를 다시 입력새주십시오.");
		}else {
			$
					.ajax({
						url : '${pageContext.request.contextPath}/admin/yearPayroll',
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
		}
	};
</script>
<section>
	<article>
		<div class="content_header">
			<h2>급여 대장</h2>
		</div>
		<div class="content">
			<form method="post" name="searchform">
				<div class="search-wrap">
					<div class="form-group">
						<span class="bold5px">사업장 : </span>
						<c:forEach var="dto" items="${dtoss}">
							<span class="bold5px">${dto.c_name}</span>
						</c:forEach>
						<span class="ml50 bold5px">아이디</span>
						<span><input type="text" class="searchId" id="id"></span>
						<span><a href="#" onclick="searchId()" class="find_btn"><i class="fa fa-search fa-fw"></i></a></span>
						<span><input type="text" class="searchName" name="name"></span>
						<span><input type="button" onclick="searchPayroll()" value="조회" style="background:#d3292c;"></span>
						<span class="fright">
							<span class="bold5px">*년도별검색 : </span>
							<span><input type="text" id="month" placeholder="예)2019" maxlength="4"></span>
							<span><input type="button" onclick="yearPayroll()" value="조회" style="background:#d3292c;"></span>
						</span>
					</div>
				</div>
				<div id="result" class="salary_info_result" style="border:0;">
					<h3 class="mt20 mb10"><span id="year"></span>년도</h3>
					<table style="border-top: 2px #c0c0c0 solid;">
						<tr>
							<th style="border-bottom: 1px #c0c0c0 solid;">사원 번호</th>
							<th style="border-bottom: 1px #c0c0c0 solid;">사원 이름</th>
							<th style="border-bottom: 1px #c0c0c0 solid;">부서</th>
							<th style="border-bottom: 1px #c0c0c0 solid;">회사명</th>
							<th style="border-bottom: 1px #c0c0c0 solid;">연차</th>
							<th style="border-bottom: 1px #c0c0c0 solid;">지급날짜</th>
							<th style="border-bottom: 1px #c0c0c0 solid;">기본급</th>
							<th style="border-bottom: 1px #c0c0c0 solid;">추가 및 삭감금</th>
							<th style="border-bottom: 1px #c0c0c0 solid;">실제 수령금액</th>
						</tr>
						<tr>
							<td colspan="9">데이터 정보가 없습니다.</td>
						</tr>
						<tr>
							<td style="border-bottom: 1px #c0c0c0 solid;" colspan="6"></td>
							<td style="border-bottom: 1px #c0c0c0 solid;">0</td>
							<td style="border-bottom: 1px #c0c0c0 solid;">0</td>
							<td style="border-bottom: 1px #c0c0c0 solid;">0</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</article>
</section>