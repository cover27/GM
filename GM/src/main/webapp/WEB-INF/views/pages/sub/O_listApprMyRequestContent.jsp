<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.search-wrap {
    margin: 0 0 20px;
    background-color: #f3f3f3;
    padding: 10px 20px 10px 4px;
}
.search-wrap .form-group {
    margin-bottom: 0px;
    position: relative;
    padding-right: 80px;
}
.search-wrap table {
    background: none;
}
.search-wrap table th {
    text-align: right;
    color: #222;
}
.search-wrap table td {
    padding: 4px 0 4px 10px;
}
input[type="text"], input[type="password"] {
    height: 27px;
    line-height: 27px;
    padding: 0 8px;
    border: 1px solid #c3c6c9;
    border-radius: 2px;
    /* box-shadow: 0 3px 3px #f4f4f4 inset; */
}
.w50p {
    width: 50% !important;
}
.search-wrap .search_btn {
    position: absolute;
    right: 5px;
    top: 50%;
    text-align: right;
    margin-top: -14px;
    padding: 0;
}
.search-wrap .search_btn .btn.br {
    border-color: #ff757f;
}

.search-wrap .search_btn .btn {
    background: #ff757f !important;
}
.search-wrap .search_btn .btn {
    padding: 3px 11px 4px;
}
.btn-color5.br {
    border: 1px solid #363636;
}
.btn-color5 {
    background: #363636!important;
}
.btn-wrap .btn {
    min-width: 63px;
    padding: 5px 11px;
    box-shadow: 0 3px 5px #e3e3e3;
}
.btn {
    display: inline-block;
    padding: 3px 11px;
    line-height: 19px;
    font-size: 13px;
    font-weight: 600;
    color: #fff;
    text-align: center;
    vertical-align: middle;
    border: 1px solid transparent;
    border-radius: 2px;
    cursor: pointer;
    white-space: nowrap;
}
.search-wrap table td .btn {
    border: 1px #bbb solid;
    background: #fff !important;
}

.search-wrap table td .btn {
    padding: 3px 6px;
    margin-left: -4px;
    border-radius: 0 2px 2px 0;
    font-size: 14px;
}
.btn-color7.br {
    border: 1px solid #aaa;
}
.btn-color7 {
    background: #fff;
    color: #111;
}
.tbl-inner {
    height: 27px !important;
    min-width: 30px;
    padding: 2px 6px 3px 6px !important;
    margin-left: -5px !important;
    line-height: 19px !important;
    border-radius: 0px 3px 3px 0;
}
.fa-fw {
    width: 1.28571429em;
    text-align: center;
}
.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
.table-header {
    border-bottom: 2px solid #c0c0c0;
}
.table-header {
    position: relative;
    height: 50px;
    margin: 0 20px;
    background: #fff;
}
.table-header .listinfo {
    position: relative;
    top: 11px;
    line-height: 20px;
}
.table-header .listinfo select {
    float: left;
    display: inline-block;
}
.table-header .listinfo .totalnum {
    float: left;
    display: inline-block;
    margin: 4px 16px 0 10px;
    color: #999;
}
.table-header .listinfo .totalnum span {
    margin-left: 3px;
    font-weight: 700;
    color: #f05050;
}
.table-search.astatus {
    top: 2px;
}
.table-search {
    position: absolute;
    top: 11px;
    right: 0;
}
i.icon.progress {
    width: 17px;
    height: 17px;
    background-position: -21px 0;
    vertical-align: middle;
}
.approval .ap-status .btn .select2-category i {
    margin: 0;
}
i.icon {
    display: inline-block;
    background-image: url(../images/common/ic_common.png);
    margin: 0 4px;
    background-repeat: no-repeat;
    vertical-align: middle;
}
.content-list {
    border-top: 1px solid #d1d1d1;
    margin: 0 20px;
    margin-top: -1px;
}
.content-list .table {
    border-bottom: 1px solid #eee;
}
.content-list .table > thead > tr > th {
    padding: 5px 5px 6px;
    height: 38px;
    line-height: 18px;
    color: #111;
    text-align: center;
    font-weight: 600;
    vertical-align: middle;
    border-bottom: 1px solid #d1d1d1;
    background: #fff;
}
.content-list i.fa-caret-up, .content-list i.fa-caret-down {
    margin-left: 3px;
    color: #999;
    font-size: 13px;
}
.content-list .table > tbody > tr > td {
    padding: 3px 5px;
    height: 34px;
    line-height: 18px;
    color: #333;
    text-align: center;
    vertical-align: middle;
}
.table-striped.striped02 > tbody > tr > td {
    background-color: #f9f9f9;
    border-top: 1px #eee solid;
}
.approval .ap-status .btn {
    padding: 0 8px;
    position: relative;
    height: 23px;
    border-radius: 0;
    background-color: #fff;
    border: 1px solid #ddd;
    margin-bottom: 0;
}
.content-list .table > tbody > tr > td a {
    color: #111;
    /* padding-left: 10px; */
}
.pagination-wrap {
    padding: 6px 0 7px;
    margin-top: -1px;
    height: 39px;
    text-align: center;
    border-top: 1px solid #eee;
    border-bottom: 1px solid #eee;
    background: #fff;
}
.pagination {
    display: inline-block;
}
.pagination > li {
    display: inline;
}
.pagination > li > a.disabled .fa {
    color: #ced3d6;
}
.pagination > li > a .fa {
    font-size: 11px;
    vertical-align: text-bottom;
}
.pagination > li > a, .pagination > li > span {
    float: left;
    font-weight: 600;
    margin: 0 2px;
    padding: 4px 9px;
    min-width: 25px;
    height: 25px;
    text-decoration: none;
    border: none !important;
    border-radius: 25px !important;
}
.btn-wrap {
    padding: 8px 0 8px 0;
    text-align: right;
}
button, input, optgroup, select, textarea {
    color: inherit;
    font: inherit;
    margin: 0;
}
option {
    font-weight: normal;
    display: block;
    white-space: pre;
    min-height: 1.2em;
    padding: 0px 2px 1px;
}
select {
    height: 27px;
    padding: 3px;
    color: #111;
    border: 1px solid #c3c6c9;
    border-radius: 2px;
}
table {
    border-spacing: 0;
    width: 100%;
    max-width: 100%;
    table-layout: fixed;
    border-collapse: collapse;
    background-color: #fff;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
</style>

<section>
	<article>
		<div class="content_header">
			<h2>결재 요청함</h2>
		</div>
		
		<!-- 결재 요청함 게시글 나열 list -->
		<div class="content-wrap responsive pt10">
			<form id="searchForm" method="post" action="/groupware/approval/work/apprlist/listApprMyRequest.do?OWASP_CSRFTOKEN=HBBI-YW0L-FXCE-F7IU-BSAG-5AQK-08FF-K8HD" novalidate="novalidate">
				<input name="apprId" type="hidden" value="" title="hidden">
				<input name="listType" type="hidden" value="myRequestList" title="hidden">
				<input name="linkType" type="hidden" value="" title="hidden">
				<input name="apprIds" type="hidden" value="" title="hidden">
				<input name="sortColumn" type="hidden" value="apprReqDate" title="정렬 컬럼">
				<input name="sortType" type="hidden" value="DESC" title="정렬 타입 ">
			    	
				<!-- search start-->
				<div class="search-wrap">
					<div class="form-group">
						<table>
							<caption></caption>
							<colgroup>
								<col style="width: 7%;">
								<col style="width: 33%;">
								<col style="width: 7%;">
								<col style="width: 33%;">
							</colgroup>	
							<tbody>
								<tr>									
									<th scope="row"><label for="searchFormName">양식명</label></th>
									<td><input id="searchFormName" name="searchFormName" value="" type="text" title="양식명" class="w50p" onkeypress="apprSecrchKeyevent(event);"></td>
									<th scope="row"><label for="searchApprDocStatus">문서상태</label></th>
									<td>
										<select id="searchApprDocStatus" title="문서상태" name="searchApprDocStatus">
											<option value="">전체</option>
											<option value="1">진행중</option>
											<option value="2">완료</option>
											<option value="3">반려</option>
											<option value="4">회수</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">
										<select id="toggleSearchType">
											<option value="searchApprTitle">
												문서제목
											</option>
											<option value="searchApprContent">
												문서내용
											</option>
										</select>
									</th>
									<td>
										<input id="inputSearchType" type="text" class="w80p" onkeypress="apprSecrchKeyevent(event);" title="문서제목" name="searchApprTitle" value="">
									</td>
									<th scope="row">								
										<label>기안일</label>
									</th>
									<td>
										<input type="text" title="시작일" id="searchStartDate" name="searchStartDate" value="2018.10.30" class="input-datepicker w100" placeholder="시작일">
										<button type="button" class="btn btn-color7 br tbl-inner"><i class="icon calendar"></i></button>
											<span>~</span>
										<input type="text" title="종료일" id="searchEndDate" name="searchEndDate" value="2019.01.30" class="input-datepicker w100" placeholder="종료일">
										<button type="button" class="btn btn-color7 br tbl-inner"><i class="icon calendar"></i></button>
									</td>										
								</tr>
							</tbody>
						</table>
						
						
						<div class="search_btn">
							<button type="button" id="searchApListButton" class="btn btn-color5 br"><i class="fa fa-search fa-fw"></i> 검색</button>
						</div>
					</div>
				</div>
				<!-- search end-->	
	
			    	
				<!-- table-header -->
				<div class="table-header">
					<div class="listinfo">
						<select name="pagePerRecord" title="페이지당 게시글 수">
							<option value="10" selected="selected">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
							<option value="50">50</option>
						</select> 
						<div class="totalnum">전체<span> 2</span></div>													
						<div class="table-search astatus">
							<span><i class="icon progress"></i> 진행중</span>
							<span><i class="icon completion"></i> 완료</span>
							<span><i class="icon reject"></i> 반려</span>
							<span><i class="icon withdraw"></i> 회수</span>
						</div>			
					</div>						
				</div>
				<!-- //table-header -->
						    	
				<!-- content-list approval -->
				<div class="content-list approval">
					<!-- listtable -->
					<div>
						<table class="table table-striped striped02" id="listTable">
							<caption></caption>
							<colgroup>
										<col width="4%">
										<col width="*">
										<col width="13%">
										<col width="13%">
										<col width="7%">
							</colgroup>						
							<thead>
								<tr>
									<th scope="col">
										NO
									</th>
									<th scope="col">
										<a onclick="f_Sort('apprTitle', '');" href="#a">문서제목
											<i class="fa fa-caret-down"><span class="blind">내림차순</span></i>
										</a>
									</th>
										<th scope="col">
											<a onclick="f_Sort('apprReqDate', 'DESC');" href="#a">기안일</a>
											<i class="fa fa-caret-down active"><span class="blind">내림차순</span></i>
										</th>
										<th scope="col">
											<a onclick="f_Sort('apprEndDate', '');" href="#a">완료일</a>
											<i class="fa fa-caret-down"><span class="blind">내림차순</span></i>
										</th>
										<th scope="col">문서상태</th>
								</tr>
							</thead>
							
							<tbody>
								<tr style="background: rgb(249, 249, 249);">
									<td style="background: rgb(249, 249, 249);">
												2
									</td>
									<td class="text-left" style="background: rgb(249, 249, 249);">
										<a href="#a" onclick="getApprDetail('26947824','');" title="테스트11111">테스트11111</a>
										<span class="text-point-b"></span>
									</td>
									<td style="background: rgb(249, 249, 249);">2019.01.16 18:29</td>
									<td style="background: rgb(249, 249, 249);"></td>
									<td style="background: rgb(249, 249, 249);">
										<div class="select2-container ap-status">
											<a class="btn progress" onclick="getViewApprLine(this, '26947824');">
												<span class="select2-category"><i class="icon progress"></i></span><span class="caret"></span>
											</a>
										</div>
									</td>
								</tr>
								<tr style="display:none;" id="apprLineTr26947824_U260222">
									<td colspan="6">
										<div id="26947824_U260222" style="display:none;">
										</div>					
									</td>
								</tr>
								<tr style="background: rgb(249, 249, 249);">
									<td style="background: rgb(255, 255, 255);">
												1
									</td>
									<td class="text-left" style="background: rgb(255, 255, 255);">
										<a href="#a" onclick="getApprDetail('26906959','');" title="협조문 테스트">협조문 테스트</a>
										<span class="text-point-b"></span>
									</td>
									<td style="background: rgb(255, 255, 255);">2019.01.15 22:04</td>
									<td style="background: rgb(255, 255, 255);"></td>
									<td style="background: rgb(255, 255, 255);">
										<div class="select2-container ap-status">
											<a class="btn progress" onclick="getViewApprLine(this, '26906959');">
												<span class="select2-category"><i class="icon progress"></i></span><span class="caret"></span>
											</a>
										</div>
									</td>
								</tr>
								<tr style="display:none;" id="apprLineTr26906959_U260222">
									<td colspan="6">
										<div id="26906959_U260222" style="display:none;">
										</div>					
									</td>
								</tr>
							</tbody>
						</table>
						
						<!-- pagination -->	
							
					<div class="pagination-wrap"><ul class="pagination"><li><a href="javascript:void(0)" class="disabled"><i class="fa fa-chevron-left"></i><i class="fa fa-chevron-left"></i><span class="none">first</span></a></li><li><a href="javascript:void(0)" class="disabled"><i class="fa fa-chevron-left"></i><span class="none">previous</span></a></li><li class="active"><a href="javascript:void(0)">1</a></li><li><a href="javascript:void(0)" class="disabled"><i class="fa fa-chevron-right"></i><span class="none">next</span></a></li><li><a href="javascript:void(0)" class="disabled"><i class="fa fa-chevron-right"></i><i class="fa fa-chevron-right"></i><span class="none">last</span></a></li></ul></div><script>pageMoveAction = function(inputName, formId, movePageIndex) { jQuery('input[name=' + inputName + ']', formId).val(movePageIndex); jQuery('input[name=action]', formId).val('pagePerRecord');};</script>
						<input id="pageIndex" name="pageIndex" type="hidden" value="1" title="현재 페이지">
						<!--// pagination -->	
					</div>
					<!-- //listtable -->	
				</div>
				<!-- //content-list approval -->
			<div class="btn-wrap">
				<button type="button" class="btn btn-color5 br" onclick="getApprNew();">등록</button>
			</div>
			<input type="hidden" name="OWASP_CSRFTOKEN" value="HBBI-YW0L-FXCE-F7IU-BSAG-5AQK-08FF-K8HD"></form>	
		</div>
		
		
	</article>
</section>