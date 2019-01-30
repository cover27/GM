<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ page import="com.spring.gm.vo.MemberVO" %>  
<%@ page import="com.spring.gm.vo.BoardsVO" %>
<section>
	<article>
		<div class="content_header">
			<h2>게시글 작성</h2>
		</div>
		
	<form action="<c:url value='/pages/D_writePro'/>" method="post" name="D_writeForm">
		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="writer" value="<%=((MemberVO)request.getSession().getAttribute("loginInfo")).getName() %>">
		<input type="hidden" name="boardnum" value="${boardnum}">
		<input type="hidden" name="ref" value="${ref}">
		<input type="hidden" name="ref_step" value="${ref_step}">
		<input type="hidden" name="ref_level" value="${ref_level}">
		<input type="hidden" name="pageNum" value="${pageNum}">
	<table align="center">
		<tr>
			<th> 작성자 </th>
			<td>
				<%=((MemberVO)request.getSession().getAttribute("loginInfo")).getName() %>
			</td>				
		</tr>
			
		<tr>
			<th> 제목 </th>
			<td>
				<input class="input" type="text" name="subject" maxlength="50" style="width:270px" placeholder="제목을 입력하세요!!" required> 
			</td>
		</tr>
			
		<tr>
			<th> 내용 </th>
			<td>
				<textarea class="input" rows="10" cols="40" name="content" style="width:270px" placeholder="글내용을 입력하세요!!" word-break:break-all></textarea>
			</td>
		</tr>
			
		<tr>
			<th colspan="2">
				<input class="inputButton" type="submit" value="작성">
				<input class="inputButton" type="reset" value="취소">
				<input class="inputButton" type="button" value="목록"
						onclick="window.location=<c:url value='/pages/D_boardList?pageNum=${pageNum}'/>">
			</th>
		</tr>
	</table>	
	</form>		
	</article>
</section>