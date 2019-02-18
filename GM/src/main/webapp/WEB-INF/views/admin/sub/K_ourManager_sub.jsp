<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
	<article>
		<div class="content_header">
			<h2>우리회사 관리자</h2>
		</div>
		<br>
		<div class="fleft w50p" style="overflow-y: scroll; height: 450px;">
			<form action="K_deleteManager" name="managerLeft" method="post">
				<table>
					<tr>
						<th>선택</th>
						<th>성명</th>
						<th>부서</th>
					</tr>
					<c:forEach var="dto" items="${mgiList }">
						<c:if test="${dto.sys_rank == 1}">
							<tr>
								<td>
									<c:if test="${dto.id != strId }">
										<input type="checkbox" name="check1" value="${dto.id}">
									</c:if>
								</td>
								<td>${dto.name }&nbsp;${dto.rankName }</td>
								<td>${dto.departName }</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</form>
		</div>
		<div class="fright w50p" style="overflow-y: scroll; height: 450px;">
			<form action="K_insertManager" name="managerRight" method="post">
				<table>
					<tr>
						<th>선택</th>
						<th>성명</th>
						<th>부서</th>
					</tr>
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
				</table>
			</form>
		</div>
		<div class="fleft w50p">
			<input type="button" value="권한 삭제" onclick="document.managerLeft.submit();">
		</div>
		<div class="fright w50p">
			<input type="button" value="권한 추가" onclick="document.managerRight.submit();">
		</div>
	</article>
</section>