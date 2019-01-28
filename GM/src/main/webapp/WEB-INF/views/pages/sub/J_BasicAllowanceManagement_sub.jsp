<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	table, tr, td, th{
		border:1px solid;
		
	}
</style>
<section>
	<article>
		<div class="content_header">
			<h2>기본수당 외 수당 관리</h2>
		</div>
		<div class="content-wrap topPd">
	<div class="search-wrap">
		<form id="alwncDeducGridSearchForm" action="#">
		<div class="form-group">
			<table>
				<caption>검색타입</caption>
				<colgroup>
					<col width="60">
					<col width="180">
					<col width="80">
					<col width="140">
					<col width="">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><span class="text-point-b">*</span><label for="alwncDeducGridSearchForm_searchEnplcFlag">사업장</label></th>
						<td>
							<select id="alwncDeducGridSearchForm_searchEnplcFlag" name="searchEnplcFlag" class="w150">
									<option value="G001" selected="">홈사랑넷</option>
							</select>
						</td>
						<th><span class="text-point-b">*</span><label for="alwncDeducGridSearchForm_searchDate">검색년월</label></th><!-- 기준년도 -->
						<td>
							<input type="text" id="alwncDeducGridSearchForm_searchDate" name="searchDate" class="w80" size="10">
							<button class="btn btn-color5 br tbl-inner" type="button"><i class="icon calendar"></i></button>
						</td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<div class="search_btn">
				<button id="alwncDeducGridSearchForm_searchBtn" type="submit" class="btn btn-color5"><i class="fa fa-search fa-fw"></i> 검색</button>
			</div>
		</div>
		</form>
	</div>

	<div class="layout-division static-division">
		<div class="layout-row">
			<div class="layout-cell pol" style="width:310px;">
				<div class="Lbox">
					<div class="subtitle">
						<h3 class="fleft">기본정보<em>0</em></h3>
					</div>

					<div class="content-list bdr-t">
						<div id="leftGrid" style="width: 298.2px; height: 390px; cursor: default;" class=" gridbox gridbox_dhx_skyblue isModern">
							<div class="xhdr" style="width: 100%; height: 32px; overflow: hidden; position: relative;">
								<div class="dhxgrid_sort_desc" style="display: none; position: absolute;"></div>
								<table cellpadding="0" cellspacing="0" class="hdr" style="width: 298px; table-layout: fixed; margin-right: 20px; padding-right: 20px;">
									<tbody>
										<tr style="height: auto;">
											<th style="height: 0px; width: 90px;"></th>
											<th style="height: 0px; width: 90px;"></th>
											<th style="height: 0px; width: 118px;"></th>
											<th style="height: 0px; display: none; white-space: nowrap; width: 0px;"></th>
										</tr>
										<tr>
											<td style="text-align: center;">
												<div class="hdrcell" id="leftGrid_0">사원번호</div>
											</td>
											<td style="text-align: center;">
												<div class="hdrcell" id="leftGrid_1">성명</div>
											</td>
											<td style="text-align: center;">
												<div class="hdrcell" id="leftGrid_2">부서</div>
											</td>
											<td style="text-align: center; display: none; white-space: nowrap;">
												<div class="hdrcell" id="leftGrid_3">emplNo</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="objbox" style="width: 100%; overflow: auto; height: 358px;">
								<table cellpadding="0" cellspacing="0" class="obj row20px" style="width: 298px; table-layout: fixed;">
									<tbody>
										<tr style="height: auto;">
											<th style="height: 0px; width: 90px;"></th>
											<th style="height: 0px; width: 90px;"></th>
											<th style="height: 0px; width: 118px;"></th>
											<th style="height: 0px; width: 0px; display: none;"></th>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="nodata" style="width: 100%; overflow: auto; display: block;">데이터가 없습니다.</div>
						</div>
					</div>
				</div>
			</div>
			<div class="layout-cell por" style="padding-left:330px;">
				<div class="Lbox">
					<div class="subtitle">
						<h3 class="fleft">
							기본수당외 수당등록
							<label id="alwncDeducGridSearchForm_payCalcYn" style="color: blue;"></label>
						<em>0</em></h3>
						<div class="fright">
								<button id="alwncDeduc_add" type="button" onclick="spro.alwncDeducInstance.addCmmCd();" class="btn btn-color7 br">행추가</button>
								<button id="alwncDeduc_delete" type="button" onclick="spro.alwncDeducInstance.removeCmmCd();" class="btn btn-color7 br">행삭제</button>
						</div>
					</div>
					<div class="content-list bdr-t">
						<div id="mainGrid" style="width: 871.2px; height: 390px; cursor: default;" class=" gridbox gridbox_dhx_skyblue isModern"><div class="xhdr" style="width: 100%; height: 32px; overflow: hidden; position: relative;"><div class="dhxgrid_sort_desc" style="display: none; position: absolute;"></div><table cellpadding="0" cellspacing="0" class="hdr" style="width: 871px; table-layout: fixed; margin-right: 20px; padding-right: 20px;"><tbody><tr style="height: auto;"><th style="height: 0px; width: 52px;"></th><th style="height: 0px; width: 174px;"></th><th style="height: 0px; width: 139px;"></th><th style="height: 0px; width: 157px;"></th><th style="height: 0px; width: 349px;"></th><th style="height: 0px; width: 1px; display: none; white-space: nowrap;"></th><th style="height: 0px; width: 0px; display: none; white-space: nowrap;"></th><th style="height: 0px; width: 0px; display: none; white-space: nowrap;"></th><th style="height: 0px; width: 0px; display: none; white-space: nowrap;"></th><th style="height: 0px; width: 0px; display: none; white-space: nowrap;"></th></tr><tr><td style="text-align: center;"><div class="hdrcell" id="mainGrid_0"><input type="checkbox"></div></td><td style="text-align: center;"><div class="hdrcell" id="mainGrid_1"><span class="text-point-b" title="필수입력항목">*</span>항목명</div></td><td style="text-align: center;"><div class="hdrcell" id="mainGrid_2"><span class="text-point-b" title="필수입력항목">*</span>지급/공제</div></td><td style="text-align: center;"><div class="hdrcell" id="mainGrid_3"><span class="text-point-b" title="필수입력항목">*</span>금액</div></td><td style="text-align: center; cursor: default;"><div class="hdrcell" id="mainGrid_4">비고</div></td><td style="text-align: center; display: none; white-space: nowrap;"><div class="hdrcell" id="mainGrid_5">tenantId</div></td><td style="text-align: center; display: none; white-space: nowrap;"><div class="hdrcell" id="mainGrid_6">emplNo</div></td><td style="text-align: center; display: none; white-space: nowrap;"><div class="hdrcell" id="mainGrid_7">adaptYymm</div></td><td style="text-align: center; display: none; white-space: nowrap;"><div class="hdrcell" id="mainGrid_8">paySbtrGbn</div></td><td style="text-align: center; display: none; white-space: nowrap;"><div class="hdrcell" id="mainGrid_9">paySbtrNm</div></td></tr></tbody></table></div><div class="objbox" style="width: 100%; overflow: hidden auto; height: 358px;"><table cellpadding="0" cellspacing="0" class="obj row20px" style="width: 871px; table-layout: fixed;"><tbody><tr style="height: auto;"><th style="height: 0px; width: 52px;"></th><th style="height: 0px; width: 174px;"></th><th style="height: 0px; width: 139px;"></th><th style="height: 0px; width: 157px;"></th><th style="height: 0px; width: 349px;"></th><th style="height: 0px; width: 1px; display: none;"></th><th style="height: 0px; width: 0px; display: none;"></th><th style="height: 0px; width: 0px; display: none;"></th><th style="height: 0px; width: 0px; display: none;"></th><th style="height: 0px; width: 0px; display: none;"></th></tr></tbody></table></div><div class="nodata" style="width: 100%; overflow: auto; display: block;">데이터가 없습니다.</div></div>
						<div class="btn-wrap">
							<button id="alwncDeduc_save" type="button" onclick="spro.alwncDeducInstance.saveCmmCd();" class="btn btn-color5 br">저장</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	</article>
</section>