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
	var year = $("#year2").val();
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
//삭제
function cancelapplication(num) {
	var year = $('#year').val();
	var con_test = confirm("휴가신청 취소 하시겠습니까?.");
	if (con_test == true) {

	window.location="cancelapplication?num="+num + "&year=" + year;
	} else if (con_test == false) {
		return false;
	}
	};

</script>
<section>
	<article>
		<div class="content_header">
			<h2>월 근태 현황</h2>
		</div>
		<div class="content">
			<form action="vacationUH" method="post" name="searchform">
				<c:if test="${sys_rank == 1 }">
				<div>
					<input type="button" onclick="search()" value="사원조회" style="background: #d3292c;">
					<input type="button" onclick="allsearch()" value="전체조회" style="background: #d3292c;">
				</div>
				</c:if>
				<div class="search-wrap mt10" style="height: 38px;">
				    <div class="form-group">
				        <c:if test="${sys_rank == 1 }">
				            <!-- 관리자인경우 -->
				            <div id="search">
				                <span class="bold5px">사업장 : </span>
				                <c:forEach var="dto" items="${dtoss}">
				                    <span class="bold5px">${dto.c_name}</span>
				                </c:forEach>
				                <span class="ml50 bold5px">아이디</span>
				                <span><input type="text" class="searchId" id="id" name="id" value="${id}"></span>
				                <span><a href="#" onclick="searchId()" class="find_btn"><i class="fa fa-search fa-fw"></i></a></span>
				                <span class="bold5px ml50">이름 : </span>
				                <span><input type="text" class="searchName" name="name" readonly placeholder="아이디를 조회하세요." style="background: #f3f3f3;"></span>
				                <span class="ml50 bold5px">*급여년월</span>
				                <span><input type="text" id="year" value="${year}" name="year" placeholder="예)2019" maxlength="4"></span>
				                <span><input type="submit" value="조회" style="background:#d3292c;"></span>
				            </div>
				
				            <!-- 전체 조회 -->
				            <div id="allsearch" style="display:none;">
				                <span class="bold5px ml50">*년도별검색 : </span>
				                <span><input type="text" id="year2" placeholder="예)2019" maxlength="4" value="${year}"></span>
				                <span><input type="button" onclick="vacationUH2()" value="조회" style="background: #d3292c;"></span>
				            </div>
				        </c:if>
				        <c:if test="${sys_rank != 1 }">
				            <!-- 관리자가 아닐경우 -->
				            <span class="bold5px">사업장</span>
				            <c:forEach var="dto" items="${dtoss}">
				                <span class="bold5px">${dto.c_name}</span>
				            </c:forEach>
				            <span class="bold5px ml50">아이디</span>
				            <span><input type="text" class="searchId" id="id" value="${id}" name="id" readonly></span>
				            <span class="bold5px ml50">이름 : </span>
				            <span><input type="text" class="searchName" name="name" value="${name}" readonly placeholder="아이디를 조회하세요."></span>
				            <span class="bold5px ml50">*급여년월</span>
				            <span><input type="text" id="year" value="${year}" name="year" maxlength="4" placeholder="예)2019"></span>
				            <span><input type="submit" value="조회" style="background:#d3292c;"></span>
				        </c:if>
				        <c:if test="${month == null}">
				            <script>
				                document.getElementById('year').value = new Date().toISOString().slice(0, 4);
				                document.getElementById('year2').value = new Date().toISOString().slice(0, 4);
				            </script>
				        </c:if>
				
				    </div>
				</div>
			</form>
			<h3>휴가사용현황 : <span style="color:d3292c;">${cnt}</span></h3>
			<div class="mt10 table_top">
				<table>
					<colgroup>
						<col width="144px" />
						<col width="144px" />
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
						</tr>	
					</thead>
				</table>
			</div>
			<div class="salary_info" style="height: 250px;">
				<table>
					<colgroup>
						<col width="144px" />
						<col width="144px" />
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
					<tbody>
						<c:if test="${cnt > 0}">
							<c:forEach var="dtos" items="${dtos}">
								<tr>
									<td>${dtos.num}</td>
									<td>${dtos.id}</td>
									<td>${dtos.name}</td>
									<td>${dtos.rank_name}</td>
									<td>${dtos.j_name}</td>
									<td>
									<c:if test="${dtos.types == 1}">휴가</c:if>
									<c:if test="${dtos.types == 2}">연차</c:if>
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
								<td colspan="11" style="height: 247px;"> 데이터 정보가 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			<h3 class="mt30">*휴가신청내역 : <span style="color:d3292c;">${cnt2}</span></h3>
			<div class="table_top mt10">
				<table>
					<colgroup>
						<col width="158px" />
						<col width="158px" />
						<col width="157px" />
						<col width="157px" />
						<col width="158px" />
						<col width="158px" />
						<col width="157px" />
						<col width="158px" />
						<col width="158px" />
						<col width="*" />
					</colgroup>
					<thead>
						<tr>
							<th>휴가번호</th>
							<th>사원번호</th>
							<th>성명</th>
							<th>신청일</th>
							<th>휴가구분</th>
							<th>전일/반일</th>
							<th>시작일</th>
							<th>종료일</th>
							<th>일수</th>
							<th>상태</th>
							<th>휴가사유</th>
							<th>취소</th>
						</tr>	
					</thead>
				</table>
			</div>
			<div class="salary_info" style="height: 250px;">
				<table>
					<colgroup>
						<col width="158px" />
						<col width="158px" />
						<col width="157px" />
						<col width="157px" />
						<col width="158px" />
						<col width="158px" />
						<col width="157px" />
						<col width="158px" />
						<col width="158px" />
						<col width="*" />
					</colgroup>
					<tbody>
						<c:if test="${cnt2 == 0}">
							<tr>
								<td colspan="10" style="height:247px;">*데이터 정보가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${cnt2 > 0}">
							<c:forEach var="dto" items="${dtos2}">
								<tr>
								<td id="num" name="num">${dto.num}</td>
								<td>${dto.id}</td>
								<td>${dto.name}</td>
								<td>${dto.applicationdate}</td>
								<td>
								<c:if test="${dto.types == 1}">휴가</c:if>
								<c:if test="${dto.types == 2}">연차</c:if>
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
								<c:if test="${dto.state == 0}">휴가처리중</c:if>
								<c:if test="${dto.state == 1}">휴가처리</c:if>
								<c:if test="${dto.state == 2}">승인대기</c:if>
								<c:if test="${dto.state == 3}">승인거절</c:if>
								</td>
								<td>${dto.content}</td>
								<td><input type="button" value="신청취소" onclick="cancelapplication('${dto.num}')"></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<div class="notice mt10">※ 휴가신청에서 실제사용여부가 체크된 휴가만 조회됩니다.</div>
		</div>
	</article>
</section>