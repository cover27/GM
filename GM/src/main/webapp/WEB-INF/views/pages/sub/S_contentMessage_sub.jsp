<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section>
	<article>
		<div class="content_header">
			<h2>게시글 상세 페이지</h2>
		</div>
		<div class="content">
			<div class="write_head">
				<ul>
					<li>
						<span><b>${ct_dto.subject}</b></span>
					</li>
					<li>
						<span>${ct_dto.receiver}</span>
						<span style="margin:0 10px;color: #c0c0c0;">|</span>
						<%-- <span><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${ct_dto.getReceivedDate()}" /></span> --%>
					</li>
				</ul>
			</div>
			<div class="write_body">
				${ct_dto.content}
			</div>

			<%-- <div style="margin-bottom:60px;padding-top: 20px;" class="btnset fright">
				<input type="button" class="inputButton" value="글 삭제" onclick="window.location='<c:url value="/pages/D_boardDeletePro?boardnum=${dto.boardnum}&pageNum=${pageNum}&num=${num}&ref_level=${dto.ref_level}"/>'">
				<input type="button" class="inputButton" value="답글 쓰기" onclick="window.location='<c:url value="/pages/D_writeForm?boardnum=${dto.boardnum}&num=${num}&ref=${dto.ref}&ref_step=${dto.ref_step}&ref_level=${dto.ref_level}&pageNum=${pageNum}"/>'">
				<input type="button" class="inputButton" value="목록 보기" onclick="window.location='<c:url value="/pages/D_boardList?pageNum=${pageNum}&boardnum=${dto.boardnum}&num=${num}"/>'">
			</div> --%>
		</div>
	</article>
</section>