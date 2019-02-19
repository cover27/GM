<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<body>
	<h3>사용자 정보</h3>
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
					<th>이름</th>
					<th>부서명</th>
					<th>직급명</th>
					<th>전화번호</th>
					<th>이메일</th>
				</tr>
				<c:if test="${mgiList.size() == 0 }">
					<tr>
						<td colspan="5">소속 구성원이 없습니다.</td>
					</tr>
				</c:if>
			</thead>
		</table>
	</div>
	<div class="table_body">
		<table>
			<colgroup>
				<col width="200px" />
				<col width="200px" />
				<col width="200px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<c:forEach var="dto" items="${mgiList }">
					<tr>
						<c:if test="${dto.leader == 1 }">
							<td style="font-weight: bold;"><i class="leader"></i><span>${dto.name }</span><span>(부서장)</span></td>
						</c:if>
						<c:if test="${dto.leader != 1 }">
							<td>${dto.name }</td>
						</c:if>
						<td>${dto.departName }</td>
						<td>${dto.rankName }</td>
						<td>${dto.tel }</td>
						<td>${dto.email }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>