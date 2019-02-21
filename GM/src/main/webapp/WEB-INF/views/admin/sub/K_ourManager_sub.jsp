<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
	<article>
		<div class="content_header">
			<h2>우리회사 관리자</h2>
		</div>
		<div class="content">
			<div class="fleft w49p" style="height: 450px;">
				<form action="K_deleteManager" name="managerLeft" method="post">
					<div class="table_head">
						<table>
							<colgroup>
								<col width="100px" />
								<col width="345px" />
								<col width="*" />
							</colgroup>
							<thead>
								<tr>
									<th>선택</th>
									<th>성명</th>
									<th>부서</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="table_body" style="height: 680px;">
						<table>
							<colgroup>
								<col width="100px" />
								<col width="345px" />
								<col width="*" />
							</colgroup>
							<tbody>
								<c:forEach var="dto" items="${mgiList }">
									<c:if test="${dto.sys_rank == 1}">
										<tr>
											<td><c:if test="${dto.id != strId }">
													<input type="checkbox" name="check1" value="${dto.id}">
												</c:if></td>
											<td>${dto.name }&nbsp;${dto.rankName }</td>
											<td>${dto.departName }</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</form>
				<input type="button" value="권한 삭제" onclick="document.managerLeft.submit();" style="font-size: 1em; margin-top: 10px;">
			</div>
			<div class="fright w50p" style="height: 450px;">
				<form action="K_insertManager" name="managerRight" method="post">
					<div class="table_head">
						<table>
							<colgroup>
								<col width="100px" />
								<col width="345px" />
								<col width="*" />
							</colgroup>
							<thead>
								<tr>
									<th>선택</th>
									<th>성명</th>
									<th>부서</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="table_body" style="height: 680px;">
						<table>
							<colgroup>
								<col width="100px" />
								<col width="345px" />
								<col width="*" />
							</colgroup>
							<tbody>
								<c:forEach var="dto" items="${mgiList }">
									<c:if test="${dto.sys_rank != 1}">
										<tr>
											<td>
												<input type="checkbox" name="check2" value="${dto.id}">
											</td>
											<td>${dto.name }&nbsp;${dto.rankName }</td>
											<td>${dto.departName }</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</form>
				<input type="button" value="권한 추가" onclick="document.managerRight.submit();" style="font-size: 1em; margin-top: 10px;">
			</div>
		</div>
	</article>
</section>