<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<style>
	table, tr, td, th{
		border:1px solid;
		
	}
</style>
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
								<td>${dto.id}</td>
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
	<div class="tab-content">
		<div id="tabs-1" class="tab-pane active">
		<form id="salBasiMatrMngForm" action="#" novalidate="novalidate">
			<input type="hidden" id="salBasiMatrMngForm_emplNo" name="emplNo" tabindex="-1" value="U260222">
			<input type="hidden" id="salBasiMatrMngForm_enplcCd" name="enplcCd" tabindex="-1" value="">
			<input type="hidden" id="salBasiMatrMngForm_payTotalAmt" name="payTotalAmt" tabindex="-1" value=""><!-- 총 급여지급액(급여지급내역이 있다면 급여기본 삭제불가능) -->
			<div class="ins-box mt0">
				<ul>
					<li><i class="fa fa-exclamation-circle"></i> 급여계산에 기본이 되는 항목으로 급여계산 이전에 반드시 등록되어 있어야 합니다.</li>
				</ul>
			</div>
			<div class="content-write mb10">
				<table class="table border-top separate col3-130">
					<colgroup>
						<col width="130">
						<col width="160">
						<col width="130">
						<col width="160">
						<col width="130">
						<col width="160">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><label for="salBasiMatrMngForm_bankCd"><span class="text-point-b" title="필수입력항목">*</span>은행</label></th><!-- 은행 -->
							<td>
								<select id="salBasiMatrMngForm_bankCd" name="bankCd" class="w140" tabindex="5">
									<option value="">선택</option>
									
										<option value="001">한국은행</option>
									
										<option value="002">산업은행</option>
									
										<option value="003">기업은행</option>
									
										<option value="004">국민은행</option>
									
										<option value="007">수협중앙회</option>
									
										<option value="008">수출입은행</option>
									
										<option value="011">농협은행</option>
									
										<option value="012">지역농.축협</option>
									
										<option value="020">우리은행</option>
									
										<option value="023">SC은행</option>
									
										<option value="027">한국씨티은행</option>
									
										<option value="031">대구은행</option>
									
										<option value="032">부산은행</option>
									
										<option value="034">광주은행</option>
									
										<option value="035">제주은행</option>
									
										<option value="037">전북은행</option>
									
										<option value="039">경남은행</option>
									
										<option value="041">우리카드</option>
									
										<option value="044">외환카드</option>
									
										<option value="045">새마을금고중앙회</option>
									
										<option value="048">신협중앙회</option>
									
										<option value="050">상호저축은행</option>
									
										<option value="052">모건스탠리은행</option>
									
										<option value="054">HSBC은행</option>
									
										<option value="055">도이치은행</option>
									
										<option value="056">알비에스피엘씨은행</option>
									
										<option value="057">제이피모간체이스은행</option>
									
										<option value="058">미즈호은행</option>
									
										<option value="059">미쓰비시도쿄UFJ은행</option>
									
										<option value="060">BOA은행</option>
									
										<option value="061">비엔피파리바은행</option>
									
										<option value="062">중국공상은행</option>
									
										<option value="063">중국은행</option>
									
										<option value="064">산림조합</option>
									
										<option value="065">대화은행</option>
									
										<option value="066">교통은행</option>
									
										<option value="071">우체국</option>
									
										<option value="076">신용보증기금</option>
									
										<option value="077">기술보증기금</option>
									
										<option value="081">하나은행</option>
									
										<option value="088">신한은행</option>
									
										<option value="089">K뱅크 준비법인</option>
									
										<option value="090">한국카카오주식회사</option>
									
										<option value="093">한국주택금융공사</option>
									
										<option value="094">서울보증보험</option>
									
										<option value="095">경찰청</option>
									
										<option value="096">한국전자금융(주)</option>
									
										<option value="099">금융결제원</option>
									
										<option value="209">유안타증권</option>
									
										<option value="218">현대증권</option>
									
										<option value="221">골든브릿지투자증권</option>
									
										<option value="222">한양증권</option>
									
										<option value="223">리딩투자증권</option>
									
										<option value="224">BNK투자증권</option>
									
										<option value="225">IBK투자증권</option>
									
										<option value="226">KB투자증권</option>
									
										<option value="227">KTB투자증권</option>
									
										<option value="230">미래에셋증권</option>
									
										<option value="238">대우증권</option>
									
										<option value="240">삼성증권</option>
									
										<option value="243">한국투자증권</option>
									
										<option value="247">NH투자증권</option>
									
										<option value="261">교보증권</option>
									
										<option value="262">하이투자증권</option>
									
										<option value="263">HMC투자증권</option>
									
										<option value="264">키움증권</option>
									
										<option value="265">이베스트투자증권</option>
									
										<option value="266">SK증권</option>
									
										<option value="267">대신증권</option>
									
										<option value="269">한화투자증권</option>
									
										<option value="270">하나대투증권</option>
									
										<option value="278">신한금융투자</option>
									
										<option value="279">동부증권</option>
									
										<option value="280">유진투자증권</option>
									
										<option value="287">메리츠종합금융증권</option>
									
										<option value="290">부국증권</option>
									
										<option value="291">신영증권</option>
									
										<option value="292">엘아이지투자증권</option>
									
										<option value="293">한국증권금융</option>
									
										<option value="294">펀드온라인코리아</option>
									
										<option value="295">우리종합금융</option>
									
										<option value="296">삼성선물</option>
									
										<option value="297">외환선물</option>
									
										<option value="298">현대선물</option>
									
										<option value="361">BC카드</option>
									
										<option value="364">광주카드</option>
									
										<option value="365">삼성카드</option>
									
										<option value="366">신한카드</option>
									
										<option value="367">현대카드</option>
									
										<option value="368">롯데카드</option>
									
										<option value="369">수협카드</option>
									
										<option value="370">씨티카드</option>
									
										<option value="371">NH카드</option>
									
										<option value="372">전북카드</option>
									
										<option value="373">제주카드</option>
									
										<option value="374">하나SK카드</option>
									
										<option value="381">KB국민카드</option>
									
										<option value="431">미래에셋생명</option>
									
										<option value="452">삼성생명</option>
									
										<option value="453">흥국생명</option>
									
								</select>
							</td>
							<th scope="row"><label for="salBasiMatrMngForm_acctNumb"><span class="text-point-b" title="필수입력항목">*</span>계좌번호</label></th><!-- 계좌번호 -->
							<td>
								<input type="text" id="salBasiMatrMngForm_acctNumb" name="acctNumb" class="w140" tabindex="6">
							</td>
							<th scope="row"><label for="salBasiMatrMngForm_acctHold"><span class="text-point-b" title="필수입력항목">*</span>예금주</label></th><!-- 예금주 -->
							<td>
								<input type="text" id="salBasiMatrMngForm_acctHold" name="acctHold" class="w140" tabindex="7">
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="salBasiMatrMngForm_rsdnGbn">비거주자</label></th><!-- 비거주자 -->
							<td>
								<input type="checkbox" id="salBasiMatrMngForm_rsdnGbn" value="1" name="rsdnGbn" class="w20" tabindex="8">
							</td>
							<th scope="row"><label for="salBasiMatrMngForm_rsdnNatnNm">거주지국</label></th><!-- 거주지국 -->
							<td>
								<input type="text" id="salBasiMatrMngForm_rsdnNatnNm" name="rsdnNatnNm" class="w117" disabled="disabled"><button class="btn btn-color5 tbl-inner br" type="button" id="selectRsdnNatnCd" disabled="disabled" tabindex="-1"><i class="fa fa-search"></i><span>거주지국</span></button>
								<input type="hidden" id="salBasiMatrMngForm_rsdnNatnCd" name="rsdnNatnCd" disabled="disabled" value="" tabindex="-1">
							</td>
							<th scope="row"><label for="salBasiMatrMngForm_retRcknDt">퇴직금기산일</label></th><!-- 퇴직금기산일 -->
							<td>
								<input type="text" id="salBasiMatrMngForm_retRcknDt" name="retRcknDt" class="w140" readonly="">
							</td>
						</tr>

					</tbody>
				</table>
			</div>

			<div class="content-write mb10">
				<table class="table border-top separate">
					<colgroup>
						<col width="120">
						<col width="90">
						<col width="160">
						<col width="90">
						<col width="160">
						<col width="90">
						<col width="160">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" rowspan="2"><label for="salBasiMatrMngForm_npNo2">국민연금</label></th><!-- 국민연금 -->
							<!-- skypremire 2016.02.18 국민연금 증번호, 등급 삭제 , 가입일자 -> 취득일자 -->
							<!-- skypremire 2016.11.21 국민연금 증번호 복구 -->
						    <th scope="row"><label for="salBasiMatrMngForm_npNo">증번호</label></th>
							<td>
								<input type="text" id="salBasiMatrMngForm_npNo" name="npNo" class="w140" tabindex="9">
							</td>
							<th rowspan="2" scope="row"><label for="salBasiMatrMngForm_npMonthPay">기준소득월액</label></th><!-- 국민연금보수월액 -->
							<td rowspan="2">
								<input type="text" id="salBasiMatrMngForm_npMonthPay" name="npMonthPay" class="w140" maxlength="13" tabindex="10" style="text-align: right;">
							</td>
							<th scope="row"><label for="salBasiMatrMngForm_npNtryDt">취득일자</label></th><!-- 가입일자 -->
							<td>
                                   <input type="text" id="salBasiMatrMngForm_npNtryDt" name="npNtryDt" class="w100 ajaxDatePicker sproDatepicker" tabindex="11">
                                   <button class="datepicker" id="datepicker" type="button" tabindex="-1"><i class="icon calendar"></i></button>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="salBasiMatrMngForm_npExcYn">계산방법</label></th><!-- 국민연금비대상 -->
							<td>
								<select id="salBasiMatrMngForm_npExcYn" name="npExcYn" class="w140" tabindex="12">
									
										<option value="01">보수월액기준</option>
									
										<option value="02">자동계산</option>
									
										<option value="03">계산안함</option>
									
								</select>
							</td>
							<th scope="row"><label for="salBasiMatrMngForm_npSecssDt">탈퇴일자</label></th><!-- 탈퇴일자 -->
							<td>
                                    <input type="text" id="salBasiMatrMngForm_npSecssDt" name="npSecssDt" class="w100 ajaxDatePicker sproDatepicker" tabindex="13">
                                    <button class="btn btn-color5 br tbl-inner" type="button" tabindex="-1"><i class="icon calendar"></i></button>
							</td>
						</tr>

						<tr>
							<th scope="row" rowspan="2"><label for="salBasiMatrMngForm_nhisNo1">건강보험</label></th><!-- 건강보험 -->
							<th scope="row"><label for="salBasiMatrMngForm_nhisNo">증번호</label></th><!-- 증번호 -->
							<td>
								<input type="text" id="salBasiMatrMngForm_nhisNo" name="nhisNo" class="w140" tabindex="14">
							</td>
							<th scope="row" rowspan="2"><label for="salBasiMatrMngForm_nhisMonthPay">기준소득월액</label></th><!-- 건강보험보수월액 -->
							<td rowspan="2">
								<input type="text" id="salBasiMatrMngForm_nhisMonthPay" name="nhisMonthPay" class="w140" maxlength="13" tabindex="15" style="text-align: right;">
							</td>
								<th scope="row"><label for="salBasiMatrMngForm_nhisAcqsDt">취득일자</label></th><!-- 취득일자 -->
							<td>
                                   <input type="text" id="salBasiMatrMngForm_nhisAcqsDt" name="nhisAcqsDt" class="w100 ajaxDatePicker sproDatepicker" tabindex="16">
                                   <button class="btn btn-color5 br tbl-inner" type="button" tabindex="-1"><i class="icon calendar"></i></button>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="salBasiMatrMngForm_rhisExcYn">계산방법</label></th><!-- 건강보험비대상 -->
							<td>
								<select id="salBasiMatrMngForm_rhisExcYn" name="rhisExcYn" class="w140" tabindex="17">
									
										<option value="01">보수월액기준</option>
									
										<option value="02">자동계산</option>
									
										<option value="03">계산안함</option>
									
								</select>
							</td>
							<th scope="row"><label for="salBasiMatrMngForm_nhisLossDt">상실일자</label></th><!-- 상실일자 -->
							<td>
								<input type="text" id="salBasiMatrMngForm_nhisLossDt" name="nhisLossDt" class="w100 ajaxDatePicker sproDatepicker" tabindex="18">
                                   <button class="btn btn-color5 br tbl-inner" type="button" tabindex="-1"><i class="icon calendar"></i></button>
							</td>
						</tr>

						<tr>
							<th scope="row" rowspan="2"><label for="salBasiMatrMngForm_eiAcqsDt1">고용보험</label></th><!-- 고용보험 -->
							<th scope="row" rowspan="2"><label for="salBasiMatrMngForm_eiExcYn">계산방법</label></th><!-- 고용보험비대상 -->
							<td rowspan="2">
								<select id="salBasiMatrMngForm_eiExcYn" name="eiExcYn" class="w140" tabindex="19">
									
										<option value="01">보수월액기준</option>
									
										<option value="02">자동계산</option>
									
										<option value="03">계산안함</option>
									
								</select>
							</td>
							<th scope="row" rowspan="2"><label for="salBasiMatrMngForm_eiMonthPay">기준소득월액</label></th><!-- 고용보험보수월액 -->
							<td rowspan="2">
								<input type="text" id="salBasiMatrMngForm_eiMonthPay" name="eiMonthPay" class="w140" maxlength="13" tabindex="20" style="text-align: right;">
							</td>
							<th scope="row"><label for="salBasiMatrMngForm_eiAcqsDt">취득일자</label></th><!-- 고용보험취득일자 -->
							<td>
								<input type="text" id="salBasiMatrMngForm_eiAcqsDt" name="eiAcqsDt" class="w100 ajaxDatePicker sproDatepicker" tabindex="21">
                                                  <button class="btn btn-color5 br tbl-inner" type="button" tabindex="-1"><i class="icon calendar"></i></button>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="salBasiMatrMngForm_eiLossDt">상실일자</label></th><!-- 상실일자 -->
							<td>
								<input type="text" id="salBasiMatrMngForm_eiLossDt" name="eiLossDt" class="w100 ajaxDatePicker sproDatepicker" tabindex="22">
                                                  <button class="btn btn-color5 br tbl-inner" type="button" tabindex="-1"><i class="icon calendar"></i></button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="content-write mb10">
				<table class="table border-top separate">
					<colgroup>
						<col width="130">
						<col width="80">
						<col width="160">
						<col width="90">
						<col width="160">
						<col width="90">
						<col width="160">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" colspan="2"><label for="salBasiMatrMngForm_withAdptMeth">간이세액표 적용방법</label></th><!-- 간이세액표적용방법 -->
							<td>
								<select id="salBasiMatrMngForm_withAdptMeth" name="withAdptMeth" class="w140" tabindex="23">
									<option value="">선택</option>
									
										<option value="1">80%</option>
									
										<option value="2">100%</option>
									
										<option value="3">120%</option>
									
								</select>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="content-write mb10">
				<table class="table border-top separate">
					<colgroup>
						<col width="130">
						<col width="80">
						<col width="160">
						<col width="90">
						<col width="160">
						<col width="90">
						<col width="160">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" rowspan="4" colspan="2"><label for="salBasiMatrMngForm_emplGbn">사원구분</label></th>
							<td rowspan="4">
								<select id="salBasiMatrMngForm_emplGbn" name="emplGbn" class="w140" tabindex="24">
									<option value="">선택</option>
									
										<option value="1">일반</option>
									
										<option value="2">연구직</option>
									
										<option value="3">생산직(고정상여)</option>
									
										<option value="4">생산직(비고정상여)</option>
									
								</select>
							</td>
							<td colspan="4"><li><i class="fa fa-exclamation-circle"></i>&nbsp;소득세법상 구분에 따라서 사원의 구분을 선택합니다.</li>
						<p>
						<i class="fa fa-exclamation-circle"></i>&nbsp;전년도 총급여가 2500만원 초과시 사원구분을 일반으로 선택합니다. 생산직이면 수당이 연 240만원 이내에서 비과세 처리됩니다.
						</p><p>
						<i class="fa fa-exclamation-circle"></i>&nbsp;고정 : 귀속연월이 동일한 상여를 포함하여 계산, 비고정 : 상여를 제외하고 계산
						</p></td></tr>
					</tbody>
				</table>
			</div>

			<div class="content-write mb10">
				<table class="table border-top separate">
					<caption></caption>
					<colgroup>
						<col width="120">
						<col width="90">
						<col width="160">
						<col width="90">
						<col width="160">
						<col width="90">
						<col width="160">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" rowspan="2"><label for="salBasiMatrMngForm_incm">소득세액</label></th><!-- 소득세액 -->
							<th scope="row"><label for="salBasiMatrMngForm_incmRduCd">감면코드</label></th><!-- 감면코드 -->
							<td>
								<select id="salBasiMatrMngForm_incmRduCd" name="incmRduCd" class="w140" tabindex="25">
									<option value="">선택</option>
									
										<option value="T01">외국인근로</option>
									
										<option value="T10">중소기업 취업</option>
									
										<option value="T20">조세조약</option>
									
										<option value="Z01">해저광물자원</option>
									
								</select>
							</td>
							<th scope="row"><label for="salBasiMatrMngForm_rduDate">감면비율</label></th><!-- 감면비율 -->
							<td>
								<input type="text" id="salBasiMatrMngForm_rduDate" name="rduDate" class="w70" tabindex="26" style="text-align: right;">
							</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th scope="row"><label for="salBasiMatrMngForm_rduStartDt">감면기간</label></th><!-- 감면기간 -->
							<td colspan="3">
								<input type="text" id="salBasiMatrMngForm_rduStartDt" name="rduStartDt" class="w100 ajaxDatePicker sproDatepicker" tabindex="27">
                                   <button class="btn btn-color5 br tbl-inner" type="button" tabindex="-1"><i class="icon calendar"></i></button>
                                   ~
                                   <input type="text" id="salBasiMatrMngForm_rduEndDt" name="rduEndDt" class="w100 ajaxDatePicker sproDatepicker" tabindex="28">
                                   <button class="btn btn-color5 br tbl-inner" type="button" tabindex="-1"><i class="icon calendar"></i></button>
							</td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="content-write mb10">
				<table class="table border-top separate">
					<colgroup>
						<col width="120">
						<col width="90">
						<col width="410">
						<col width="90">
						<col width="160">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" rowspan="2"><label for="salBasiMatrMngForm_excTermFrom1">예외처리</label></th><!-- 급여<br/>예외처리 -->
                               <th scope="row"><label for="salBasiMatrMngForm_excTermFrom">기간</label></th><!-- 기간 -->
							<td class="">
								<input type="text" id="salBasiMatrMngForm_excTermFrom" name="excTermFrom" class="w100 ajaxDatePicker sproDatepicker" tabindex="29">
								<button class="btn btn-color5 br tbl-inner" type="button" tabindex="-1"><i class="icon calendar"></i></button>
								 ~
                                   <input type="text" id="salBasiMatrMngForm_excTermTo" name="excTermTo" class="w100 ajaxDatePicker sproDatepicker" tabindex="30">
                                   <button class="btn btn-color5 br tbl-inner" type="button" tabindex="-1"><i class="icon calendar"></i></button>
							</td>
							<th scope="row"><label for="salBasiMatrMngForm_excPayRate">지급율</label></th><!-- 지급율 -->
							<td>
								<input type="text" id="salBasiMatrMngForm_excPayRate" name="excPayRate" class="w70" tabindex="31" style="text-align: right;">
							</td>
						</tr>
						<tr>
                               <th scope="row"><label for="salBasiMatrMngForm_excResn">사유</label></th><!-- 사유 -->
							<td colspan="3">
								<input type="text" id="salBasiMatrMngForm_excResn" name="excResn" class="w600" tabindex="32">
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="ins-box">
				<ul>
					<li><i class="fa fa-exclamation-circle"></i> 예외처리 : 통상급여에 대해  일정기간동안 지급율을 변경하는 기능입니다.</li>
				</ul>
			</div>
			<div class="btn-wrap">
				
					<button type="button" id="salBasiMatrMngFormDelete" class="btn btn-color7 br" tabindex="-1">삭제</button><!-- 삭제 -->
				
				
					<button type="button" id="salBasiMatrMngFormUpdate" class="btn btn-color5 br" tabindex="-1">저장</button><!-- 저장 -->
				
			</div>
			</form>
		</div>

		<div id="tabs-2" class="tab-pane">
			<div class="ins-box">
				<ul>
					<li><i class="fa fa-exclamation-circle"></i> 월 변동 없이 정기적으로 급여계산에 포함되는 지급/공제항목을 설정합니다.<br>
  															  &nbsp;&nbsp;매월 변동되는 수당은 <a class="url_link" target="_blank" href="https://ezhuman.bizmeka.com/product/salmng/alwncdeduc/alwncDeducView.do?viewMenuCode=PI08">[기본수당외수당관리]</a> 메뉴에서 관리됩니다.</li>
					<li><i class="fa fa-exclamation-circle"></i> 계산식이 사용인 경우 금액을 입력해도 계산식으로 금액이 계산되어 금액이 0으로 표현됩니다.</li>
					<li><i class="fa fa-exclamation-circle"></i> '상여'항목은 [급여계산] 메뉴에서 계산되고 '상여지급액'항목은 <a class="url_link" target="_blank" href="https://ezhuman.bizmeka.com/product/salmng/bonuscalc/bonusCalcView.do?viewMenuCode=PI12">[상여계산]</a> 메뉴에서 계산됩니다.</li>
				</ul>
			</div>
			<div class="subtitle mt10">
				<div class="fright">
					<input type="checkbox" id="salaryPayRollInfo_option"> 종료된 항목포함&nbsp;&nbsp;&nbsp;
					
						<button id="salaryPayRollInfo_addBtn" type="button" class="btn btn-color7 br">행추가</button>
					
					
						<button id="salaryPayRollInfo_removeBtn" type="button" class="btn btn-color7 br">행삭제</button>
					
				</div>
			</div>
			<div class="content-list bdr-t">
				<div id="salaryPayRollInfoGrid" style="height: 334px; width: auto; cursor: default;" class=" gridbox gridbox_dhx_skyblue isModern"><div class="xhdr" style="width: 100%; height: 25px; overflow: hidden; position: relative;"><div class="dhxgrid_sort_desc" style="display: none; position: absolute;"></div><table cellpadding="0" cellspacing="0" class="hdr" style="width: 100%; table-layout: fixed; margin-right: 20px; padding-right: 20px;"><tbody><tr style="height: auto;"><th style="height: 0px;"></th><th style="height: 0px;"></th><th style="height: 0px;"></th><th style="height: 0px;"></th><th style="height: 0px;"></th><th style="height: 0px;"></th><th style="height: 0px;"></th><th style="height: 0px; display: none; white-space: nowrap;"></th><th style="height: 0px; display: none; white-space: nowrap;"></th><th style="height: 0px; display: none; white-space: nowrap;"></th><th style="height: 0px;"></th><th style="height: 0px; display: none; white-space: nowrap;"></th></tr><tr><td><div class="hdrcell" id="salaryPayRollInfoGrid_0"><input type="checkbox"></div></td><td><div class="hdrcell" id="salaryPayRollInfoGrid_1">지급/공제</div></td><td><div class="hdrcell" id="salaryPayRollInfoGrid_2">항목명</div></td><td><div class="hdrcell" id="salaryPayRollInfoGrid_3">금액</div></td><td><div class="hdrcell" id="salaryPayRollInfoGrid_4">시작년월</div></td><td><div class="hdrcell" id="salaryPayRollInfoGrid_5">종료년월</div></td><td><div class="hdrcell" id="salaryPayRollInfoGrid_6">비고</div></td><td style="display: none; white-space: nowrap;"><div class="hdrcell" id="salaryPayRollInfoGrid_7">paySbtrNm</div></td><td style="display: none; white-space: nowrap;"><div class="hdrcell" id="salaryPayRollInfoGrid_8">tenantId</div></td><td style="display: none; white-space: nowrap;"><div class="hdrcell" id="salaryPayRollInfoGrid_9">emplNo</div></td><td><div class="hdrcell" id="salaryPayRollInfoGrid_10">계산식</div></td><td style="display: none; white-space: nowrap;"><div class="hdrcell" id="salaryPayRollInfoGrid_11">seqNo</div></td></tr></tbody></table></div><div class="objbox" style="width: 100%; overflow: auto;"><table cellpadding="0" cellspacing="0" class="obj row20px" style="width: 100%; table-layout: fixed;"><tbody><tr style="height: auto;"><th style="height: 0px;"></th><th style="height: 0px;"></th><th style="height: 0px;"></th><th style="height: 0px;"></th><th style="height: 0px;"></th><th style="height: 0px;"></th><th style="height: 0px;"></th><th style="height: 0px; width: 0px; display: none;"></th><th style="height: 0px; width: 0px; display: none;"></th><th style="height: 0px; width: 0px; display: none;"></th><th style="height: 0px;"></th><th style="height: 0px; width: 0px; display: none;"></th></tr></tbody></table></div><div class="nodata" style="width: 100%; overflow: auto;">데이터가 없습니다.</div></div>
				
				<div class="btn-wrap">
					<button id="salaryPayRollInfo_saveBtn" type="button" class="btn btn-color5 br">저장</button>
				</div>
				
			</div>
		</div>
	</div>
</div>
		진짜내용
	</article>
</section>