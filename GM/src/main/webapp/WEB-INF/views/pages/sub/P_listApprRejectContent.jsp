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
			<h2>반려 문서함</h2>
		</div>
		
		<!-- 결재 대기함 게시글 나열 list -->
		<div class="content-wrap responsive pt10">
			<form id="searchForm" method="post" action="P_SearchPaymentTool">
				
				<input type="hidden" name="sel_Payment" value="5">
				
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
								<th scope="row"><label for="searchUserName">기안자</label></th>
								<td><input id="searchUserName" name="searchUserName" value="" type="text" title="기안자" class="w40p"></td>
							</tr>
							<tr>
								<th scope="row">
									<select name="toggleSearchType">
										<option value="subject">
											문서제목
										</option>
										<option value="content">
											문서내용
										</option>
									</select>
								</th>
								<td>
									<input id="inputSearchType" type="text" class="w80p" title="문서제목" name="searchApprTitle" value="">
								</td>
								<th scope="row">								
									<label>배정일</label>
								</th>
								<td>
									<input type="date" title="시작일" id="searchStartDate" name="searchStartDate" value="" placeholder="시작일">
										<span>~</span>
									<input type="date" title="종료일" id="searchEndDate" name="searchEndDate" value="" placeholder="종료일">
								</td>									
							</tr>
						</tbody>
					</table>
					<div class="search_btn">
						<input type="submit" class="btn btn-color5 br" value="검색">
					</div>
				</div>
			</div>
				<!-- search end-->	
	
			    	
				<!-- table-header -->
				<div class="table-header">
					<div class="listinfo">
						<div class="totalnum">전체<span>${cnt }</span>						</div>													
						<div class="table-search astatus">
						</div>			
					</div>						
				</div>
				<!-- //table-header -->
						    	
				<!-- content-list approval -->
				<div class="content-list approval">		
				<!-- listtable -->
				<div>
				<table class="table table-striped " id="listTable">
					<tr>
						<th>순서</th>
						<th>제목</th>
						<th>기안자</th>
						<th>요청일</th>
						<th>만료일</th>
						<th>상태</th>
					</tr>
					<c:if test="${cnt > 0 }">
						<c:forEach var="dto" items="${payment }">
							<tr onclick="window.location='<c:url value='/pages/P_payContentForm?num=${dto.num }&groupid=${dto.groupId }'/>'">
								<th>
									${number}
									<c:set var="number" value="${number-1}"/>
								</th>
								<th>${dto.subject }</th>
								<th>${dto.name }</th>
								<th>${dto.reg_date }</th>
								<th>${dto.deadline }</th>
								<th>${dto.state }</th>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${cnt == 0 }">
						<tr>
							<th colspan="6">문서가 없습니다.</th>
						</tr>
					</c:if>
				</table>
			</form>	
		</div>
		<table>
			<tr>
				<th align="center">
					<!-- 게시글이 있으면 -->
					<c:if test="${cnt > 0}">
						<!-- 처음[◀◀] / 이전블록[◀]  -->
						<c:if test="${startPage > pageBlock}">					
							<a href="<c:url value='/pages/P_listApprTodoView'/>">[◀◀ ]</a>						
							<a href="<c:url value='/pages/P_listApprTodoView?pageNum=${startPage - pageBlock}'/>">[◀ ]</a>
						</c:if>
						
						<!-- 블록내의 페이지 번호 -->
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i != currentPage}">
								<a href="<c:url value='/pages/P_listApprTodoView?pageNum=${i}'/>">[${i}]</a>
							</c:if>
						</c:forEach>					
						
						<!-- 다음 블록[▶] / 끝[▶▶]> -->
						<c:if test="${pageCount > endPage}">					
							<a href="<c:url value='/pages/P_listApprTodoView?pageNum=${startPage + pageBlock}'/>">[▶ ]</a>						
							<a href="<c:url value='/pages/P_listApprTodoView?pageNum=${pageCount}'/>">[▶▶ ] </a>
						</c:if>
					</c:if>
				</th>
			</tr>
		</table>
	</article>
</section>