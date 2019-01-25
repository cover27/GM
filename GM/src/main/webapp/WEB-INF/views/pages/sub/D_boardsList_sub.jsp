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
			<th>번호</th>
			<th>게시판명</th>
		</tr>
	</table>
	<table>
		<c:forEach var="dtos" items="${dtos}">
			<tr align="center">
				<td>
					${dto.num}
				</td>
						
				<td>
					${dto.b_name}
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<table style="width:1000px" align="center">
				<tr>
					<th align="center">
						<c:if test="${cnt > 0}">
							<c:if test="${startPage > pageBlock}">
								<a href="D_boardsList">[◀◀]</a>
								<a href="D_boardsList?pageNum=${startPage - pageBlock}">[◀]</a>
							</c:if>
					
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<span><b>[${i}]</b></span>
								</c:if>
						
								<c:if test="${i != currentPage}">
									<a href="D_boardsList?pageNum=${i}">[${i}]</a>
								</c:if>						
							</c:forEach>
					
							<c:if test="${pageCount > endPage}">
								<a href="D_boardsList?pageNum=${startPage + pageBlock}">[▶]</a>
								<a href="D_boardsList?pageNum=${pageCount}">[▶▶]</a>
							</c:if>
						</c:if>
					</th>
				</tr>
			</table>
	</article>
</section>