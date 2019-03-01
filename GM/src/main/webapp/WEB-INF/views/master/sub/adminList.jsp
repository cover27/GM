<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<html>
<body>
	<h3>사업장 정보</h3>
	<div class="table_head">
		<table class="result_table">
			<colgroup>
				<col width="80px" />
				<col width="100px" />
				<col width="100px" />
				<col width="200px" />
				<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th colspan="5" style="border-bottom: 1px #c0c0c0 solid;"><span>${companyName }</span><span style="font-weight: 400;">의 관리자 목록</span></th>
				</tr>
				<tr>
					<th>선택</th>
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>이메일</th>
				</tr>
				<c:if test="${adminList.size() == 0 }">
					<tr>
						<td colspan="5">소속 구성원이 없습니다.</td>
					</tr>
				</c:if>
			</thead>
		</table>
	</div>
	<div class="table_body" style="height: 641px;">
		<form action="#" name="messageform" method="post">
			<table>
				<colgroup>
					<col width="80px" />
					<col width="100px" />
					<col width="100px" />
					<col width="200px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach var="dto" items="${adminList }">
						<tr>
							<td><input type="radio" name="select" value="${dto.id }"></td>
							<td>${dto.id }</td>
							<td>${dto.name }</td>
							<td>${dto.tel }</td>
							<td>${dto.email_in }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
		<div class="btnset">
			<input type="button" value="쪽지보내기" onclick="sendMessage();">
		</div>
	</div>
</body>
</html>