<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<html>
<script type="text/javascript">

	function setCompany(company){
		opener.document.inputform.depart.value=company;
		self.close();
	}
	
</script>
<body>
	<h2>회사 검색</h2>
	<br>
	<table>
		
		<tr>
			<th>선택</th>
			<th>회사명</th>
			<th>주소</th>
			<th>사업자등록번호</th>
		</tr>
		<c:forEach var='dto' items='${list}'>
			<tr>
				<th><input type="button" value="선택" onclick="setCompany('${dto.c_name}');"></th>
				<th>${dto.c_name }</th>
				<th>${dto.c_address }</th>
				<th>${dto.c_number }</th>
			</tr>
		</c:forEach>
	</table>
	<input class="inputButton" type="button" value="취소" onclick="self.close();">
</body>
</html>