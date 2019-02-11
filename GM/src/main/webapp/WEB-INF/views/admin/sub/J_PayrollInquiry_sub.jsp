<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	function searchId(){
    var id = $('.searchId').val();
  	 var url="J_searchId_sub?id=" + id;
   	window.open(url, "J_searchId", "menubar=no, width=1000, height=560");
	}
    
    function back(id,name){
    	opener.document.searchform.id.value=id;
    	opener.document.searchform.name.value=name;
    	self.close();
    }
    
    //검색 결과값으로 정보 가져오기
    function searchPayrollInquiry() {
    	var id = $('#id').val();
    	var name = $('#name').val();
    	var month = $('#month').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/admin/searchPayrollInquiry', //컨트롤러/basic1_sub로 가라
			type : 'POST',
			data : {
				'id' : id,
				'name' : name,
				'month' : month
			}, //전송할 데이터
			success : function(result) { //콜백함수 - 정상적으로 처리되었을 때의 결과가 result에 들어간다.
				//변수명이 반드시 .html(result)일 필요는 없으나 위 콜백함수의 변수명result와 일치해야 한다.
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
			<h2>급여 조회</h2>
		</div>
		<div>
			<form  method="post"
				name="searchform">
				<table border="1" style="width:1800px;">
					<tr>
						<th width="10%">사업장</th>
						<c:forEach var="dto" items="${dtoss}">
						<td width="10%">${dto.c_name}</td>
						</c:forEach>
						<th width="10%">*급여년월</th>
						<td width="20%"><input type="month" class="month" value="month"></td>
						<td width="5%">아이디</td>
						<td width="25%">
						<input type="text" class="searchId" id="id">
						<button onclick="searchId()">검색</button>
						<input type="text" class="searchName" name="name">
						</td>
						<td><button onclick="searchPayrollInquiry()">검색</button></td>
					</tr>
				</table>
				<div id="result"></div>
			</form>
		</div>
	</article>
</section>