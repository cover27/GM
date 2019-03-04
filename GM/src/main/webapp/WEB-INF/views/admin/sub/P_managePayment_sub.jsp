<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function movepage(pageNum){
		var search = 0;
		if(!document.searchForm.searchUserName.value){
			search = 1;
		} else if(!document.searchForm.retire.value){
			search = 1;
		} else if(!document.searchForm.searchApprTitle.value){
			search = 1;
		} else if(!document.searchForm.searchStartDate.value){
			search = 1;
		} else if(!document.searchForm.searchEndDate.value){
			search = 1;
		} 
		
		window.location="<c:url value='/admin/P_managePayment?pageNum='/>"+pageNum+"&search="+search;
	}
</script>
<style>
	.deletedContent {
	    position: relative;
	    top: 2px;
	    left: 2px;
	    width: 14px;
	    height: 14px;
	}
</style>
<section>
	<article>
		<div class="content_header">
			<h2>결재문서관리</h2>
		</div>
		
		<!-- 결재 대기함 게시글 나열 list -->
		<div class="content">
			<form name="searchForm" method="post" action="<c:url value='/pages/P_SearchPaymentTool' />">
				<input type="hidden" name="sel_Payment" value="7">
				
				<!-- search start-->
				<div class="search-wrap">
					<div class="form-group">
						<span>
							<label>
								<span class="bold5px">기안자</span>
								<input name="searchUserName" value="${sessionScope.searchMap.searchUserName }" type="text" title="기안자" class="ml10">
							</label>
						</span>
						<span>
							<select name="toggleSearchType">
								<c:if test="${sessionScope.searchMap.toggleSearchType != 'content'}">
									<option value="subject" selected>
										문서제목
									</option>
									<option value="content">
										문서내용
									</option>
								</c:if>
								<c:if test="${sessionScope.searchMap.toggleSearchType == 'content'}">
									<option value="subject">
										문서제목
									</option>
									<option value="content" selected>
										문서내용
									</option>
								</c:if>
							</select>
						</span>
						<span><input type="text" title="문서제목" name="searchApprTitle" value="${sessionScope.searchMap.searchApprTitle }"></span>
						<span>
							<label>
								<span class="bold5px ml50">배정일</span>
								<input type="date" title="시작일" name="searchStartDate" value="${sessionScope.searchMap.searchStartDate }" placeholder="시작일" class="ml10">
							</label>
								<span>~</span>
							<input type="date" title="종료일" name="searchEndDate" value="${sessionScope.searchMap.searchEndDate }" placeholder="종료일">
						</span>
						<span>
							<label>
								<span class="bold5px ml50">삭제글</span>
								<c:if test="${sessionScope.searchMap.retire != 1}">
									<input type="checkbox" name="retire" value="1" class="deletedContent">
								</c:if>
								<c:if test="${sessionScope.searchMap.retire == 1}">
									<input type="checkbox" name="retire" value="1" checked class="deletedContent">
								</c:if>
							</label>
						</span>
						<span class="ml30"><input type="submit" value="검색"></span>
					</div>
				</div>
				<!-- search end-->	
	
			    <h3>전체<span class="ml10 cnt">${cnt }</span></h3>
				<div class="table_head">
					<table>
						<colgroup>
						    <col width="80px">
						    <col width="600px">
						    <col width="200px">
						    <col width="250px">
						    <col width="250px">
						    <col width="*">
						</colgroup>
						<thead>
							<tr>
								<th>순서</th>
								<th>제목</th>
								<th>기안자</th>
								<th>요청일</th>
								<th>만료일</th>
								<th>상태</th>
							</tr>
						</thead>
					</table>
				</div>
				<!-- //table-header -->
				
				<div class="table_body">
					<table>
						<colgroup>
						    <col width="80px">
						    <col width="600px">
						    <col width="200px">
						    <col width="250px">
						    <col width="250px">
						    <col width="*">
						</colgroup>
						<tbody>
							<c:if test="${cnt > 0 }">
								<c:forEach var="dto" items="${payment }">
									<tr onclick="window.location='<c:url value='/admin/P_payContentForm?num=${dto.num }&groupid=${dto.groupId }'/>'">
										<td>
											${number}
											<c:set var="number" value="${number-1}"/>
										</td>
										<td style="text-align: left; padding-left: 20px;">${dto.subject }</td>
										<td>${dto.name }</td>
										<td>${dto.reg_date }</td>
										<td>${dto.deadline }</td>
										<td>${dto.state }</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${cnt == 0 }">
								<tr>
									<td colspan="6">문서가 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</form>
			<div class="paging">
				<c:if test="${cnt > 0}">
					<c:if test="${startPage > pageBlock}">					
						<a href="javascript:movepage(1)"><i class="fas fa-angle-double-left"></i></a>						
						<a href="javascript:movepage('${startPage - pageBlock}')"><i class="fas fa-angle-left"></i></a>
					</c:if>
					
					<!-- 블록내의 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span class="thisPage"><b>${i}</b></span>
						</c:if>
						<c:if test="${i != currentPage}">
							<a href="javascript:movepage('${i}')">${i}</a>
						</c:if>
					</c:forEach>					
					<c:if test="${pageCount > endPage}">					
						<a href="javascript:movepage('${startPage + pageBlock}')"><i class="fas fa-angle-right"></i></a>						
						<a href="javascript:movepage('${pageCount}')"><i class="fas fa-angle-double-right"></i></a>
					</c:if>
				</c:if>
			</div>
		</div>
	</article>
</section>