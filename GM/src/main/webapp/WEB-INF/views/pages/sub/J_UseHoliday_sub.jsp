<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
function searchId() {
	var id = $('.searchId').val();
	var url = "J_searchId_sub?id=" + id;
	window.open(url, "J_searchId", "menubar=no, width=700, height=560");
}

function back(id, name) {
	opener.document.searchform.id.value = id;
	opener.document.searchform.name.value = name;
	self.close();
}
function vacationUH2() {
	var month = $("#month").val();
	window.location="vacationUH2?year="+year;
};
function search() {
	$("#search").show();
	$("#allsearch").hide();
}
function allsearch() {
	$("#allsearch").show();
	$("#search").hide();
}
</script>
<section>
	<article>
		<div class="content_header">
			<h2>월 근태 현황</h2>
		</div>
		<form action="vacationUH" method="post" name="searchform">
		<div>
		<input type="button" onclick="search()" value="사원조회" style="background: #d3292c;">
		<input type="button" onclick="allsearch()" value="전체조회" style="background: #d3292c;">
		</div>
		<c:if test="${sys_rank == 1 }"> <!-- 관리자인경우 -->
		<div id="search">
			<span class="bold5px">사업장 : </span>
			<c:forEach var="dto" items="${dtoss}">
				<span class="bold5px">${dto.c_name}</span>
			</c:forEach>
			<span class="ml50 bold5px">아이디</span>
			<span><input type="text" id="id" name="id" value="${id}"></span>
			<span><button onclick="searchId()" class="find_btn"><i class="fa fa-search fa-fw"></i></button></span>
			<span class="bold5px ml50">이름 : </span>
			<span><input type="text" class="searchName" name="name" readonly placeholder="아이디를 조회하세요." style="background: #f3f3f3;"></span>
			<span class="ml50 bold5px">*급여년월</span>
			<span><input type="text" id="year" value="${year}" name="year" placeholder="예)2019" maxlength="4"></span>
			<span><input type="submit" value="조회" style="background:#d3292c;"></span>
		</div>
		
		<!-- 전체 조회 -->
		<div id="allsearch" style="display:none;">
			<span class="bold5px ml50">*년도별검색 : </span>
			<span><input type="text" id="year" placeholder="예)2019" maxlength="4"></span>
			<span><input type="button" onclick="vacationUH2()" value="조회" style="background: #d3292c;"></span>
		</div>
		</c:if>
		
		
		<c:if test="${sys_rank != 1 }"> <!-- 관리자가 아닐경우 -->
				<span class="bold5px">사업장</span>
				<c:forEach var="dto" items="${dtoss}">
					<span class="bold5px">${dto.c_name}</span>
				</c:forEach>
				<span class="bold5px ml50">아이디</span>
				<span><input type="text" class="searchId" id="id" value="${id}" name="id" readonly></span>
				<span class="bold5px ml50">이름 : </span>
				<span><input type="text" class="searchName" name="name" value="${name}" readonly placeholder="아이디를 조회하세요."></span>
				<span class="bold5px ml50">*급여년월</span>
				<span><input type="text" id="year" value="${year}" name="month" maxlength="4" placeholder="예)2019"></span>
				<span><input type="submit" value="조회" style="background:#d3292c;"></span>
		</c:if>	
		<c:if test="${month == null}">
		<script>
			document.getElementById('year').value = new Date().toISOString().slice(0, 4);
		</script>
		</c:if>
		
		<div>휴가사용현황 : ${cnt}</div>
		<table border="1">
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
				</tr>
			</c:forEach>
			</c:if>
			<c:if test="${cnt == 0}">
				<tr>
					<td colspan="11" style="height: 250px;"> 데이터 정보가 없습니다.</td>
				</tr>
			</c:if>
		</table>	
			<br><br>
			<div>
			<span>*휴가신청내역 : ${cnt}</span>
			<table border="1">
				<tr>
					<td>휴가번호</td>
					<td>신청일</td>
					<td>휴가구분</td>
					<td>전일/반일</td>
					<td>시작일</td>
					<td>종료일</td>
					<td>일수</td>
					<td>상태</td>
					<td>휴가사유</td>
					<td>취소</td>
				</tr>
				<c:if test="${cnt2 == 0}">
				<tr>
				<td colspan="10" style="height:200px;">*데이터 정보가 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${cnt2 > 0}">
					<c:forEach var="dto" items="${dtos2}">
						<tr>
						<td id="num" name="num">${dto.num}</td>
						<td>${dto.applicationdate}</td>
						<td>
						<c:if test="${dto.types == 1}">연차</c:if>
						<c:if test="${dto.types == 2}">휴가</c:if>
						</td>
						<td>
						<c:if test="${dto.fullhalfday == 1}">전일</c:if>
						<c:if test="${dto.fullhalfday == 2}">반일</c:if>
						</td>
						<td>${dto.begin}</td>
						<td>${dto.end}</td>
						<c:if test="${dto.fullhalfday == 2}"><td>${dto.day/2}</td></c:if>
						<c:if test="${dto.fullhalfday == 1}"><td>${dto.day}</td></c:if>
						<td>
						<c:if test="${dto.state == 2}">승인대기</c:if>
						<c:if test="${dto.state == 3}">승인취소</c:if>
						</td>
						<td>${dto.content}</td>
						<td><input type="button" value="신청취소" onclick="cancelapplication('${dto.num}')"></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
		
		<br><br>
		<div> 휴가신청에서 실제사용여부가 체크된 휴가만 조회됩니다.</div>
	</form>
	</article>
</section>