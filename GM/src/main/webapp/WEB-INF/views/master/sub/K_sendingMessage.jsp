<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<html>
<body>
	<h3>쪽지보내기</h3>
	<form action="K_sendMessage_pro" method="post">
		<input type="hidden" name="id" value="${id }">
		<table>
			<tr>
				<th>보내는사람</th>
				<td>시스템관리자 (master)</td>
			</tr>
			<tr>
				<th>받는사람</th>
				<td>${name } (${id })</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content">
					</textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="보내기">
					<input type="button" value="닫기" onclick="self.close();">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>