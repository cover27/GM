<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="<c:url value='/pages/D_repleUpdatePro'/>" method="post" name="D_repleUpdatePro">
	<input type="hidden" name="boardnum" value="${boardnum}">
	<input type="hidden" name="replenum" value="${replenum}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="number" value="${number}">
	<ul>
		<li>
			<span>${writer}</span>
			<span style="margin:0 10px;color: #c0c0c0;">|</span>
			<span><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${r_dtos.reg_date}" /></span>
		</li>
		<li>
			<input type="text" class="w90p" name="content" placeholder="${r_dtos.content}" required autofocus />
			<span class="btnset">
				<input type="submit" value="수정">
				<!-- <input type="reset" value="취소"> -->
			</span>
		</li>
	</ul>
</form>
