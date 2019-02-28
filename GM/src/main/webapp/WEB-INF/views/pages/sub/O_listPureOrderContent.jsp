<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<section>
	<article>
		<div class="content_header">
			<h2>내가 한 업무요청</h2>
		</div>
				<div class="content">
		<!-- 내가 한 업무요청 상단  -->
		<%@ include file="/WEB-INF/views/pages/sub/O_header/O_listPureOrderContentView.jsp" %>
		
		<!-- 내가 한 업무요청 게시글 나열 list -->
				
		            <table class="table table-striped" id="tblList">
		                <caption></caption>
		                <colgroup>
		                    <col style="width: 10%;">
		                    <col style="width: 30%;">
		                    <col style="width: 10%;">
		                    <col style="width: 10%;">
		                    <col style="min-width: 30%;">
		                    <col style="width: 10%;">
		                </colgroup>
		               
		                <thead>
		                    <tr>
		                        <th scope="col"><input id="checkAll" name="" onclick="selectAllTodo()" type="checkbox" value="" title="checkAll"></th>
		                        <th scope="col">
		                            <a data-sortcolumn="subject" href="#">제목</a>
		                        </th>
		                        <th scope="col">담당자</th>
		                        <th scope="col">
		                            <a data-sortcolumn="begin" href="#">요청일</a>
		                        </th>
		                        <th scope="col">
		                            <a data-sortcolumn="end" href="#">마감일</a>
		                        </th>
		                        <th scope="col">
		                            <a data-sortcolumn="state" href="#">상태</a>
		                        </th>
		                    </tr>
		                </thead>
		                
		                
		                <!-- 게시글 나열 list -->
		                <tbody>
			                <c:if test = "${cnt > 0}">
								<c:forEach var="dto" items="${dtos}">
		                            <tr style="background: rgb(249, 249, 249);">
		                                <td>
		                                    <input name="chkid" type="checkbox" title="checkbox" value="26904787" data-status="A1">
		                                </td>
		                                <td class="text-left">
		                                    <div class="ellipsis">
		                                        <a href="<c:url value='/pages/W_readOrderView?todonum=${dto.todonum}'/>">${dto.subject }</a> 
		                                    </div>
		                                </td>
		                                <td>
		                                    <div class="ellipsis" title="">${dto.b_name}</div>
		                                </td>
		                                <td>${dto.begin}</td>
		                                <td>${dto.end}</td>
		                                <td>
		                                    <a href="javascript:void(0);" onclick="todoStatusPopup('26904787', '테스트', 'A1', '0', '');">
		                                    	<span class="todo-cate-box1 color2">${dto.state}</span>
		                                    </a>
		                                </td>
		                            </tr>
		                        </c:forEach>
		                    </c:if>
                            
                            <!-- 게시글이 없으면 -->
							<c:if test="${cnt == 0}">
								<tr>
									<td colspan="6" align="center">업무 요청을 한 내역이 없습니다.</td>
								</tr>
							</c:if>
                            
                		</tbody>
		            </table>
		            
		            
		            
		            
		            <!-- 게시물 아래 <<, >> 버튼 및 업무등록, 완료 버튼 -->
		            <div class="pagination-wrap">
		            	<table>
							<tr>
								<th align="center">
									<!-- 게시글이 있으면 -->
									<c:if test="${cnt > 0}">
										<!-- 처음[◀◀] / 이전블록[◀]  -->
										<c:if test="${startPage > pageBlock}">
											<a href="<c:url value='/pages/W_listPureOrderView'/>">[◀◀]</a>
											<a href="<c:url value='/pages/W_listPureOrderView?pageNum=${endPage - pageBlock}'/>">[◀]</a>
										</c:if>
		
										<!-- 중간에 들어갈 페이지 -->
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i==currentPage}">
												<span><b>[${i}]</b></span>
											</c:if>
											<c:if test="${i!=currentPage}">
												<a href="<c:url value='/pages/W_listPureOrderView?pageNum=${i}'/>">[${i}]</a>
											</c:if>
										</c:forEach>
		
										<!-- 다음[▶] / 마지막[▶▶]  -->
										<c:if test="${pageCount > endPage}">
											<a href="<c:url value='/pages/W_listPureOrderView?pageNum=${startPage + pageBlock}'/>">[▶]</a>
											<a href="<c:url value='/pages/W_listPureOrderView?pageNum=${pageCount}'/>">[▶▶]</a>
										</c:if>
									</c:if>
								</th>
							</tr>
						</table>
		            </div>
		            
		            <div class="btn-wrap">
		                <button type="button" class="btn btn-color5 br" onclick="window.location='<c:url value='/pages/W_createSelfTaskView'/>'">업무 등록</button>
		                <button type="button" class="btn btn-color7 br" onclick="autoComplete();">업무완료</button>
		                <button type="button" class="btn btn-color7 br" onclick="deleteTask();">삭제</button>
		            </div>
	        </div>
		
	</article>
</section>