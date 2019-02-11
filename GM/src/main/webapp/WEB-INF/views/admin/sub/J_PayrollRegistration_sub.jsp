<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function load(id,rank,j_name) {
		alert(id);
		$.ajax({
			url : '${pageContext.request.contextPath}/admin/J_PayrollRegistrationList', //컨트롤러/basic1_sub로 가라
			type : 'POST',
			data : {
				'id' : id,
				'rank' : rank,
				'j_name' : j_name
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
	
	function load2(id) {
		alert(id);
		var id = $('#id').val();;
		var day = $('#day').val();
		var state = $('#state').val();
		var salary = $('#salary').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/admin/J_PayrollRegistrationInsert', //컨트롤러/basic1_sub로 가라
			type : 'POST',
			data : {
				'id' : id,
				'day' : day,
				'state' : state,
				'salary' : salary
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
			<h2>급여등록</h2>
		</div>
		<div class="search-wrap">
			<div class="form-group">
				<form action="J_PayrollRegistration" method="post" name="searchform">
					<span>사업장 :</span>
					<c:forEach var="dto" items="${dtoss}">
						<span name="search_title" id="search_title">${dto.c_name}</span>
					</c:forEach>
					<span> <select name="search_title">
							<!-- 성명,사원번호,부서: 일반사용자 disabled 자신의 사원번호 -->
							<option value="allList">전체보기</option>
							<option value="name">성명</option>
							<option value="depart">부서</option>
							<option value="id">사원아이디</option>
					</select>
					</span> <span> <input type="text" name="search_content"
						placeholder="검색 내용">
					</span> <span> <input type="submit" value="검색">
					</span>
				</form>
			</div>
		</div>
		<h3>기본정보</h3>
		<div class="salary_info">
			<table>
				<colgroup>
					<col width="5%" />
					<col width="5%" />
					<col width="5%" />
					<col width="5%" />
					<col width="5%" />
					<col width="5%" />
					<col width="50%" />
				</colgroup>
				<thead>
					<tr>
						<th>사원번호</th>
						<th>성명</th>
						<th>직급</th>
						<th>부서</th>
						<th>입사일자</th>
						<th>휴대폰</th>
						<th>E-MAIL</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${cnt > 0}">
						<c:forEach var="dto" items="${dtos}">
							<tr>
								<td onclick="load('${dto.id}','${dto.rank}','${dto.j_name}')"
									style="cursor: pointer;">${dto.id}</td>
								<td>${dto.name}</td>
								<td>${dto.rank}</td>
								<td>${dto.j_name}</td>
								<td>${dto.enterday}</td>
								<td>${dto.tel}</td>
								<td>${dto.email_in}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
				<!-- 게시글이 없으면 -->
				<c:if test="${cnt == 0}">
					<tr>
						<td colspan="7">게시글이 없습니다. 글을 작성해주세여.</td>
					</tr>
				</c:if>
			</table>
		</div>
		<div class="paging">
			<c:if test="${cnt > 0}">
				<c:if test="${startPage > pageBlock}">
					<a href="J_PayrollRegistration">[◀◀]</a>
					<a href="J_PayrollRegistration?pageNum=${startPage - pageBlock}">[◀]</a>
				</c:if>

				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span><b>[${i}]</b></span>
					</c:if>

					<c:if test="${i != currentPage}">
						<a href="J_PayrollRegistration?pageNum=${i}">[${i}]</a>
					</c:if>
				</c:forEach>

				<c:if test="${pageCount > endPage}">
					<a href="J_PayrollRegistration?pageNum=${startPage + pageBlock}">[▶]</a>
					<a href="J_PayrollRegistration?pageNum=${pageCount}">[▶▶]</a>
				</c:if>
			</c:if>
		</div>
		<div id="result" style="width: 1200px;">
			<h3>이번달 급여 목록</h3>
		</div>
	</article>
</section>