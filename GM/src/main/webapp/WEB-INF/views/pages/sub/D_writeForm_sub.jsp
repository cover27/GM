<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<section>
	<article>
		<div class="content_header">
			<h2>게시글 작성</h2>
		</div>
		
	<form action="D_writePro" method="post" name="writeform"
			onsubmit="return writeCheck();">
		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="ref" value="${ref}">
		<input type="hidden" name="ref_step" value="${ref_step}">
		<input type="hidden" name="ref_level" value="${ref_level}">
		<input type="hidden" name="pageNum" value="${pageNum}">   <!-- 추가 -->
	<table align="center">
		<tr>
			<th> 작성자 </th>
			<td>
				<input class="input" type="text" name="writer" maxlength="20" placeholder="작성자를 입력하세요!!" autofocus required>
			</td>				
		</tr>
			
		<tr>
			<th> 비밀번호 </th>
			<td>
				<input class="input" type="password" name="pwd" maxlength="10" placeholder="비밀번호를 입력하세요!!" required>
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
						onclick="window.location='D_boardList?pageNum=${pageNum}'">
			</th>
		</tr>
	</table>	
	</form>		
	</article>
</section>