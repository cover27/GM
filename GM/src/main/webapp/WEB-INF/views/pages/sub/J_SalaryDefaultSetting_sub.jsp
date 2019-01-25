<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	table, tr, td, th{
		border:1px solid;
		
	}
</style>
<script type="text/javascript">
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
function loadNews_callback(){
	var result = document.getElementById("result");
	if(httpRequest.readyState == 4){ // 4 : completed : 전체 데이터가 취득 완료된 상태
		if(httpRequest.status == 200){ // 200 : 정상종료
			//result.innerHTML = "정상종료";
			result.innerHTML = httpRequest.responseText;
		}else{
			result.innerHTML = "에러발생";
		}
	}else{
		result.innerHTML = "상태 :" + httpRequest.readyStatus;
	}
}
 </script>
<section>
	<article>
		<div class="content-wrap topPd">
	<div class="search-wrap">
		<form id="salBasiMatrMngGridSearchForm">
		<div class="form-group">
			<table>
				<caption>검색타입</caption>
				<colgroup>
					<col width="60">
					<col width="180">
					<col width="260">
					<col width="20">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="salBasiMatrMngGridSearchForm_searchEnplcFlag"><span class="text-point-b" title="필수입력항목">*</span>사업장</label></th>
						<td>
							<select id="salBasiMatrMngGridSearchForm_searchEnplcFlag" name="searchEnplcFlag" class="w150" tabindex="1">
								
									<option value="G001" selected="">홈사랑넷</option>
								
							</select>
						</td>
						<td>
							<select id="salBasiMatrMngGridSearchForm_searchColumn" class="w90" name="searchColumn" tabindex="2"> <!-- 성명,사원번호,부서: 일반사용자 disabled 자신의 사원번호 -->
								<option value="emplNm">성명</option>
								<option value="emplNo">사원번호</option>
								<option value="deptCd">부서</option>
							</select>
							<input id="salBasiMatrMngGridSearchForm_searchWord" class="submit" type="text" name="searchWord" tabindex="3">
						</td>
						<th><input id="aa" name="retire" type="checkbox" value="N" tabindex="4"></th>
						<td><label for="aa">퇴직자포함</label></td><!-- 퇴직자포함: 일반사용자 disabled -->
					</tr>
				</tbody>
			</table>
			<div class="search_btn">
				<button id="salBasiMatrMngGridSearchForm_searchBtn" type="submit" class="btn btn-color5" tabindex="-1"><i class="fa fa-search fa-fw"></i> 검색</button>
			</div>
		</div>
		</form>
	</div>

	<div class="subtitle">
		<form id="excelDownloadForm" method="get" action="/product/salmng/salbasimatrmng/excelDownloadSalBasiMatrMng.do?OWASP_CSRFTOKEN=OBEQ-JB61-8UUP-68Z3-QON3-7N56-H65K-U5LP">
			<input type="hidden" name="searchEnplcFlag" id="excelDownloadForm_searchEnplcFlag">
			<input type="hidden" name="bascYear" id="excelDownloadForm_bascYear">
			<input type="hidden" name="searchColumn" id="excelDownloadForm_searchColumn">
			<input type="hidden" name="searchWord" id="excelDownloadForm_searchWord">
			<input type="hidden" name="retire" id="excelDownloadForm_retire">
		<input type="hidden" name="OWASP_CSRFTOKEN" value="OBEQ-JB61-8UUP-68Z3-QON3-7N56-H65K-U5LP"></form>
		<h3 class="fleft">기본정보<em>7</em></h3>
		<div class="fright">
			
				<button type="button" id="excelDownload" class="btn btn-color7 br">엑셀다운로드</button>
			
		</div>
	</div>

	<div class="content-list bdr-t">
		<div id="leftGrid" style="height: 310px; width: 1197.2px; cursor: default;" class=" gridbox gridbox_dhx_skyblue isModern">
			<div class="xhdr" style="width: 100%; height: 32px; overflow: hidden; position: relative;">
				<div class="dhxgrid_sort_desc" style="display: none; position: absolute;">
				
				</div>
				<table cellpadding="0" cellspacing="0" class="hdr" style="width: 1197px; table-layout: fixed; margin-right: 20px; padding-right: 20px;">
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
			<div class="objbox" style="width: 100%; overflow: hidden auto; height: 278px;">
				<table cellpadding="0" cellspacing="0" class="obj row20px" style="width: 1197px; table-layout: fixed;">
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
								<td onclick="load('J_info?id=${dto.id}')" style="cursor: pointer;">${dto.id}</td>
								<td>${dto.name}</td>
								<td>${dto.rank}</td>
								<td>${dto.depart}</td>
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
			
				<!-- 페이지 컨트롤 -->
					<tr>
						<th colspan="7" align="center">
							<!-- 게시글이 있으면 --> <c:if test="${cnt >0}">
								<!-- 처음[◀◀] / 이전블록[◀]-->
								<c:if test="${startPage > pageBlock}">
									<a href="J_SalaryDefaultSetting">[PageDown x2]</a>
									<a href="J_SalaryDefaultSetting?pageNum=${startPage - pageBlock}">[PageDown]</a>
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
									<a href="J_SalaryDefaultSetting?pageNum=${startPage + pageBlock}">[▶]</a>
									<a href="J_SalaryDefaultSetting?pageNum=${pageCount}">[▶▶]</a>
								</c:if>
							</c:if>
						</th>
					</tr>
				</table>
			</div>
			<div class="nodata" style="width: 100%; overflow: auto; display: none;">데이터가 없습니다.</div>
		</div>
	</div>


	<div class="subtitle">
		<h3>상세정보</h3>
	</div>
	<ul class="nav nav-tabs6 push mb0" data-toggle="tabs">
		<li class="active"><a href="#tabs-1">급여기본</a></li><!-- 급여기본 -->
		<li><a href="#tabs-2">급여지급</a></li><!-- 급여지급 -->
	</ul>
	<div id="result">
		값표시.
	</div>
</div>
		진짜내용
	</article>
</section>