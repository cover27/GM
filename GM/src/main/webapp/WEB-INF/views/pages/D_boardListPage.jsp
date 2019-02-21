<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<div class="table_body">
		<table>
			<colgroup>
				<col width="100px" />
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
								<td><input type="checkbox" name="checkRow" value="${dto.boardnum}" /></td>
								<td>
									${dto.ref}
								</td>
								<td style="text-align: left; padding-left: 20px;">
									<c:if test="${dto.ref_level >= 1}">
										<c:set var="wid" value="${(dto.ref_level-1) * 10}" />
										<i class="fa fa-reply fa-rotate-180"></i>
									</c:if>
									<c:if test="${dto.ref_level > 0}"></c:if>
									<c:if test="${dto.readcnt > 10}"></c:if>
									<a href="<c:url value='/pages/D_boardContent?boardnum=${dto.boardnum}&num=${num}&ref_level=${dto.ref_level}&pageNum=${pageNum}&number=${number+1}'/>">
										${dto.subject}
									</a>
									[${dto.re_num}]
								</td>
								<td>${dto.writer}</td>
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
			<script>alert('${cnt}')</script>
			<c:if test="${cnt > 0}">
				<c:if test="${startPage > pageBlock}">
					<a href="<c:url value='/pages/D_boardList'/>">[◀◀]</a>
					<a
						href="<c:url value='/pages/D_boardList?pageNum=${startPage - pageBlock}&num=${num}'/>">[◀]</a>
				</c:if>

				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span><b>[${i}]</b></span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a href="#" onclick="page_go('${i}', '${num}')">[${i}]</a>
					</c:if>
				</c:forEach>

				<c:if test="${pageCount > endPage}">
					<a
						href="<c:url value='/pages/D_boardList?pageNum=${startPage + pageBlock}&num=${num}'/>">[▶]</a>
					<a
						href="<c:url value='/pages/D_boardList?pageNum=${pageCount}&num=${num}'/>">[▶▶]</a>
				</c:if>
			</c:if>
		</div>
	</div>
</body>
</html>