<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<html>
<body>
	<h3>사업장 정보</h3>
	<div class="table_head">
		<table class="result_table">
			<colgroup>
				<col width="200px" />
				<col width="200px" />
				<col width="200px" />
				<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th>${companyName }&nbsp;의 관리자 목록</th>
				</tr>
				<tr>
					<td>선택</td>
					<td>아이디</td>
					<td>이름</td>
					<td>전화번호</td>
					<td>이메일</td>
				</tr>
				<c:if test="${adminList.size() == 0 }">
					<tr>
						<td colspan="5">소속 구성원이 없습니다.</td>
					</tr>
				</c:if>
			</thead>
		</table>
	</div>
	<div class="table_body">
		<form action="#" name="messageform" method="post">
			<table>
				<tbody>
					<c:forEach var="dto" items="${adminList }">
						<tr>
							<th><input type="radio" name="select" value="${dto.id }"></th>
							<td>${dto.id }</td>
							<td>${dto.name }</td>
							<td>${dto.tel }</td>
							<td>${dto.email_in }</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td><input type="button" value="쪽지보내기" onclick="sendMessage();"></td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>