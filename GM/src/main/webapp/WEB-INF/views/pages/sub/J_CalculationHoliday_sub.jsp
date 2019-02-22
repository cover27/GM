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
//연차/휴가일수 조회
function VacationViews() {
	var year = $("#year").val();
	var id = $("#id").val();
	$.ajax({
		url : '${pageContext.request.contextPath}/pages/VacationViews',
		type : 'POST',
		data : {
			'year' : year,
			'id' : id
		}, //전송할 데이터
		success : function(result) {
			$('#result').html(result);
		},
		error : function() {
			alert('오류');
		}
	});
};

</script>
<section>
	<article>
		<div class="content_header">
			<h2>연차/휴가일수 조회</h2>
		</div>
		<form name="searchform">
		<div>
			<span class="bold5px">사업장 : </span>
			<c:forEach var="dto" items="${dtoss}">
				<span class="bold5px">${dto.c_name}</span>
			</c:forEach>
			<span class="ml50 bold5px">아이디</span> <span><input type="text" class="searchId" id="id"></span>
			<span><button onclick="searchId()" class="find_btn"><i class="fa fa-search fa-fw"></i></button></span> 
			<span><input type="text" class="searchName" name="name"></span>
			<span><input type="button" onclick="searchPayroll()" value="조회" style="background: #d3292c;"></span> 
			<span class="ml50"><b></b></span>
			<span class="bold5px ml50">*년도별검색 : </span>
			<span><input type="text" id="year" placeholder="예)2019" maxlength="4" required></span>
			<span><input type="button" onclick="VacationViews()" value="조회" style="background: #d3292c;"></span>
		</div>
		</form>
		<div>휴가일수계산</div>
		<div id="result">
		<table border="1">
			<tr>
				<td>번호</td>
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
			<tr>
				<td colspan="11" style="height: 250px;">정보가 없습니다.</td>
			</tr>
		</table>
		</div>
	</article>
</section>