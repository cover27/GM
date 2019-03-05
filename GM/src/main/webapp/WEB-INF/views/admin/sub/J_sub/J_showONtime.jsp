<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<script>
function insertONtime(num) {
	var date = ${date};
	alert("date :" + date + "num :" + num);
	window.location="insertONtime?date="+date + "&num=" + num;
};
function showONtime2(){
	var date = $("#date2").val();
  	var url="showONtime?date=" + date;
   	window.open(url, "showONtime", "menubar=no, width=1000, height=560");
};
</script>
<div class="table_top">
<input type="month"  id="date2" value="${date}" required>
<input type="button" onclick="showONtime2()" value="검색">
	<table border="1">
		<colgroup>
			<col width="198px" />
			<col width="198px" />
			<col width="198px" />
			<col width="197px" />
			<col width="197px" />
			<col width="*" />
		</colgroup>
		<thead>
			<tr>
				<th>등록번호</th>
				<th>사원번호</th>
				<th>성명</th>
				<th>근태종류</th>
				<th>근태시간</th>
				<th>근태일자</th>
				<th>지급상태</th>
			</tr>
		</thead>
	</table>
</div>
<div class="salary_info" style="height:700px;">
	<table border="1">
		<colgroup>
			<col width="198px" />
			<col width="198px" />
			<col width="198px" />
			<col width="197px" />
			<col width="197px" />
			<col width="*" />
		</colgroup>
		<tbody>
			<c:if test="${cnt == 0}">
				<tr>
					<td colspan="8" style="height: 250px;">정보가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${cnt > 0}">
				<c:forEach var="dtos" items="${dtos}">
					<tr>
						<td>${dtos.num}</td>
						<td>${dtos.id}</td>
						<td>${dtos.name}</td>
						<td>
						<c:if test="${dtos.overtime > 0 && dtos.nighttime == 0}">
							연장근무
						</c:if>
						<c:if test="${dtos.overtime > 0 && dtos.nighttime > 0}">
							 연장,야간근무
						</c:if>
						</td>
						<td>
						<c:if test="${dtos.overtimes != null}">
							${dtos.overtimes}
						</c:if>
						<c:if test="${dtos.nighttime != null}">
							${dtos.nighttimes}
						</c:if>
						</td>
						<td>${dtos.day}</td>
						<td>
						<c:if test="${dtos.state == 0}">
							<input type="button" value="지급처리" onclick="insertONtime('${dtos.num}')">
						</c:if>
						<c:if test="${dtos.state == 1}">
							지급완료
						</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>