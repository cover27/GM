<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
//날짜 예외처리 방법
function lastDate(){
	var lastD = $('#begin').val();
	$('#end').attr("min", lastD);
}
function firstDate(){
	var firstD = $('#end').val();
	$('#begin').attr("max", firstD);
}
</script>

<section>
	<article>
		<div class="content_header">
			<h2>업무완료함</h2>
		</div>
		
		<div class="content">
			<form action="<c:url value='/pages/W_searchTodoTool'/>" method="post">
				<input type="hidden" name="sel_Payment" value="3">
				<!-- 업무완료함에서 쓰이는 상단 -->
				<div class="search-wrap">
					<div class="form-group">
						<span>
							<label class="bold5px">보고자<input name="searchUserName" value="" type="text" title="보고자" class="ml10" placeholder="보고자 이름 입력"></label>
						</span>
						<span>
							<select name="toggleSearchType" title="검색타입">
		                        <option value="subject">업무제목</option>
		                        <option value="content">업무내용</option>
							</select>
						</span>
	                    <span>
	                    	<input name="searchApprTitle" value="" type="text" title="문서제목" placeholder="검색어">
	                    </span>	
						<span>
							<input id="begin" type="date" title="날짜시작" onchange="lastDate()" max="firstD" name="searchStartDate" value="">
								<span>~</span>
							<input id="end" type="date" title="날짜끝" onchange="firstDate()" min="lastD" name="searchEndDate" value="" >
						</span>
		                <span>
			               <input type="submit" value="검색">
		                </span>
					</div>
				</div>
				<h3>전체<span class="ml10 cnt">${cnt }</span></h3>
				
				<!-- 업무완료함 게시글 나열 list -->
				<div class="table_head">
					<table>
						<colgroup>
							<col width="700px" />
							<col width="200px" />
							<col width="200px" />
							<col width="200px" />
							<col width="*" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">
									<a data-sortcolumn="TITLE" href="#">제목</a>
								</th>
								<th scope="col">
									<a data-sortcolumn="REGISTERNAME" href="#">담당자</a>
								</th>
								<th scope="col">
									<a data-sortcolumn="INSERTDATE" href="#">요청일</a>
								</th>
								<th scope="col">
									<a data-sortcolumn="DUEDATE" href="#">마감일</a>
								</th>
								<th scope="col">
									<a data-sortcolumn="TODOSTATUS" href="#">상태</a>
								</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="table_body" style="height: 551px;">
					<table>
						<colgroup>
							<col width="700px" />
							<col width="200px" />
							<col width="200px" />
							<col width="200px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<c:if test = "${cnt > 0}">
								<c:forEach var="dto" items="${dtos}">
		                            <tr>
		                                <td style="text-align: left; padding-left: 20px;">${dto.subject}</td>
		                                <td>${dto.b_name}</td>
		                                <td>${dto.begin}</td>
		                                <td>${dto.end}</td>
		                                <td>${dto.state}</td>
		                            </tr>
		                        </c:forEach>
		                    </c:if>
		                            
                            
                            <c:if test="${cnt == 0}">
								<tr>
									<td colspan="6" align="center">업무 요청을 한 내역이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
		        <div class="paging">
					<c:if test="${cnt > 0}">
					    <c:if test="${startPage > pageBlock}">
					        <a href="<c:url value='/pages/W_listTodoReportView'/>"><i class="fas fa-angle-double-left"></i></a>
					        <a href="<c:url value='/pages/W_listTodoReportView?num=${num}&pageNum=${startPage - pageBlock}'/>"><i class="fas fa-angle-left"></i></a>
					    </c:if>
					
					    <c:forEach var="i" begin="${startPage}" end="${endPage}">
					        <c:if test="${i == currentPage}">
					            <span class="thisPage"><b>${i}</b></span>
					        </c:if>
					        <c:if test="${i != currentPage}">
					            <a href="<c:url value='/pages/W_listTodoReportView?num=${num}&pageNum=${i}'/>">${i}</a>
					        </c:if>
					    </c:forEach>
					
					    <c:if test="${pageCount > endPage}">
					        <a href="<c:url value='/pages/W_listTodoReportView?num=${num}&pageNum=${startPage + pageBlock}'/>"><i class="fas fa-angle-right"></i></a>
					        <a href="<c:url value='/pages/W_listTodoReportView?num=${num}&pageNum=${pageCount}'/>"><i class="fas fa-angle-double-right"></i></a>
					    </c:if>
					</c:if>
	            </div>	
	        </form>
		</div>
			
			
			
	</article>
</section>