<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<script>
function insertONtime(num,day) {
	var date = $("#date2").val();
	alert("date :" + date + "num :" + num);
	window.location="insertONtime?date="+date + "&num=" + num +"&day=" + day;
};
function showONtime2(){
	var date = $("#date2").val();
  	var url="showONtime?date=" + date;
   	window.open(url, "showONtime", "menubar=no, width=1000, height=560");
};
</script>
<style>
	body {
		overflow: hidden;
	}
</style>
<link rel="stylesheet" href="${path}css/J_style.css" />
<div class="content" style="width: 1480px;height: 450px;margin: 10px auto;background: #fff;border-radius: 10px;box-shadow: 5px 5px 30px 1px #555;">
	<div class="search-wrap" style="border-radius: 10px 10px 0 0;">
		<div class="form-group">
			<span><input type="month"  id="date2" value="${date}" required></span>
			<span><input type="button" onclick="showONtime2()" value="검색"></span>
		</div>
	</div>
	<div class="table_top">
		<table>
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
	<div class="salary_info" style="height: 320px;">
		<table>
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
								<input type="button" value="지급처리" onclick="insertONtime('${dtos.num}','${dtos.day}')">
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
</div>