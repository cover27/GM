<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section>
	<article>
		<div class="content_header">
			<h2>보넨 쪽지 상세 페이지</h2>
		</div>
		<div class="content">
		<form action="<c:url value='/pages/S_sendDeletePro'/>" method="post" id="messageMoveGarbage" name="messageMoveGarbage">
			<input type="hidden" name="pageNum" value="${pageNum}">
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

			<div style="margin-bottom:60px;padding-top: 20px;" class="btnset fright">
				<input type="submit" class="inputButton" value="전송취소">
				<input type="button" class="inputButton" value="목록 보기" onclick='window.history.back()'>
			</div>
		</form>
		</div>
	</article>
</section>