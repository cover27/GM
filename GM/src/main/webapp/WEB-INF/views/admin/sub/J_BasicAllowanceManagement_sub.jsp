<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
// dataType이 text인 경우
$(function(){
	//백그라운드에서 실행
	$('#J_extrapayinfo').click(function(){
		var id = $('#J_extrapayinfo').text();//입력한 키워드
		alert("id" + id);
		$.ajax({
			url : '${pageContext.request.contextPath}/admin/J_extrapayinfo', //컨트롤러/basic1_sub로 가라
			type :	'POST',
			data: "id=" + id,	//전송할 데이터
			dataType: "text",
			success : function(result){	//콜백함수 - 정상적으로 처리되었을 때의 결과가 result에 들어간다.
				//변수명이 반드시 .html(result)일 필요는 없으나 위 콜백함수의 변수명result와 일치해야 한다.
				$('#result').html(result);	
			},
		error: function(){
			alert('오류');
		}
	});	
});
});
</script>

<section>
	<article>
		<div>
			<h2>기본수당 외 수당 관리</h2>
		</div>
		<div>
			<form action="J_SalaryDefaultSetting" method="post" name="searchform">
				<table border="1">
					<caption>검색타입</caption>
					<tr>
						<th>사업장</th>
						<td><select>
								<option>홈사랑넷</option>
						</select></td>
						<th>검색년월</th>
						<td><input type="text" name="searchDate"> <input
							type="button" value="검색"></td>
					</tr>
				</table>
			</form>
		</div>
		<div>
			<div style="width: 500px; float: left;">
				<h3>
					기본정보<em>0</em>
				</h3>
				<div style="width: 300px;">
					<table border="1">
						<tr>
							<td>사원번호</td>
							<td>성명</td>
							<td>부서</td>
						</tr>
						<c:if test="${cnt > 0}">
							<c:forEach var="dto" items="${dtos}">
								<tr>
									<td id="J_extrapayinfo" style="cursor: pointer;">${dto.id}</td>
									<td i>${dto.name}</td>
									<td>${dto.j_name}</td>
								</tr>
							</c:forEach>
						</c:if>
						<!-- 게시글이 없으면 -->
						<c:if test="${cnt == 0}">
							<tr>
								<td colspan="7" align="center">게시글이 없습니다. 글을 작성해주세여.</td>
							</tr>
						</c:if>
					</table>
					<div>
						<table>
							<!-- 페이지 컨트롤 -->
							<tr>
								<th colspan="7" align="center">
									<!-- 게시글이 있으면 --> <c:if test="${cnt >0}">
										<!-- 처음[◀◀] / 이전블록[◀]-->
										<c:if test="${startPage > pageBlock}">
											<a href="J_SalaryDefaultSetting">[PageDown x2]</a>
											<a
												href="J_SalaryDefaultSetting?pageNum=${startPage - pageBlock}">[PageDown]</a>
										</c:if>


										<!-- 블록내의 페이지 번호 -->
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i == currentPage}">
												<span><b> [${i}] </b></span>
											</c:if>
											<c:if test="${i != currentPage}">
												<a href="J_SalaryDefaultSetting?pageNum=${i}">[${i}]</a>
											</c:if>
										</c:forEach>
										<!-- 다음 블록[▶] /마지막[▶▶] -->
										<c:if test="${pageCount > endPage}">
											<a
												href="J_SalaryDefaultSetting?pageNum=${startPage + pageBlock}">[▶]</a>
											<a href="J_SalaryDefaultSetting?pageNum=${pageCount}">[▶▶]</a>
										</c:if>
									</c:if>
								</th>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div id="result" style="width: 1000px; float: right;">
				<h3>기본수당외 수당등록</h3>
				<table border="1">
					<tr>
						<td><input type="checkbox"></td>
						<td>아이디</td>
						<td>이름</td>
						<td>상여금/삭감</td>
						<td>지급/공제</td>
						<td>금액</td>
						<td>비고</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>0</td>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
					</tr>
				</table>
			</div>
		</div>
	</article>
</section>