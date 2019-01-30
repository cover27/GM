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
		
<form action="modifyPro" method="post" name="modifyform">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="pageNum" value="${pageNum}">
		<table style="width:1000px;">
			<tr>
				<th colspan="2">수정할 정보를 입력하세요.</th>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td style="text-align:left;padding-left:10px;">${dto.writer}</td>
			</tr>
			
			<tr>
				<th>글제목</th>
				<td colspan="2" style="width:150px;text-align:left; padding-left:10px;">
					<input type="text" name="subject" placeholder="${dto.subject}" style="width:100%;height:100%;" required autofocus>
				</td>
			</tr>
			
			<tr>
				<th style="width:150px;">글내용</th>
				<td style="height:300px;text-align:left; padding-left:10px;">
					<textarea class="input" name="content" cols="40" rows="10" style="width:100%;height:100%;" placeholder="${dto.content}"></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" class="inputButton" value="확인">
					<input type="reset" class="inputButton" value="취소" onclick="window.history.back(-2)">
					<input type="button" class="inputButton" value="목록 보기" onclick="window.location='boardList?pageNum=${pageNum}'">
				</th>
			</tr>
		</table>
</form>
	</article>
</section>
	