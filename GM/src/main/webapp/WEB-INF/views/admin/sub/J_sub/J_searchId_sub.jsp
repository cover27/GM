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
<style>
	tr:last-child td {
		border-bottom: 1px #c0c0c0 solid !important;
	}
</style>
<link rel="stylesheet" href="${path}css/J_style.css" />
<div class="content">
	<div class="search-wrap" style="margin-bottom: 0">
		<div class="form-group">
			<form action="J_searchId_sub"method="post" name="searchform">
				<span class="bold5px">아이디 : </span>
				<span><input type="text" value="${id}" name="id"></span>
				<span><input type="submit" value="검색"></span>
			</form>
		</div>
	</div>
	<div class="salary_info_result" style="margin-top: 0;">
		<table>
			<thead>
				<tr>
					<th>사업장</th>
					<th>사원번호</th>
					<th>성명</th>
					<th>부서</th>
					<th>직급</th>
					<th>선택</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${cnt > 0}">
					<c:forEach var="dto" items="${dtos}">
						<tr id="ttr">
							<td>${dto.name}</td>
							<td>${dto.id}</td>
							<td>${dto.name}</td>
							<td>${dto.j_name}</td>
							<td>${dto.r_name}</td>
							<td><input class="inputButton" type="button" value="확인" onclick="back('${dto.id}','${dto.name}')" style="background:#555; width:40px;"></td>
						</tr>
					</c:forEach>
				</c:if>
				<!-- 게시글이 없으면 -->
				<c:if test="${cnt == 0}">
					<tr>
						<td colspan="3" align="center">정보가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</div>

