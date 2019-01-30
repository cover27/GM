<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section>
	<article>
		<div class="content_header">
			<h2>게시판 목록</h2>
		</div>
	<table>
		<tr>
			<th>선택</th>
			<th>번호</th>
			<th>게시판명</th>
		</tr>
	</table>
	
	<table>
		<c:forEach var="dtos" items="${dtos}">
			<tr align="center">
				<td>
					<input type="checkbox" name="check">
				</td>
				
				<td>
					${dtos.num}
				</td>
						
				<td>
					<a href="<c:url value='/pages/D_boardList?num=${dtos.num}'/>">${dtos.b_name}</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<table style="width:1000px" align="center">
				<tr>
					<th align="center">
						<c:if test="${cnt > 0}">
							<c:if test="${startPage > pageBlock}">
								<a href="<c:url value='/pages/D_boardsList'/>">[◀◀]</a>
								<a href="<c:url value='/pages/D_boardsList?pageNum=${startPage - pageBlock}'/>">[◀]</a>
							</c:if>
					
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<span><b>[${i}]</b></span>
								</c:if>
						
								<c:if test="${i != currentPage}">
									<a href="<c:url value='/pages/D_boardsList?pageNum=${i}'/>">[${i}]</a>
								</c:if>						
							</c:forEach>
					
							<c:if test="${pageCount > endPage}">
								<a href="<c:url value='/pages/D_boardsList?pageNum=${startPage + pageBlock}'/>">[▶]</a>
								<a href="<c:url value='/pages/D_boardsList?pageNum=${pageCount}'/>">[▶▶]</a>
							</c:if>
						</c:if>
					</th>
		
					<th>
						<input class="inputButton" type="button" value="삭제">
						<!-- 목록보기 참고하고 삭제할것  -->
						<input class="inputButton" type="button" value="목록보기"
							onclick="window.location=<c:url value='/pages/boardsList?pageNum=${pageNum}'/>">
					</th>
				</tr>
			</table>
	</article>
</section>