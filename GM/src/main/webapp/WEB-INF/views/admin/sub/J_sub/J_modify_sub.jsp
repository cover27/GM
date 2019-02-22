<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<form action="modifyUpdate" method="post">
<table border="1">
	<tr>
		<td>등록번호</td>
		<td>사원 번호</td>
		<td>성명</td>
		<td>출근시간</td>
		<td>퇴근시간</td>
		<td>근무시간</td>
		<td>연장근로</td>
		<td>야간근로</td>
		<td>지각시간</td>
		<td>조퇴시간</td>
		<td>기능</td>
	</tr>
	<c:forEach var="dtos" items="${dtos}">
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
	<input type="hidden" value="${dtos.num}" name="num">
	<input type="hidden" value="${date}" name="date">
	</c:forEach>
</table>
</form>