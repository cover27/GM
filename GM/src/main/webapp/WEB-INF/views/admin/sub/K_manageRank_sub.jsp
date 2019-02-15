<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

	function moveUp(el){
		var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
		$tr.prev().before($tr); // 현재 tr 의 이전 tr 앞에 선택한 tr 넣기
	}
	
	function moveDown(el){
		var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
		$tr.next().after($tr); // 현재 tr 의 다음 tr 뒤에 선택한 tr 넣기
	}

</script>
<section>
	<article>
		<%
			int i = 1;
		%>
		<div class="content_header">
			<h2>직급 관리</h2>
		</div>
		<br>
		<form action="<c:url value='/admin/K_manageRank_pro'/>" method="post" name="rankform">
			<table>
				<tr>
					<td>직급명</td>
				</tr>
				<c:forEach var="dto" items="${sessionScope.rankList }">
					<c:if test="${dto.visible == 1}">
						<tr>
							<td>
								<input type="hidden" name="rank" value="${dto.rank }">
								<input type="hidden" name="visible" value="${dto.visible }">
								<input type="text" name="r_name" value="${dto.r_name }">
							</td>
							<td><input type="button" value="삭제" onclick="window.location='K_deleteRank?rank=${dto.rank}';"></td>
							<td>
								<c:if test="<%= i!=1 %>">
									<input type="button" value="위로" onclick="moveUp(this);">
								</c:if>
								<input type="button" value="아래로" onclick="moveDown(this);">
							</td>
						</tr>
					</c:if>
					<c:if test="${dto.visible != 1}">
						<tr style="display : none;">
							<td>
								<input type="hidden" name="rank" value="${dto.rank }">
								<input type="hidden" name="visible" value="${dto.visible }">
								<input type="text" name="r_name" value="${dto.r_name }">
							</td>
							<td><input type="button" value="삭제" onclick="window.location='K_deleteRank?rank=${dto.rank}';"></td>
							<td>
								<c:if test="<%= i!=1 %>">
									<input type="button" value="위로" onclick="moveUp(this);">
								</c:if>
								<input type="button" value="아래로" onclick="moveDown(this);">
							</td>
						</tr>
					</c:if>
					<%
						i++;
					%>
				</c:forEach>
			</table>
		</form>
		<form action="K_addRank" method="post">
			<table>
				<tr>
					<td><input type="text" name="addRank" required></td>
					<td><input type="submit" value="추가"></td>
					<td></td>
				</tr>
			</table>
		</form>
		<input type="submit" value="저장" onclick="document.rankform.submit();">
	</article>
</section>