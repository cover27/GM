<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
	<article>
		<div class="content_header">
			<h2>댓글 수정</h2>
		</div>
	<form action="<c:url value='/pages/D_repleUpdatePro'/>" method="post" name="D_repleUpdatePro">
	<input type="hidden" name="boardnum" value="${boardnum}">
	<input type="hidden" name="replenum" value="${replenum}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="number" value="${number}">
	
		<table>
				<tr>
					<th> 내용 </th>
					<td>
						<textarea class="input" rows="10" cols="40" name="content" style="width:270px" placeholder="${r_dtos.content}" word-break:break-all></textarea>
					</td>
				</tr>
			
				<tr>
					<th colspan="2">
						<input class="inputButton" type="submit" value="작성">
						<input class="inputButton" type="reset" value="취소">
						<input class="inputButton" type="button" value="목록"
							onclick="window.location='<c:url value='/pages/D_boardContent?boardnum=${dto.boardnum}&num=${num}&pageNum=${pageNum}&number=${number+1}'/>"> ${dto.subject}'">
					</th>
				</tr>						
		</table>
	</form>
	</article>
</section>