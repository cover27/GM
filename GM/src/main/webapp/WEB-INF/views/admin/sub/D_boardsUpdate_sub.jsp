<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section>
	<article>
		<div class="content_header">
			<h2>게시판 수정</h2>
		</div>
		
		<form action="<c:url value='/admin/D_boardsUpdatePro'/>" method="post" name="D_boardsUpdate">
		<input type="hidden" name="num" value="${num}">
			<table>		
					<tr>
						<th> 게시판명</th>
							<td>
								<input class="input" type="text" name="b_name" maxlength="50" style="width:270px" placeholder="${bvo.b_name}">
							</td>
					</tr>		
			
					<tr>
						<th> 익명여부</th>
							<td>
								<input type="radio" name="anon" value="0"> 실명
								<input type="radio" name="anon" value="1"> 익명
							</td>
					</tr>
			
					<tr>
						<th colspan="2">
							<input class="inputButton" type="submit" value="수정">
							<input class="inputButton" type="button" value="수정취소"
									onclick="window.history.back()">				
						</th>
					</tr>		
				</table>
			</form>
	</article>
</section>
	