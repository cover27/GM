<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<form action="modifyUpdate" method="post">
<div class="table_top">
	<table>
		<colgroup>
			<col width="143px" />
 			<col width="143px" />
 			<col width="143px" />
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
				<th>등록번호</th>
				<th>사원 번호</th>
				<th>성명</th>
				<th>출근시간</th>
				<th>퇴근시간</th>
				<th>근무시간</th>
				<th>연장근로</th>
				<th>야간근로</th>
				<th>지각시간</th>
				<th>조퇴시간</th>
				<th>기능</th>
			</tr>
		</thead>
	</table>
</div>
<div class="salary_info">
	<table>
		<colgroup>
			<col width="143px" />
 			<col width="143px" />
 			<col width="143px" />
 			<col width="143px" />
 			<col width="143px" />
 			<col width="143px" />
 			<col width="143px" />
 			<col width="143px" />
 			<col width="143px" />
 			<col width="143px" />
 			<col width="*" />
 		</colgroup>
		<c:forEach var="dtos" items="${dtos}">
			<tbody>
				<tr>
					<td>${dtos.num}</td>
					<td>${dtos.id}</td>	
					<td>${dtos.name}</td>
					<td><input name="go" type="text" value="${dtos.gos}"></td>
					<td><input name="off" type="text" value="${dtos.offs}"></td>
					<td><input name="work" type="text" value="${dtos.worktimes}"></td>
					<td><input name="over" type="text" value="${dtos.overtimes}"></td>
					<td><input name="night" type="text" value="${dtos.nighttimes}"></td>
					<td><input name="per" type="text" value="${dtos.perceptiontimes}"></td>
					<td><input name="depar" type="text" value="${dtos.departuretimes}"></td>
					<td><input type="submit" value="변경"></td>
				</tr>
			</tbody>
			<input type="hidden" value="${dtos.num}" name="num">
			<input type="hidden" value="${date}" name="date">
		</c:forEach>
	</table>
</div>
</form>