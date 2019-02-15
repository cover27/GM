<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<link rel="stylesheet" href="${path}css/signup.css">
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
<div id="findCompany">
	<h2>회사 검색</h2>
	<div class="findCompany">
		<form action="searchCompany" method="post">
			<table>
				<thead>
					<tr>
						<th colspan="4" style="border-radius:6px 6px 0 0">
							<input type="text" name="keyword" placeholder="업체명을 입력하세요." required autofocus>
							<input type="submit" value="검색">
						</th>
					</tr>
					<tr>
						<th>선택</th>
						<th>회사명</th>
						<th>사업자등록번호</th>
						<th>주소</th>
					</tr>
				</thead>
			</table>
			<table>
				<tbody>
					<c:forEach var='dto' items='${list}'>
						<tr>
							<td>
								<input type="button" value="선택" onclick="setCompany1('${dto.c_name}'); setCompany2('${dto.company}');">
							</td>
							<td>${dto.c_name }</td>
							<td>${dto.c_number }</td>
							<td>${dto.c_address }</td>
						</tr>
					</c:forEach>
				</tbody>
				<c:if test="${list.size() == 0 }">
					<tr>
						<th>검색결과가 없습니다.</th>
					</tr>
				</c:if>
			</table>
		</form>
		<input type="button" class="cancelbtn" value="취소" onclick="self.close();" class="btnset">
	</div>
</div>