<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section>
	<article>
		<div class="content_header">
			<h2> 인물 상세정보 </h2>
		</div>

		<table align = "center">
			<tr>
				<th style="width:150px">글번호</th>
				<td style="width:150px" align="center">${number}</td>
	
				<th style="width:150px">조회수</th>
				<td style="width:150px" align="center">${dto.readCnt}</td>
			</tr>
<%-- 			
			<tr>
				<th style="width:150px">작성자</th>
				<td style="width:150px" align="center">${dto.writer}</td>
				
				<th style="width:150px">작성일</th>
				<td style="width:150px" align="center"><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.reg_date}"/></td>
			</tr>
			
			<tr>
				<th style="width:150px">글제목</th>
				<td style="width:150px" colspan="3">${dto.subject}</td>
			</tr>
			
			<tr>
				<th style="width:150px">글내용</th>

				<td style="width:150px; word-break:break-all; height:300px;" colspan="3" valign="top">${dto.content}
				</td>
	
			</tr>
			
			<tr>
				<th colspan="4">
					<input class="inputButton" type="button" value="글수정" onclick="window.location='modifyForm?num=${dto.num}&pageNum=${pageNum}'">
					<input class="inputButton" type="button" value="글삭제" onclick="window.location='deleteForm?num=${dto.num}&pageNum=${pageNum}'">
					<input class="inputButton" type="button" value="답글쓰기" 
						onclick="window.location='/pages/writeForm?num=${dto.num}&ref=${dto.ref}&ref_step=${dto.ref_step}&ref_level=${dto.ref_level}&pageNum=${pageNum}'">
					<input class="inputButton" type="button" value="목록보기" onclick="window.location='/pages/E_organizationList?pageNum=${pageNum}'">
				</th>
			</tr>
		</table>
 --%>

	</article>
</section>