<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	//날짜 정렬


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
	function monthList() {
		var id = $('#id').val();
		var name = $('#name').val();
		var month = $('#month').val();
		var textLength = $('#month').val().length;
		if (textLength == 0) {
			alert("날짜를 입력해주십시오.");
		} else {
			$
			.ajax({
				url : '${pageContext.request.contextPath}/pages/J_M_attendanceStatus',
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
	function J_M_attendanceStatus2() {
		var month = $("#month2").val();
		window.location="J_M_attendanceStatus2?month="+month;
	};
	function search() {
		$("#search").show();
		$("#allsearch").hide();
	}
	function allsearch() {
		$("#allsearch").show();
		$("#search").hide();
	}

</script>
<section>
	<article>
		<div class="content_header">
			<h2>월 근태 현황</h2>
		</div>
		<div class="content">
			<form action="J_M_attendanceStatus" method="post" name="searchform">
				<div>
					<span><input type="button" onclick="search()" value="사원조회" style="background: #d3292c; border: solid 1px #d3292c;"></span>
					<span><input type="button" onclick="allsearch()" value="전체조회" style="background: #d3292c; border: solid 1px #d3292c;"></span>
				</div>
				<div class="search-wrap mt10" style="height: 38px;">
					<div class="form-group">
						<c:if test="${sys_rank == 1 }">
							<!-- 관리자인경우 -->
							<div id="search">
								<span class="bold5px">사업장 : </span>
								<c:forEach var="dto" items="${dtoss}">
									<span id="search_title" class="bold5px">${dto.c_name}</span>
								</c:forEach>
								<span class="ml50 bold5px">아이디</span> 
								<span><input type="text" class="searchId" id="id" name="id" value="${id}"></span>
								<span><a href="#" onclick="searchId()" class="fa fa-search fa-fw"></a></span>
								<span class="bold5px ml50">이름 : </span>
								<span><input type="text" class="searchName" name="name" readonly placeholder="아이디를 조회하세요." style="background: #f3f3f3;"></span>
								<span class="ml50 bold5px">*급여년월</span>
								<span><input type="month" id="month" value="${month}" name="month"></span>
								<span><input type="submit" value="조회" style="background: #d3292c;"></span>
							</div>
	
							<!-- 전체 조회 -->
							<div id="allsearch" style="display: none;">
								<span class="bold5px">*년도별검색 : </span>
								<span><input type="month" id="month2" placeholder="예)2019" maxlength="4"></span>
								<span><input type="button" onclick="J_M_attendanceStatus2()" value="조회" style="background: #d3292c;"></span>
							</div>
						</c:if>
					<c:if test="${sys_rank != 1 }">
						<!-- 관리자가 아닐경우 -->
						<span class="bold5px">사업장</span>
						<c:forEach var="dto" items="${dtoss}">
							<span class="bold5px">${dto.c_name}</span>
						</c:forEach>
						<span class="bold5px ml50">아이디</span>
						<span><input type="text" class="searchId" id="id" value="${id}" name="id" readonly></span>
						<span class="bold5px ml50">이름 : </span>
						<span><input type="text" class="searchName" name="name" value="${name}" readonly placeholder="아이디를 조회하세요."></span>
						<span class="bold5px ml50">*급여년월</span>
						<span><input type="month" id="month" value="${month}" name="month"></span>
						<span><input type="submit" value="조회" style="background: #d3292c;"></span>
					</c:if>
					<c:if test="${month == null}">
						<script>
							document.getElementById('month').value = new Date().toISOString().slice(0, 7);
							document.getElementById('month2').value = new Date().toISOString().slice(0, 7);
						</script>
					</c:if>
					</div>
				</div>
				<div>
					<font color="darkGray">■</font> : 출근
					<font color="red">■</font> : 지각
					<font color="yellow">■</font> : 조퇴
					<font color="green">■</font> : 휴가
					<font color="blue">■</font> : 반차
				</div>
				<div id="result">
					<div class="table_top">
						<table>
							<thead>
								<tr>
									<th>날짜</th>
									<th>사원번호</th>
									<th>성명</th>
									<th>부서</th>
									<th>직급</th>
									<th>출근시간</th>
									<th>퇴근시간</th>
									<th>근무시간</th>
									<th>상태</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="salary_info" style="height: 631px;">
						<table>
							<tbody>
								<c:if test="${cnt > 0}">
								<c:forEach var="dtos" items="${dtos}">
									<tr>
										<td>${dtos.day}</td>
										<td>${dtos.id}</td>
										<td>${dtos.name}</td>
										<td>${dtos.j_name}</td>
										<td>${dtos.rank_name}</td>
										<td>${dtos.gos}</td>
										<td>${dtos.offs}</td>
										<td>${dtos.worktimes}</td>
										<td><font color="darkGray">■</font> 
											<c:if
												test="${dtos.departuretimes ne '00:00'}">
												<font color="yellow">■</font>
											</c:if> 
											<c:if test="${dtos.departuretimes ne '00:00'}">
												<font color="red">■</font>
											</c:if> 
											<c:if test="${dtos.result == 3}">
												<font color="green">■</font>
											</c:if> 
											<c:if test="${dtos.result == 4}">
												<font color="blue">■</font>
											</c:if></td>
										<!--
											dtos.departuretimes : 조퇴
											dtos.perceptiontimes : 지각
										-->
									</tr>
								</c:forEach>
								</c:if>
								<c:if test="${cnt == 0}">
									<tr>
										<td colspan="9" style="height: 580px;">데이터 정보가 없습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</form>
		</div>
	</article>
</section>