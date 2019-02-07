<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/views/setting.jsp"%> --%>
<script type="text/javascript">
	function sendRequest(callback, url, method, params) {
		
		// 비동기 통신을 관리하는 XMLHttpRequest 생성
		httpRequest = getXMLHttpRequest();
		
		// onreadystatechange : 오브젝트 상태가 변한 시점에 불러오는 이벤트핸들러.. 즉 대기상태가 바뀌면 실행할 이벤트
		// callback 함수 : 서버로부터 응답이 오면 동작할 콜백함수(시스템이 자동호출)
		httpRequest.onreadystatechange = callback;
		
		var httpMethod = method ? method : "GET";
		if(httpMethod != "GET" && httpMethod != "POST") {
			httpMethod = "GET";
		}
	
		// params
		var httpParams = (params == null || params == "") ? null : params;
		
		// url
		var httpUrl = (httpMethod == "GET") ? (url + "?" + httpParams) : url;
		
		// 요청 전송 - HTTP 통신을 시작한다.
		// open(방식, 응답페이지, 비동기)
		httpRequest.open(httpMethod , httpUrl, true);
		httpRequest.setRequestHeader("content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		httpRequest.send(httpMethod == "POST" ? httpParams : null);
	}
	
	function load(url) {
		//요청 : url 즉 news1.jsp, news2.jsp, news3.jsp
		//sendRequest(callback, url, method, params){}
		sendRequest(loadNews_callback, url, "post"); //url로 이동 -> 콜백함수로 리턴
	}
	/*
	 콜백함수
	 -서버로부터 응답이 오면 동작할 함수(시스템이 자동으로 호출한다.)
	 -콜백함수명은 sendRequest(콜백함수명)과 일치해야 한다.
	 -loadNews_callback : 콜백함수, result = 출력위치
	 */
	function loadNews_callback() {
		var result = document.getElementById("result");
		if (httpRequest.readyState == 4) { // 4 : completed : 전체 데이터가 취득 완료된 상태
			if (httpRequest.status == 200) { // 200 : 정상종료
				//result.innerHTML = "정상종료";
				result.innerHTML = httpRequest.responseText;
			} else {
				result.innerHTML = "에러발생";
			}
		} else {
			result.innerHTML = "상태 :" + httpRequest.readyStatus;
		}
	}
</script>
<section>
	<article>
		<div class="content_header">
			<h2>인사정보등록</h2>
		</div>
		<br>
		<div class="search-wrap">
			<div class="form-group">
				<form action="<c:url value='/admin/K_resistMemberInfo'/>" method="post"
					name="searchform">
					<table>
						<caption>검색타입</caption>
						<tr>
							<th>*검색 타이틀</th>
							<td colspan="2"><select name="search_title">
									<!-- 성명,사원번호,부서: 일반사용자 disabled 자신의 사원번호 -->
									<option value="allList">전체보기</option>
									<option value="name">성명</option>
									<option value="depart">부서</option>
									<option value="id">사원아이디</option>
							</select> <input type="text" name="search_content" placeholder="검색 내용">
							</td>
							<td><input type="submit" value="검색"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<h3 class="fleft">
			기본정보<em>7</em>
		</h3>
		<div id="leftGrid"
			style="height: 310px; width: 1197.2px; cursor: default;"
			class=" gridbox gridbox_dhx_skyblue isModern">
			<div class="xhdr"
				style="width: 100%; height: 32px; overflow: hidden; position: relative;">
				<div class="dhxgrid_sort_desc"
					style="display: none; position: absolute;"></div>
				<table cellpadding="0" cellspacing="0" class="hdr"
					style="width: 1197px; table-layout: fixed; margin-right: 20px; padding-right: 20px;">
					<tr style="height: auto;">
						<th style="height: 0px; width: 119px;"></th>
						<th style="height: 0px; width: 120px;"></th>
						<th style="height: 0px; width: 119px;"></th>
						<th style="height: 0px; width: 144px;"></th>
						<th style="height: 0px; width: 132px;"></th>
						<th style="height: 0px; width: 155px;"></th>
						<th style="height: 0px; width: 407px;"></th>
						<th style="height: 0px; width: 1px;"></th>
					</tr>
				</table>
			</div>
			<div style="overflow-y: scroll; height: 200px;">
				<table cellpadding="0" cellspacing="0" class="obj row20px"
					style="width: 1197px; table-layout: fixed;">
					<tr>
						<td style="text-align: center; cursor: default;">
							<div class="hdrcell" id="leftGrid_0">사원번호</div>
						</td>
						<td style="text-align: center; cursor: default;">
							<div class="hdrcell" id="leftGrid_1">성명</div>
						</td>
						<td style="text-align: center; cursor: default;">
							<div class="hdrcell" id="leftGrid_2">직급</div>
						</td>
						<td style="text-align: center; cursor: default;">
							<div class="hdrcell" id="leftGrid_3">부서</div>
						</td>
						<td style="text-align: center; cursor: default;">
							<div class="hdrcell" id="leftGrid_4">입사일자</div>
						</td>
						<td style="text-align: center; cursor: default;">
							<div class="hdrcell" id="leftGrid_5">핸드폰</div>
						</td>
						<td style="text-align: center; cursor: default;">
							<div class="hdrcell" id="leftGrid_6">E-MAIL</div>
						</td>
					</tr>
					<c:if test="${cnt > 0}">
						<c:forEach var="dto" items="${dtos}">
							<tr>
								<td onclick="load('/admin/K_getMemberInfo?id=${dto.id}')"style="cursor: pointer;">${dto.id}</td>
								<td>${dto.name}</td>
								<td>${dto.rank}</td>
								<td>${dto.j_name}</td>
								<td>${dto.enterday}</td>
								<td>${dto.tel}</td>
								<td>${dto.email_in}</td>
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
			</div>
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


		<div class="subtitle">
			<h3>상세정보(급여기본)</h3>
		</div>
		<div id="result">
			<table cellpadding="0" cellspacing="0" class="obj row20px"
				style="width: 1197px; table-layout: fixed;" text-align="center">
				<tr>
					<td
						style="text-align: center; cursor: default; background-color: #cccccc;">사원번호</td>
					<td></td>
					<td
						style="text-align: center; cursor: default; background-color: #cccccc;">부서</td>
					<td></td>
					<td
						style="text-align: center; cursor: default; background-color: #cccccc;">직급</td>
					<td></td>
					<td
						style="text-align: center; cursor: default; background-color: #cccccc;">성명</td>
					<td></td>
				</tr>


				<tr>
					<td
						style="text-align: center; cursor: default; background-color: #cccccc;">주민번호(앞)</td>
					<td></td>
					<td
						style="text-align: center; cursor: default; background-color: #cccccc;">성별</td>
					<td></td>
					<td
						style="text-align: center; cursor: default; background-color: #cccccc;">핸드폰</td>
					<td></td>
					<td
						style="text-align: center; cursor: default; background-color: #cccccc;">국적</td>
					<td></td>
				</tr>


				<tr>
					<td
						style="text-align: center; cursor: default; background-color: #cccccc;">입사일자</td>
					<td></td>
					<td
						style="text-align: center; cursor: default; background-color: #cccccc;">연차</td>
					<td></td>
					<td
						style="text-align: center; cursor: default; background-color: #cccccc;"
						colspan="2">E-MAIL</td>
					<td></td>
				</tr>
				<tr>
					<td
						style="text-align: center; cursor: default; background-color: #cccccc;"
						colspan="2">*연봉</td>
					<td></td>
					<td
						style="text-align: center; cursor: default; background-color: #cccccc;"
						colspan="2">*계좌번호</td>
					<td></td>
				</tr>
			</table>
		</div>
	</article>
</section>