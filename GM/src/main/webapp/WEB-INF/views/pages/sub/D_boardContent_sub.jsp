<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.spring.gm.vo.MemberVO" %>  
	<section>
		<article>
			<div class="content_header">
				<h2>게시글 상세 페이지</h2>
			</div>
	<table>
		<tr>
			<th style="width:150px;">작성자</th>
				<td>
					${dto.writer}
				</td>
			<th style="width:150px;">조회수</th>
			<td>
				${dto.readcnt}
			</td>
		</tr>
		
		<tr>

				<th style="width:150px;">작성일</th>
				<td>
					<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.getReg_date()}" />
				</td>
		</tr>
		
		<tr>
			<th>글제목</th>
				<td colspan="3" style="width:150px;text-align:left; padding-left:10px;">
					${dto.subject}
				</td>
		</tr>
			<tr>
				<th style="width:150px;">글내용</th>
				<td colspan="3" style="height:300px;text-align:left; padding-left:10px;">
					${dto.content}
				</td>
			</tr>
			
			<tr>
				<th colspan="4">
					<c:if test="${sessionScope.loginInfo.sys_rank == 1}">
						<c:if test="${sessionScope.loginInfo.name == dto.writer}">
							<input type="button" class="inputButton" value="글 수정" onclick="window.location='<c:url value="/pages/D_boardUpdate?boardnum=${dto.boardnum}&pageNum=${pageNum}&num=${num}"/>'">
						</c:if>
							<input type="button" class="inputButton" value="글 삭제" onclick="window.location='<c:url value="/pages/D_boardDeletePro?boardnum=${dto.boardnum}&pageNum=${pageNum}&num=${num}&ref_level=${dto.ref_level}"/>'">
					</c:if>
						<input type="button" class="inputButton" value="답글 쓰기" onclick="window.location='<c:url value="/pages/D_writeForm?boardnum=${dto.boardnum}&num=${num}&ref=${dto.ref}&ref_step=${dto.ref_step}&ref_level=${dto.ref_level}&pageNum=${pageNum}"/>'">
						<input type="button" class="inputButton" value="목록 보기" onclick="window.location='<c:url value="/pages/D_boardList?pageNum=${pageNum}&boardnum=${dto.boardnum}&num=${num}"/>'">
				</th>
			</tr>
		</table>
		
		<table>
			<c:forEach var="r_dtos" items="${r_dtos}">
			<c:if test="${r_dtos.del == 0}">
				<tr>
					<th style="width:150px;">작성자</th>
					<td>${r_dtos.writer}</td>
	
					<th style="width:150px;">내용</th>
					<td>${r_dtos.content}</td>
					
					<th>작성일</th>
					<td>
						<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${r_dtos.reg_date}" />
					</td>

					<td><input type="button" class="inputButton" value="글 수정" onclick="window.location='<c:url value="/pages/D_repleUpdate?boardnum=${r_dtos.boardnum}&pageNum=${pageNum}&num=${num}&number=${number}&replenum=${r_dtos.replenum}&content=${r_dtos.content}"/>'"></td>
					<td><input type="button" class="inputButton" value="글 삭제" onclick="window.location='<c:url value="/pages/D_repleDeletePro?boardnum=${r_dtos.boardnum}&pageNum=${pageNum}&num=${num}&number=${number}&replenum=${r_dtos.replenum}"/>'"></td>
				</tr>
			</c:if>
			</c:forEach>
		</table>
		
	<table>
			<tr>
				<th align="center">
					<!-- 게시글이 있으면 -->
					<c:if test="${cnt > 0}">
						<!-- 처음[◀◀] / 이전블록[◀]  -->
						<c:if test="${startPage > pageBlock}">					
							<a href="<c:url value='/pages/D_boardContent'/>">[◀◀ ]</a>						
							<a href="<c:url value='/pages/D_boardContent?pageNum=${startPage - pageBlock}'/>">[◀ ]</a>
						</c:if>
					
						<!-- 블록내의 페이지 번호 -->
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i != currentPage}">
								<a href="<c:url value='/pages/D_boardContent?pageNum=${i}'/>">[${i}]</a>
							</c:if>
						</c:forEach>					
					
						<!-- 다음 블록[▶] / 끝[▶▶]> -->
						<c:if test="${pageCount > endPage}">					
							<a href="<c:url value='/pages/D_boardContent?pageNum=${startPage + pageBlock}'/>">[▶ ]</a>						
							<a href="<c:url value='/pages/D_boardContent?pageNum=${pageCount}'/>">[▶▶ ] </a>
						</c:if>
				</c:if>
			</th>
		</tr>
</table>


<form action="<c:url value='/pages/D_repleInsertPro'/>" method="post" name="D_repleInsert">
		<input type="hidden" name="boardnum" value="${boardnum}">
		<input type="hidden" name="writer" value="${sessionScope.loginInfo.name}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="number" value="${number}">
		
	<table>
		<tr>
			<th> 작성자 </th>
			<td>
				<%=((MemberVO)request.getSession().getAttribute("loginInfo")).getName() %>
			</td>				
		</tr>
		
		<tr>
			<th> 댓글 </th>
			<td>
				<textarea class="input" rows="10" cols="40" name="content" style="width:270px" placeholder="댓글 내용을 입력하세요!!" word-break:break-all></textarea>
			</td>
		</tr>
		
		<tr>
			<th colspan="2">
				<input class="inputButton" type="submit" value="작성">
				<input class="inputButton" type="reset" value="취소">
			</th>
		</tr>
	</table>
</form>
	</article>
</section>