<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/views/setting.jsp"%> --%>
<section>
	<article>
		<div class="content_header">
			<h2>사업장 가입 승인/취소</h2>
		</div>
		<form action="<c:url value='/master/appCompanies_pro'/>" method="post" id="appform" name="appform">
			<input type="hidden" name="appcan" value="0">
			<div class="content">
				<div class="table_head">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="450px" />
							<col width="450px" />
							<col width="*" />
						</colgroup>
						<thead>
							<tr>
								<th>선택</th>
								<th>사업자번호</th>
								<th>사업장명</th>
								<th>신청자</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="table_body">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="450px" />
							<col width="450px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<c:forEach var="dto" items="${list}">
								<tr>
									<td><input type="checkbox" name="check" value="${dto.id }"></td>
									<td>${dto.c_number}</td>
									<td>${dto.c_name}</td>
									<td>${dto.name} (${dto.id })</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="btnset authorize">
					<input type="submit" value="승인">
					<input type="button" value="취소" onclick="document.appform.appcan.value = 1; document.getElementById('appform').submit();">
				</div>
			</div>
		</form>
		
	</article>
</section>