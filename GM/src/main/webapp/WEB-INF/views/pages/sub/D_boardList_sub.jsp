<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section>
	<article>
		<div class="content_header">
			<h2>게시글 목록</h2>
		</div>		
	<table>
		<tr>
			<th colspan="6" align="center" style="height:25px">
				<span>게시판 번호 : ${num}</span>&nbsp;글목록&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<c:url value='/pages/D_writeForm?num=${num}&pageNum=${pageNum}'/>"> 글쓰기 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</th>
		</tr>
		
		<tr>
			<th style="width:15%">(ref/r_step/r_level) </th>
			<th style="width:25%"> 글제목 </th>
			<th style="width:10%"> 작성자 </th>
			<th style="width:15%"> 작성일 </th>
			<th style="width:5%"> 조회수 </th>	
		</tr>	
		
		<!-- 게시글이 있으면 -->
		<c:if test="${cnt > 0}">
			<!-- items="${dtos} : ArrayList<BoardVO> : 게시글 목록   
			     var="dto" : 작은바구니 : 게시글 1건
			     ==> 게시글목록에 5건이 있다면 5회(ArrayList에서 꺼내서 dto에 담은 다음 출력)
			 -->
		
			<c:forEach var="dto" items="${dtos}">
				<c:if test="${dto.del == 0}">
					<tr>
						<td>
							<c:set var="number" value="${number-1}" />
							(${dto.ref} / ${dto.ref_step} / ${dto.ref_level})
						</td>
						
						<td>
							<c:if test="${dto.ref_level > 1}">
								<c:set var="wid" value="${(dto.ref_level-1) * 10}" />
							</c:if>		
														
							<c:if test="${dto.ref_level > 0}"></c:if>
												
							<c:if test="${dto.readcnt > 10}"></c:if>
					
							<a href="<c:url value='/pages/D_boardContent?boardnum=${dto.boardnum}&num=${num}&ref_level=${dto.ref_level}&pageNum=${pageNum}&number=${number+1}'/>"> ${dto.subject}</a>
							[${dto.re_num}]
						</td>
					
						<td>
							${dto.writer}
						</td>
					
						<td>
							<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.reg_date}" />
						</td>
					
						<td>
							${dto.readcnt}
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</c:if>
		
		
		<!-- 게시글이 없으면 -->
		<c:if test="${cnt == 0}">
			<tr>
				<td colspan="6" align="center">
					게시글이 없습니다. 글을 작성해주세요.!!
				</td>
			</tr>
		</c:if>
	</table>
	
	<!-- 페이지 컨트롤 -->	
<c:if test="${dto.del == 0}">
	<table>
		<tr>
			<th align="center">
				<!-- 게시글이 있으면 -->
				<c:if test="${cnt > 0}">
					<!-- 처음[◀◀] / 이전블록[◀]  -->
					<c:if test="${startPage > pageBlock}">					
						<a href="<c:url value='/pages/D_boardList'/>">[◀◀ ]</a>						
						<a href="<c:url value='/pages/D_boardList?pageNum=${startPage - pageBlock}'/>">[◀ ]</a>
					</c:if>
					
					<!-- 블록내의 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage}">
							<a href="<c:url value='/pages/D_boardList?pageNum=${i}'/>">[${i}]</a>
						</c:if>
					</c:forEach>					
					
					<!-- 다음 블록[▶] / 끝[▶▶]> -->
					<c:if test="${pageCount > endPage}">					
						<a href="<c:url value='/pages/D_boardList?pageNum=${startPage + pageBlock}'/>">[▶ ]</a>						
						<a href="<c:url value='/pages/D_boardList?pageNum=${pageCount}'/>">[▶▶ ] </a>
					</c:if>
				</c:if>
			</th>
		</tr>
	</table>
	</c:if>
	</article>
</section>