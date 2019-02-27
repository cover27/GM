<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/views/setting.jsp"%> --%>
<section>
	<article>
		<div class="content_header">
			<h2>휴무 승인/취소</h2>
		</div>
		<form action="<c:url value='/admin/K_appHoliday_pro'/>" method="post" id="appform" name="appform">
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
								<th>ID</th>
								<th>이름</th>
								<th>신청일</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>기간</th>
								<th>비고</th>
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
									<td><input type="checkbox" name="check" value="${dto.num}"></td>
									<td>${dto.id}</td>
									<td>${dto.name}&nbsp;${dto.r_name }</td>
									<td>${dto.applicationDate}</td>
									<td>${dto.begin}</td>
									<td>${dto.end}</td>
									<c:if test="${dto.fullhalfday == 2}">
										<td>${dto.day - 0.5}</td>
										<td>반차</td>
									</c:if>
									<c:if test="${dto.fullhalfday != 2}">
										<td>${dto.day}</td>
										<td>-</td>
									</c:if>
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