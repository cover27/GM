<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">

// 체크박스 전체선택
function allCheck(){
      if( $("#th_checkAll").is(':checked') ){
        $("input[name=checkRow]").prop("checked", true);
      }else{
        $("input[name=checkRow]").prop("checked", false);
      }
}

//삭제할거 정보이전
function delBoard(){
	var god = confirm("삭제하시겠습니까?");
	if(god){
		window.location ="<c:url value='/admin/D_boardDelPro'/>"
		document.getElementById('boardDel').submit();
	}
}

/*	페이징 용도로 사용하려다가 버린 ajax 
function page_go(i, num) {
	alert("게시판번호 : "+num);
	$.ajax({
		type : "POST",
		data : {
			"pageNum" : i,
			"num" : num,
		},
		url : "${pageContext.request.contextPath}/pages/D_boardListPage",
		success : function(result) {
			alert("성공");
			$(".table_body").html(result);
		},
		error : function() {
			alert("게시판 로딩이 실패하였습니다.");
		}
	});
}
 */
</script>
<section>
    <article>
        <div class="content_header">
            <h2>게시글 목록</h2>
        </div>
        <div class="content">
        	<h3 class="mb10">전체<span class="ml10 cnt">${cnt}</span></h3>
        	<form action="<c:url value='/admin/D_boardDelPro'/>" method="post" id="boardDel" onsubmit="return delBoard();">
	            <input type="hidden" name="pageNum" value="${pageNum}">
	            <input type="hidden" name="num" value="${num}">
	            <c:if test="${sessionScope.loginInfo.sys_rank == 1}">
		            <div class="table_head">
						<table>
							<colgroup>
								<col width="100px" />
								<col width="*" />
								<col width="200px" />
								<col width="300px" />
								<col width="100px" />
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="allCheck()" /></th>
									<th>글제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="table_body">
						<table>
							<colgroup>
								<col width="100px" />
								<col width="*" />
								<col width="200px" />
								<col width="300px" />
								<col width="100px" />
							</colgroup>
							<tbody>
								<c:if test="${cnt > 0}">
									<c:forEach var="dto" items="${dtos}">
										<c:if test="${dto.del == 0}">
											<tr>
												<td>
													<input type="checkbox" name="checkRow" value="${dto.boardnum}" />
												</td>
												<td style="text-align: left; padding-left: 20px;">
													<c:if test="${dto.ref_level >= 1}">
														<c:set var="wid" value="${(dto.ref_level-1) * 10}" />
														<i class="fa fa-reply fa-rotate-180 ml20"></i>
													</c:if>
													<c:if test="${dto.ref_level > 0}"></c:if>
													<c:if test="${dto.readcnt > 10}"></c:if>
													<a href="<c:url value='/pages/D_boardContent?num=${num}&boardnum=${dto.boardnum}&ref_level=${dto.ref_level}&pageNum=${pageNum}&number=${number+1}'/>">
														${dto.subject}
													</a>
													<c:if test="${dto.re_num != 0}">
														<span class="replycnt">${dto.re_num}</span>
													</c:if>
												</td>
													<td>
														<c:forEach var="dtos" items="${b_dtos}">
															<c:if test="${dto.num == dtos.num}">
															<c:if test="${dtos.anon == 0}">														
																${dto.writer}
															</c:if>
															</c:if>
														</c:forEach>
														
														<c:forEach var="dtos" items="${b_dtos}">
															<c:if test="${dto.num == dtos.num}">
															<c:if test="${dtos.anon != 0}">
																************
															</c:if>
															</c:if>
														</c:forEach>														
														
													</td>
												<td><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.reg_date}" /></td>
												<td>${dto.readcnt}</td>
											</tr>
										</c:if>
										<input type="hidden" name="nums" value="${dto.num}">
									</c:forEach>
								</c:if>
								<!-- 게시글이 없으면 -->
								<c:if test="${cnt == 0}">
									<tr>
										<td colspan="6" align="center">게시글이 없습니다. 글을 작성해주세요.!!</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						<!-- 페이지 컨트롤 -->
			            <div class="paging">
							<c:if test="${cnt > 0}">
							    <c:if test="${startPage > pageBlock}">
							        <a href="<c:url value='/pages/D_boardList'/>"><i class="fas fa-angle-double-left"></i></a>
							        <a href="<c:url value='/pages/D_boardList?num=${num}&pageNum=${startPage - pageBlock}'/>"><i class="fas fa-angle-left"></i></a>
							    </c:if>
							
							    <c:forEach var="i" begin="${startPage}" end="${endPage}">
							        <c:if test="${i == currentPage}">
							            <span class="thisPage"><b>${i}</b></span>
							        </c:if>
							        <c:if test="${i != currentPage}">
							            <a href="<c:url value='/pages/D_boardList?num=${num}&pageNum=${i}'/>">${i}</a>
							        </c:if>
							    </c:forEach>
							
							    <c:if test="${pageCount > endPage}">
							        <a href="<c:url value='/pages/D_boardList?num=${num}&pageNum=${startPage + pageBlock}'/>"><i class="fas fa-angle-right"></i></a>
							        <a href="<c:url value='/pages/D_boardList?num=${num}&pageNum=${pageCount}'/>"><i class="fas fa-angle-double-right"></i></a>
							    </c:if>
							</c:if>
			            </div>	
					</div>
	            </c:if>
	            <c:if test="${sessionScope.loginInfo.sys_rank != 1}">
	            	<div class="table_head">
						<table>
							<colgroup>
								<col width="*" />
								<col width="200px" />
								<col width="300px" />
								<col width="100px" />
							</colgroup>
							<thead>
								<tr>
									<th>글제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="table_body">
						<table>
							<colgroup>
								<col width="*" />
								<col width="200px" />
								<col width="300px" />
								<col width="100px" />
							</colgroup>
							<tbody>
								<c:if test="${cnt > 0}">
									<c:forEach var="dto" items="${dtos}">
										<c:if test="${dto.del == 0}">
											<tr>
												<td style="text-align: left; padding-left: 20px;">
													<c:if test="${dto.ref_level >= 1}">
														<c:set var="wid" value="${(dto.ref_level-1) * 10}" />
														<i class="fa fa-reply fa-rotate-180 ml20"></i>
													</c:if>
													<c:if test="${dto.ref_level > 0}"></c:if>
													<c:if test="${dto.readcnt > 10}"></c:if>
													<a href="<c:url value='/pages/D_boardContent?num=${num}&boardnum=${dto.boardnum}&ref_level=${dto.ref_level}&pageNum=${pageNum}&number=${number+1}'/>">
														${dto.subject}
													</a>
													<c:if test="${dto.re_num != 0}">
														<span class="replycnt">${dto.re_num}</span>
													</c:if>
												</td>
													<td>
														<c:forEach var="dtos" items="${b_dtos}">
															<c:if test="${dto.num == dtos.num}">
															<c:if test="${dtos.anon == 0}">														
																${dto.writer}
															</c:if>
															</c:if>
														</c:forEach>
														
														<c:forEach var="dtos" items="${b_dtos}">
															<c:if test="${dto.num == dtos.num}">
															<c:if test="${dtos.anon != 0}">
																************
															</c:if>
															</c:if>
														</c:forEach>														
														
													</td>
												<td><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.reg_date}" /></td>
												<td>${dto.readcnt}</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
								<!-- 게시글이 없으면 -->
								<c:if test="${cnt == 0}">
									<tr>
										<td colspan="6" align="center">게시글이 없습니다. 글을 작성해주세요.!!</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						<!-- 페이지 컨트롤 -->
			            <div class="paging">
							<c:if test="${cnt > 0}">
							    <c:if test="${startPage > pageBlock}">
							        <a href="<c:url value='/pages/D_boardList'/>"><i class="fas fa-angle-double-left"></i></a>
							        <a href="<c:url value='/pages/D_boardList?num=${num}&pageNum=${startPage - pageBlock}'/>"><i class="fas fa-angle-left"></i></a>
							    </c:if>
							
							    <c:forEach var="i" begin="${startPage}" end="${endPage}">
							        <c:if test="${i == currentPage}">
							            <span class="thisPage"><b>${i}</b></span>
							        </c:if>
							        <c:if test="${i != currentPage}">
							            <a href="<c:url value='/pages/D_boardList?num=${num}&pageNum=${i}'/>">${i}</a>
							        </c:if>
							    </c:forEach>
							
							    <c:if test="${pageCount > endPage}">
							        <a href="<c:url value='/pages/D_boardList?num=${num}&pageNum=${startPage + pageBlock}'/>"><i class="fas fa-angle-right"></i></a>
							        <a href="<c:url value='/pages/D_boardList?num=${num}&pageNum=${pageCount}'/>"><i class="fas fa-angle-double-right"></i></a>
							    </c:if>
							</c:if>
			            </div>	
					</div>
	            </c:if>
	            <div class="btnset fright mt10">
	            	<ul>
	            		<li><input type="button" value="글쓰기" onclick="window.location='<c:url value="/pages/D_writeForm?num=${num}&pageNum=${pageNum}" />'" style="background:#d3292c !important;"></li>
	            		<c:if test="${sessionScope.loginInfo.sys_rank == 1}">
	            			<li><input type="submit" value="삭제"></li>
	            		</c:if>
	            	</ul>
	            </div>
	        </form>
        </div>
    </article>
</section>
