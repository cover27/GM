<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section>
    <article>
        <div class="content_header">
            <h2>쪽지 전송 목록</h2>
        </div>
        <div class="content">
        	<form action="<c:url value='/admin/D_boardDelPro'/>" method="post" id="boardDel" onsubmit="return delBoard();">
	            <input type="hidden" name="pageNum" value="${pageNum}">
	            <input type="hidden" name="num" value="${num}">
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
								<th>쪽지 제목</th>
								<th>수신자</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>읽음 안읽음 여부</th>
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
								<c:forEach var="dto" items="${g_dtos}">
									<c:if test="${dto.del == 0}">
										<tr>
											<td><input type="checkbox" name="checkRow" value="${dto.num}" /></td>
											<td style="text-align: left; padding-left: 20px;">
												<a href="<c:url value=''/>">
													${dto.subject}
												</a>
											</td>
											<td>${dto.receiver}</td>
											<td><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.receiveDate}" /></td>
											<td></td><!-- 읽음 안읽음 여부만 -->
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
						        <a href="<c:url value='/pages/S_sendMessageList'/>">[◀◀]</a>
						        <a href="<c:url value='/pages/S_sendMessageList?num=${num}&pageNum=${startPage - pageBlock}'/>">[◀]</a>
						    </c:if>
						
						    <c:forEach var="i" begin="${startPage}" end="${endPage}">
						        <c:if test="${i == currentPage}">
						            <span class="thisPage"><b>${i}</b></span>
						        </c:if>
						        <c:if test="${i != currentPage}">
						            <a href="<c:url value='/pages/S_sendMessageList?num=${num}&pageNum=${i}'/>">${i}</a>
						        </c:if>
						    </c:forEach>
						
						    <c:if test="${pageCount > endPage}">
						        <a href="<c:url value='/pages/S_sendMessageList?num=${num}&pageNum=${startPage + pageBlock}'/>">[▶]</a>
						        <a href="<c:url value='/pages/S_sendMessageList?num=${num}&pageNum=${pageCount}'/>">[▶▶]</a>
						    </c:if>
						</c:if>
		            </div>	
				</div>
	            <div class="btnset fright mt10">
	            	<ul>
	            		<li><input type="submit" value="삭제"></li>
	            	</ul>
	            </div>
	        </form>
        </div>
    </article>
</section>
