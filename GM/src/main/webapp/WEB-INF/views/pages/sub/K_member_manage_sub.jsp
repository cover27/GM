<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<section>
	<article>
		<div class="content_header">
			<h2>가입대기 승인/취소</h2>
		</div>
		<br>
		<table>
			<tr>
				<th><input type="button" value="전체선택" onclick=""></th>
			</tr>
			<tr>
				<th>선택</th>
				<th>ID</th>
				<th>이름</th>
				<th>신청일</th>
			</tr>
			<c:forEach var="dto" items="#{list }">
				<tr>
					<th><input type="checkbox" name="check"></th>
					<th>${dto.id}</th>
					<th>${dto.name }</th>
					<th>${dto.enterday }</th>
				</tr>
			</c:forEach>
			<tr>
				<th>
					<input type="button" value="승인">
					<input type="button" value="취소">
				</th>
			</tr>
		</table>
	</article>
</section>