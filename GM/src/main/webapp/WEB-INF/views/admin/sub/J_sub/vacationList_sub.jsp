<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<form action="vacationList"method="post" name="searchform">
		<div id="search">
			<span class="ml50 bold5px">*급여년월</span>
			<span><input type="date" id="date" value="${date}" name="date"></span>
			<span><input type="submit" value="조회" style="background:#d3292c;"></span>
		</div>
		<div>휴가사용현황 : ${cnt}</div>
		<table border="1" style="width:1000px;">
			<tr>
				<td>휴가번호</td>
				<td>사원번호</td>
				<td>성명</td>
				<td>직급</td>
				<td>부서</td>
				<td>휴가구분</td>
				<td>전일/반일</td>
				<td>신청일</td>
				<td>시작일</td>
				<td>종료일</td>
				<td>일수</td>
				<td>처리</td>
			</tr>
			<c:if test="${cnt > 0}">
			<c:forEach var="dtos" items="${dtos}">
				<tr>
					<td>${dtos.num}</td>
					<td>${dtos.id}</td>
					<td>${dtos.name}</td>
					<td>${dtos.rank_name}</td>
					<td>${dtos.j_name}</td>
					<td>
					<c:if test="${dtos.types == 1}">연차</c:if>
					<c:if test="${dtos.types == 2}">휴가</c:if>
					</td>
					<td>
					<c:if test="${dtos.fullhalfday == 1}">전차</c:if>
					<c:if test="${dtos.fullhalfday == 2}">반차</c:if>
					</td>
					<td>${dtos.applicationdate}</td>
					<td>${dtos.begin}</td>
					<td>${dtos.end}</td>
					<td>
					<c:if test="${dtos.fullhalfday == 1}">${dtos.day}일</c:if>
					<c:if test="${dtos.fullhalfday == 2}">${dtos.day/2}일</c:if>
					</td>
					<td><input type="button" value="근태처리" onclick="managementInsert('${dtos.id}','${dtos.name}','${dtos.fullhalfday}','${dtos.begin}','${dtos.end}','${dtos.day}','${date}')"></td>
				</tr>
			</c:forEach>
			</c:if>
			<c:if test="${cnt == 0}">
				<tr>
					<td colspan="11" style="height: 250px;"> 데이터 정보가 없습니다.</td>
				</tr>
			</c:if>
		</table>	
</form>