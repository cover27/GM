<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/aside.css">
<link rel="stylesheet" href="${path}css/content.css">
<link rel="stylesheet" href="${path}css/J_style.css">
<script>
function managementInsert(id,name,fullhalfday,begin,end,day,date) {
	window.location="managementInsert?id="+id +"&name=" + name + "&fullhalfday=" + fullhalfday + "&begin=" + begin + "&end=" + end + "&day=" + day + "&date="+ date;
};

/* function managementInsert(id,name,fullhalfday,begin,end,day) {
		$
		.ajax({
			url : '${pageContext.request.contextPath}/admin/managementInsert',
			type : 'POST',
			data : {
				'id' : id,
				'name' : name,
				'fullhalfday' : fullhalfday,
				'begin' : begin,
				'end' : end,
				'day' : day
			}, //전송할 데이터
			success : function(result) {
				$('#result').html(result);
			},
			error : function() {
				alert('오류');
			}
		});
	
};
 */
</script>
 <div class="content">
	<form action="vacationList" method="post" name="searchform">
		<div class="search-wrap">
			<div class="form-group">
				<div id="search">
					<span class="bold5px">*급여년월</span>
					<span><input type="date" id="date" value="${date}" name="date"></span>
					<span><input type="submit" value="조회" style="background: #d3292c;"></span>
				</div>
			</div>
		</div>
		<h3>휴가사용현황 : <span style="color:d3292c;">${cnt}</span></h3>
		<div class="table_top">
			<table>
				<thead>
					<tr>
						<th>휴가번호</th>
						<th>사원번호</th>
						<th>성명</th>
						<th>직급</th>
						<th>부서</th>
						<th>휴가구분</th>
						<th>전일/반일</th>
						<th>신청일</th>
						<th>시작일</th>
						<th>종료일</th>
						<th>일수</th>
						<th>처리</th>
					</tr>
				</thead>
			</table>
		</div>
		<div class="salary_info">
			<table>
				<tbody>
					<c:if test="${cnt > 0}">
						<c:forEach var="dtos" items="${dtos}">
							<tr>
								<td>${dtos.num}</td>
								<td>${dtos.id}</td>
								<td>${dtos.name}</td>
								<td>${dtos.rank_name}</td>
								<td>${dtos.j_name}</td>
								<td><c:if test="${dtos.types == 1}">연차</c:if> <c:if
										test="${dtos.types == 2}">휴가</c:if></td>
								<td><c:if test="${dtos.fullhalfday == 1}">전차</c:if> <c:if
										test="${dtos.fullhalfday == 2}">반차</c:if></td>
								<td>${dtos.applicationdate}</td>
								<td>${dtos.begin}</td>
								<td>${dtos.end}</td>
								<td><c:if test="${dtos.fullhalfday == 1}">${dtos.day}일</c:if>
									<c:if test="${dtos.fullhalfday == 2}">${dtos.day/2}일</c:if></td>
								<td><input type="button" value="근태처리"
									onclick="managementInsert('${dtos.id}','${dtos.name}','${dtos.fullhalfday}','${dtos.begin}','${dtos.end}','${dtos.day}','${date}')"></td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${cnt == 0}">
						<tr>
							<td colspan="11" style="height: 383px;">데이터 정보가 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	</form>
 </div>