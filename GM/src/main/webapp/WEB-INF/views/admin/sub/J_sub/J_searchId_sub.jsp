<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<script type="text/javascript">
    function back(id,name){
    	opener.document.searchform.id.value=id;
    	opener.document.searchform.name.value=name;
    	self.close();
    }
</script>
<div>
	<form method="post" name="searchform">
		<table border="1" style="width: 600px;">
			<tr>
				<td width="10%">아이디</td>
				
				<td width="25%">
					<button onclick="searchId()">검색</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<table border="1" style="width: 600px;" class="example-table-1">
	<tr>
		<td style="text-align: center; background-color: #cccccc;">사업장</td>
		<td style="text-align: center; background-color: #cccccc;">사원번호</td>
		<td style="text-align: center; background-color: #cccccc;">성명</td>
		<td style="text-align: center; background-color: #cccccc;">부서</td>
		<td style="text-align: center; background-color: #cccccc;">직급</td>
		<td></td>
	</tr>
	<c:if test="${cnt > 0}">
		<c:forEach var="dto" items="${dtos}">
			<tr id="ttr">
				<td>${dto.name}</td>
				<td>${dto.id}</td>
				<td>${dto.name}</td>
				<td>${dto.j_name}</td>
				<td>${dto.rank}</td>
				<td><input class="inputButton" type="button" value="확인" onclick="back('${dto.id}','${dto.name}')"></td>
			</tr>
		</c:forEach>
	</c:if>
	<!-- 게시글이 없으면 -->
	<c:if test="${cnt == 0}">
		<tr>
			<td colspan="3" align="center">정보가 없습니다.</td>
		</tr>
	</c:if>
</table>
<div class="col-lg-12" id="ex1_Result1"></div>
<div class="col-lg-12" id="ex1_Result2"></div>
