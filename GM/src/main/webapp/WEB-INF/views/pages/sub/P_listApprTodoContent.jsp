<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
//날짜 예외처리 방법
function lastDate(){
	var lastD = $('#searchStartDate').val();
	$('#searchEndDate').attr("min", lastD);
}
function firstDate(){
	var firstD = $('#searchEndDate').val();
	$('#searchStartDate').attr("max", firstD);
}
</script>

<section>
	<article>
		<div class="content_header">
			<h2>결재 대기함</h2>
		</div>

		<!-- 결재 대기함 게시글 나열 list -->
		<div class="content">
			<form method="post" action="P_SearchPaymentTool">

				<input type="hidden" name="sel_Payment" value="2">

				<!-- search start-->
				<div class="search-wrap">
					<div class="form-group">
						<span>
							<label class="bold5px">기안자<input name="searchUserName" value="" type="text" title="기안자" class="ml10" placeholder="기안자의 이름 입력"></label>
						</span>
						<span>
							<select name="toggleSearchType">
								<option value="subject">문서제목</option>
								<option value="content">문서내용</option>
							</select>
						</span>
						<span><input type="text" title="문서제목" name="searchApprTitle" value="" placeholder="문서제목 입력"></span>
						<span>
							<label class="bold5px ml50">배정일<input type="date" id="searchStartDate" onchange="lastDate()" max="firstD" title="시작일" name="searchStartDate" value="" placeholder="시작일" class="ml10"></label>
							<span>~</span>
							<input type="date" title="종료일" id="searchEndDate" onchange="firstDate()" min="lastD" name="searchEndDate" value="" placeholder="종료일">
						</span>
						<span><input type="submit" value="검색"></span>
					</div>
				</div>
				<!-- search end-->

				<h3>전체<span class="ml10 cnt">${cnt }</span></h3>
				<!-- table-header -->
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

				<!-- content-list approval -->
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
									<tr onclick="window.location='<c:url value='/pages/P_payContentForm?num=${dto.num }&groupid=${dto.groupId }'/>'">
										<td>${number} <c:set var="number" value="${number-1}" /></td>
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
									<th colspan="6">문서가 없습니다.</th>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
				
				<div class="paging">
					<c:if test="${cnt > 0}">
					    <c:if test="${startPage > pageBlock}">
					        <a href="<c:url value='/pages/P_listApprTodoView'/>"><i class="fas fa-angle-double-left"></i></a>
					        <a href="<c:url value='/pages/P_listApprTodoView?num=${num}&pageNum=${startPage - pageBlock}'/>"><i class="fas fa-angle-left"></i></a>
					    </c:if>
					
					    <c:forEach var="i" begin="${startPage}" end="${endPage}">
					        <c:if test="${i == currentPage}">
					            <span class="thisPage"><b>${i}</b></span>
					        </c:if>
					        <c:if test="${i != currentPage}">
					            <a href="<c:url value='/pages/P_listApprTodoView?num=${num}&pageNum=${i}'/>">${i}</a>
					        </c:if>
					    </c:forEach>
					
					    <c:if test="${pageCount > endPage}">
					        <a href="<c:url value='/pages/P_listApprTodoView?num=${num}&pageNum=${startPage + pageBlock}'/>"><i class="fas fa-angle-right"></i></a>
					        <a href="<c:url value='/pages/P_listApprTodoView?num=${num}&pageNum=${pageCount}'/>"><i class="fas fa-angle-double-right"></i></a>
					    </c:if>
					</c:if>
	            </div>	
			</form>
		</div>
		
	</article>
</section>