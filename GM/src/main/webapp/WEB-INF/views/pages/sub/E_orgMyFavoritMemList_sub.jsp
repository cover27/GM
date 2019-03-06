<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section>
	<article>
		<div class="content_header">
			<h2>자주 연락하는 사람 목록</h2>
		</div>
		<div class="content">
			<h3 class="mb10">전체<span class="ml10 cnt">${memfcnt}</span></h3>
			<div class="table_head">
				<table>
					<colgroup>
						<col width="265px;" />
						<col width="265px;" />
						<col width="265px;" />
						<col width="265px;" />
						<col width="265px;" />
						<col width="*" />
					</colgroup>
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>핸드폰</th>
							<th>이메일</th>
							<th>쪽지쓰기</th>
							<th>삭제</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="table_body" style="height: 620px;">
				<table>
					<colgroup>
						<col width="265px;" />
						<col width="265px;" />
						<col width="265px;" />
						<col width="265px;" />
						<col width="265px;" />
						<col width="*" />
					</colgroup>
					<tbody>
						<!-- 구성원이 있으면 -->
						<c:forEach var='mf_dtos' items='${mfe_dtos}'>
							<tr>
								<td>
									${mf_dtos.id}
								</td>
								<td>
									<c:forEach var="mem_dtos" items="${mem_dtos}">
										<c:if test="${mf_dtos.id == mem_dtos.id}">
											${mem_dtos.name}
										</c:if>
									</c:forEach>
								</td>
								<td>
									<c:forEach var="mem_dtos" items="${mem_dtos}">
										<c:if test="${mf_dtos.id == mem_dtos.id}">
											${mem_dtos.tel}
										</c:if>
									</c:forEach>
								</td>
									<td>
									<c:forEach var="mem_dtos" items="${mem_dtos}">
										<c:if test="${mf_dtos.id == mem_dtos.id}">
											${mem_dtos.email_in}
										</c:if>
									</c:forEach>
								</td>
								<td>
									<input type="button" value="쪽지쓰기" onclick="window.location='<c:url value="/pages/S_orgSendMessageForm?id=${mf_dtos.id}"/>'" style="background:#555;">
								</td>
								<td>
									<input type="button" value="맴버 삭제" onclick="window.location='<c:url value="/pages/E_deleteMemberPro?id=${mf_dtos.id}&pageNum=${pageNum}&number=${number}"/>'" style="background:#d3292c;">
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- 페이지 컨트롤 -->
	            <div class="paging">
					<c:if test="${memfcnt > 0}">
					    <c:if test="${startPage > pageBlock}">
					        <a href="<c:url value='/pages/E_departMemberList'/>"><i class="fas fa-angle-double-left"></i></a>
					        <a href="<c:url value='/pages/E_departMemberList?num=${num}&pageNum=${startPage - pageBlock}'/>"><i class="fas fa-angle-left"></i></a>
					    </c:if>
					
					    <c:forEach var="i" begin="${startPage}" end="${endPage}">
					        <c:if test="${i == currentPage}">
					            <span class="thisPage"><b>${i}</b></span>
					        </c:if>
					        <c:if test="${i != currentPage}">
					            <a href="<c:url value='/pages/E_departMemberList?num=${num}&pageNum=${i}'/>">${i}</a>
					        </c:if>
					    </c:forEach>
					
					    <c:if test="${pageCount > endPage}">
					        <a href="<c:url value='/pages/E_departMemberList?num=${num}&pageNum=${startPage + pageBlock}'/>"><i class="fas fa-angle-right"></i></a>
					        <a href="<c:url value='/pages/E_departMemberList?num=${num}&pageNum=${pageCount}'/>"><i class="fas fa-angle-double-right"></i></a>
					    </c:if>
					</c:if>
	            </div>
		</div>
	</article>
</section>