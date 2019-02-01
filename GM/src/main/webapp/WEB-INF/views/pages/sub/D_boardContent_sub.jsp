<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<section>
		<article>
			<div class="content_header">
				<h2>게시글 상세 페이지</h2>
			</div>
	<table>
		<tr>
			<th style="width:150px;">글번호</th>
			<td>
				${dto.boardnum}
			</td>
			<th style="width:150px;">조회수</th>
			<td>
				${dto.readcnt}
			</td>
		</tr>
		
		<tr>
			<th style="width:150px;">작성자</th>
				<td>
					${dto.writer}
				</td>
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
							<input type="button" class="inputButton" value="글 삭제" onclick="window.location='<c:url value="/pages/D_boardDeletePro?boardnum=${dto.boardnum}&pageNum=${pageNum}&num=${num}&del=${dto.del}"/>'">
					</c:if>
						<input type="button" class="inputButton" value="답글 쓰기" onclick="window.location='<c:url value="/pages/D_writeForm?boardnum=${dto.boardnum}&num=${num}&ref=${dto.ref}&ref_step=${dto.ref_step}&ref_level=${dto.ref_level}&pageNum=${pageNum}"/>'">
						<input type="button" class="inputButton" value="목록 보기" onclick="window.location='<c:url value="/pages/D_boardList?pageNum=${pageNum}&boardnum=${dto.boardnum}&num=${num}"/>'">
				</th>
			</tr>
		</table>
	</article>
</section>