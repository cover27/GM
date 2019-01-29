<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
	<article>
		<div class="content_header">
			<h2>게시글 상세 페이지</h2>
		</div>
	<table>
		<tr>
			<th style="width:150px;">글번호</th>
			<td>
				${number}
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
			<!--
				word-break:break-all	글자단위 자동 줄바꿈
						  :keep-all		단어 기준 자동 줄바꿈
			-->
				<td colspan="3" style="height:300px;text-align:left; padding-left:10px;">
					${dto.content}
				</td>
			</tr>
			
			<tr>
				<th colspan="4">
					<input type="button" class="inputButton" value="글 수정" onclick="window.location='modifyForm.bo?num=${dto.num}&pageNum=${pageNum}'">
					<input type="button" class="inputButton" value="글 삭제" onclick="window.location='deleteForm.bo?num=${dto.num}&pageNum=${pageNum}&ref_level=${dto.ref_level}'">
					<input type="button" class="inputButton" value="답글 쓰기" onclick="window.location='writeForm.bo?num=${dto.num}&ref=${dto.ref}&ref_step=${dto.ref_step}&ref_level=${dto.ref_level}&pageNum=${pageNum}'">
					<input type="button" class="inputButton" value="목록 보기" onclick="window.location='boardList.bo?pageNum=${pageNum}'">
				</th>
			</tr>
		</table>
	</article>
</section>