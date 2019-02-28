<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section>
    <article>
        <div class="content_header">
            <h2>공지사항</h2>
        </div>
        <div class="content">
        	<form action="<c:url value='#'/>" method="post" id="boardDel" onsubmit="return delBoard();">
	            <input type="hidden" name="pageNum" value="${pageNum}">
	            <div class="table_head">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="*" />
							<col width="200px" />
							<col width="100px" />
							<col width="300px" />
						</colgroup>
						<thead>
							<tr>
								<th>순서</th>
								<th>글제목</th>
								<th>작성자</th>
								<th>조회수</th>
								<th>작성일</th>
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
							<col width="100px" />
							<col width="300px" />
						</colgroup>
						<tbody>
							<c:if test="${cnt > 0}">
								<c:forEach var="dto" items="${noticeList}">
									<tr>
										<td>${number} <c:set var="number" value="${number-1}" /></td>
										<td>${dto.subject }</td>
										<td>${dto.writer }</td>
										<td>${dto.readcnt }</td>
										<td>${dto.reg_date }</td>
									</tr>
								</c:forEach>
							</c:if>
							<!-- 게시글이 없으면 -->
							<c:if test="${cnt == 0}">
								<tr>
									<td colspan="5" align="center">공지사항이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<!-- 페이지 컨트롤 -->
		            <div class="paging">
						<c:if test="${cnt > 0}">
						    <c:if test="${startPage > pageBlock}">
						        <a href="<c:url value='/pages/K_noticeBoard'/>">[◀◀]</a>
						        <a href="<c:url value='/pages/K_noticeBoard?pageNum=${startPage - pageBlock}'/>">[◀]</a>
						    </c:if>
						
						    <c:forEach var="i" begin="${startPage}" end="${endPage}">
						        <c:if test="${i == currentPage}">
						            <span class="thisPage"><b>${i}</b></span>
						        </c:if>
						        <c:if test="${i != currentPage}">
						            <a href="<c:url value='/pages/K_noticeBoard?pageNum=${i}'/>">${i}</a>
						        </c:if>
						    </c:forEach>
						
						    <c:if test="${pageCount > endPage}">
						        <a href="<c:url value='/pages/K_noticeBoard?pageNum=${startPage + pageBlock}'/>">[▶]</a>
						        <a href="<c:url value='/pages/K_noticeBoard?pageNum=${pageCount}'/>">[▶▶]</a>
						    </c:if>
						</c:if>
		            </div>	
				</div>
				<c:if test="${sys_rank == 9 }">
		            <div class="btnset fright mt10">
		            	<ul>
		            		<li><input type="button" value="글쓰기" onclick="window.location='<c:url value="/master/K_noticeWrite" />'" style="background:#d3292c !important;"></li>
		            	</ul>
		            </div>
		        </c:if>
	        </form>
        </div>
    </article>
</section>
