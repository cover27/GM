<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<form method="post" name="infoform">
<<<<<<< HEAD
<<<<<<< HEAD
	<table border="1">
			<tr>
				<td>사원번호</td>
				<td>성명</td>
				<td>직급</td>
				<td>입사일</td>
				<td>연차</td>
				<td>연차 설정횟수</td>
				<td>사용연차</td>
				<td>잔여연차</td>
				<td>휴가  설정횟수</td>
				<td>휴가 사용수</td>
				<td>잔여휴가</td>
			</tr>
			<c:if test="${cnt >0}">
			<c:forEach var="dto" items="${dtos}">
			<tr>
				<td>${dto.id}</td>
				<td>${dto.name}</td>
				<td>${dto.rank_name}</td>
				<td>${dto.enterday}</td>
				<td>${dto.year}</td>
				<td>${dto.annual}</td>
				<td>${dto.su_annual}</td>
				<td>${dto.sn_annual}</td>
				<td>${dto.vacation}</td>
				<td>${dto.u_vacation}</td>
				<td>${dto.n_vacation}</td>
			</tr>
			</c:forEach>
			</c:if>


=======
>>>>>>> branch 'master' of https://github.com/cover27/GM.git
	<div class="table_top">
		<table>
			<colgroup>
				<col width="145px" />
				<col width="145px" />
				<col width="145px" />
				<col width="143px" />
				<col width="143px" />
				<col width="143px" />
				<col width="143px" />
				<col width="143px" />
				<col width="143px" />
				<col width="143px" />
				<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th>사원번호</th>
					<th>성명</th>
					<th>직급</th>
					<th>입사일</th>
					<th>연차</th>
					<th>연차 설정횟수</th>
					<th>사용연차</th>
					<th>잔여연차</th>
					<th>휴가  설정횟수</th>
					<th>휴가 사용수</th>
					<th>잔여휴가</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="salary_info">
		<table>
			<colgroup>
				<col width="145px" />
				<col width="145px" />
				<col width="145px" />
				<col width="143px" />
				<col width="143px" />
				<col width="143px" />
				<col width="143px" />
				<col width="143px" />
				<col width="143px" />
				<col width="143px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<c:if test="${cnt >0}">
				<c:forEach var="dto" items="${dtos}">
				<tr>
					<td>${dto.id}</td>
					<td>${dto.name}</td>
					<td>${dto.rank_name}</td>
					<td>${dto.enterday}</td>
					<td>${dto.year}</td>
					<td>${dto.annual}</td>
					<td>${dto.u_annual}</td>
					<td>${dto.n_annual}</td>
					<td>${dto.vacation}</td>
					<td>${dto.u_vacation}</td>
					<td>${dto.n_vacation}</td>
				</tr>
				</c:forEach>
				</c:if>
				<c:if test="${cnt == 0}">
					<tr>
					<td colspan="11" style="height: 250px;">검색 내용에 대한 정보가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</form>