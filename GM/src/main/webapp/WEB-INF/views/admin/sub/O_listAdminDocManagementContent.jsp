<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section>
	<article>
		<div class="content_header">
			<h2>업무 문서 관리</h2>
		</div>
		
		<div class="content">
			<form action="<c:url value='/pages/W_searchTodoTool'/>" method="post">
				<input type="hidden" name="sel_Payment" value="4">
				
				<!-- 관리자 메뉴 - 업무 문서 관리 상단  -->
				<div class="search-wrap">
					<div class="form-group">
						<span>
							<label class="bold5px">요청인<input name="searchUserName" value="" type="text" title="요청인" class="ml10" placeholder="요청인 이름 입력"></label>
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
							<input id="begin" type="date" title="날짜시작" name="searchStartDate" value="">
								<span>~</span>
							<input id="end" type="date" title="날짜끝" name="searchEndDate" value="" >
						</span>
		                <span>
			               <input type="submit" value="검색">
		                </span>
					</div>
				</div>
				<h3>전체<span class="ml10 cnt">${cnt }</span></h3>
			
				<!-- 관리자 메뉴 - 업무 문서 관리 게시글 나열 list -->
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
									<a data-sortcolumn="REGISTERNAME" href="#">등록자</a>
								</th>
								<th scope="col">
									<a data-sortcolumn="INSERTDATE" href="#">등록일</a>
								</th>
								<th scope="col">
									<a data-sortcolumn="DUEDATE" href="#">마감일</a>
								</th>
								<th scope="col">
									<a data-sortcolumn="TODOSTATUS" href="#">업무 처리 상태</a>
								</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="table_body" style="height: 596px;">
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
				                        <td>${dto.name}(${dto.id})</td>
				                        <td>${dto.begin}</td>
				                        <td>${dto.end}</td>
				                        <td>${dto.state}</td>
			                   		</tr>
			                    </c:forEach>
		                    </c:if>
		                    <c:if test="${cnt == 0}">
								<tr>
									<td colspan="6" align="center">업무 문서 내역이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="paging" style="margin-top: 120px;">
					<c:if test="${cnt > 0}">
					    <c:if test="${startPage > pageBlock}">
					        <a href="<c:url value='/admin/W_listAdminDocManagement'/>">[◀◀]</a>
					        <a href="<c:url value='/admin/W_listAdminDocManagement?num=${num}&pageNum=${startPage - pageBlock}'/>">[◀]</a>
					    </c:if>
					
					    <c:forEach var="i" begin="${startPage}" end="${endPage}">
					        <c:if test="${i == currentPage}">
					            <span class="thisPage"><b>${i}</b></span>
					        </c:if>
					        <c:if test="${i != currentPage}">
					            <a href="<c:url value='/admin/W_listAdminDocManagement?num=${num}&pageNum=${i}'/>">${i}</a>
					        </c:if>
					    </c:forEach>
					
					    <c:if test="${pageCount > endPage}">
					        <a href="<c:url value='/admin/W_listAdminDocManagement?num=${num}&pageNum=${startPage + pageBlock}'/>">[▶]</a>
					        <a href="<c:url value='/admin/W_listAdminDocManagement?num=${num}&pageNum=${pageCount}'/>">[▶▶]</a>
					    </c:if>
					</c:if>
	            </div>
	        </form>
        </div>
	</article>
</section>