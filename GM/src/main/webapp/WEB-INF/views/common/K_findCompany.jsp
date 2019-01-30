<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<script type="text/javascript">

	function setCompany1(company){
		opener.document.inputform.depart_name.value=company;
		self.close();
	}
	
	function setCompany2(company){
		opener.document.inputform.depart.value=company;
		self.close();
	}
</script>
	<h2>회사 검색</h2>
	<br>
	<form action="searchCompany" method="post">
		<table>
			<tr>
				<th>
					<input type="text" name="keyword" placeholder="업체명을 입력하세요." required>
					<input type="submit" value="검색" >
				</th>
			</tr>
			<tr>
				<th>선택</th>
				<th>회사명</th>
				<th>주소</th>
				<th>사업자등록번호</th>
			</tr>
			<c:forEach var='dto' items='${list}'>
				<tr>
					<th><input type="button" value="선택" onclick="setCompany1('${dto.c_name}'); setCompany2('${dto.company}');"></th>
					<th>${dto.c_name }</th>
					<th>${dto.c_address }</th>
					<th>${dto.c_number }</th>
				</tr>
			</c:forEach>
			<c:if test="${list.size() == 0 }">
				<tr>
					<th>
						검색결과가 없습니다.
					</th>
				</tr>
			</c:if>
		</table>
	</form>
	<input class="inputButton" type="button" value="취소" onclick="self.close();">