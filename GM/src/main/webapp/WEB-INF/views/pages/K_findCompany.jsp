<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<html>
<body>
	<h2>회사 검색</h2>
	
	<table>
		<c:forEach var='dto' items='${list}'>
			<tr>
				<th>${dto.company }</th>
				<th>${dto.c_name }</th>
				<th>${dto.c_address }</th>
				<th>${dto.c_number }</th>
				<th>${dto.del }</th>
			</tr>
		</c:forEach>
		<input class="inputButton" type="button" value="취소" onclick="self.close();">
	</table>
</body>
</html>