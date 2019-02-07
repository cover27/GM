<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
	<article>
		<div class="content_header">
			<h2>게시글 수정</h2>
		</div>
	<form action="<c:url value='/pages/D_boardUpdatePro'/>" method="post" name="D_boardUpdatePro">
	<input type="hidden" name="boardnum" value="${boardnum}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="num" value="${num}">
		<table>
				<tr>
					<th>글 제목</th>
					<td><input class="input" type="text" name="subject" maxlength="50" style="width:270px" placeholder="${vo.subject}" required> 
				</tr>
			
				<tr>
					<th> 내용 </th>
					<td>
						<textarea class="input" rows="10" cols="40" name="content" style="width:270px" placeholder="${vo.content}" word-break:break-all></textarea>
					</td>
				</tr>
			
				<tr>
					<th colspan="2">
						<input class="inputButton" type="submit" value="작성">
						<input class="inputButton" type="reset" value="취소">
						<input class="inputButton" type="button" value="목록"
							onclick="window.location='<c:url value="/pages/D_boardList?pageNum=${pageNum}&num=${num}"/>'">
					</th>
				</tr>						
		</table>
	</form>
	</article>
</section>