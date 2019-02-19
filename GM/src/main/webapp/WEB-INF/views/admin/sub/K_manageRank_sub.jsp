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
<style>
	table {
		font-size: 14px;
		line-height: 24px;
	}
	
	tr:hover {
		background: #fbeded;
		transition: 0.3s;
	}
	
	th, td {
		height: 48px;
	}
	
	th {
		border-right: 1px #e5e5e5 solid;
		border-bottom: 1px #c0c0c0 solid;
		background: #f5f5f5;
		padding: 5px 0;
	}
	
	th:last-child {
		border-right: none;
	}
	
	td {
		border-right: 1px #e5e5e5 solid;
		border-bottom: 1px #e5e5e5 solid;
		padding: 5px 0;
		text-align: center;
		cursor: pointer;
	}
	
	 td:last-child {
		border-right: none;
	}
		
	
	tr:last-child td {
		border-bottom: 1px #c0c0c0 solid;
	}
	
	input[type="submit"], input[type="button"] {
		font-size: 1em !important;
		padding: 5px 10px !important;
	}
	
	.upBtn {
		width: 48px;
		height: 28px;
		background: url(../resources/images/up_btn.gif) #555 no-repeat 50% 50% !important;
	}
	
	.downBtn {
		width: 48px;
		height: 28px;
		background: url(../resources/images/down_btn.gif) #555 no-repeat 50% 50% !important;
	}
</style>
<section>
	<article>
		<%
			int i = 1;
		%>
		<div class="content_header">
			<h2>직급 관리</h2>
		</div>
		<div class="content">
			<form action="<c:url value='/admin/K_manageRank_pro'/>" method="post" name="rankform">
				<div class="table_head">
					<table>
							<tr>
								<th>순번</th>
								<th>직급명</th>
								<th>삭제</th>
								<th>순서</th>
							</tr>
							<c:forEach var="dto" items="${sessionScope.rankList }" varStatus="status">
								<c:if test="${dto.visible == 1}">
									<tr>
										<td>${status.count}</td>
										<td>
											<input type="hidden" name="rank" value="${dto.rank }">
											<input type="hidden" name="visible" value="${dto.visible }">
											<input type="text" name="r_name" value="${dto.r_name }">
										</td>
										<td><input type="button" value="삭제" onclick="window.location='K_deleteRank?rank=${dto.rank}';"></td>
										<td>
											<c:if test="<%= i!=1 %>">
												<input type="button" onclick="moveUp(this);" class="upBtn">
											</c:if>
											<input type="button" onclick="moveDown(this);" class="downBtn">
										</td>
									</tr>
								</c:if>
								<c:if test="${dto.visible != 1}">
									<tr style="display : none;">
										<td>${status.count}</td>
										<td>
											<input type="hidden" name="rank" value="${dto.rank }">
											<input type="hidden" name="visible" value="${dto.visible }">
											<input type="text" name="r_name" value="${dto.r_name }">
										</td>
										<td><input type="button" value="삭제" onclick="window.location='K_deleteRank?rank=${dto.rank}';"></td>
										<td>
											<c:if test="<%= i!=1 %>">
												<input type="button" onclick="moveUp(this);" class="upBtn">
											</c:if>
											<input type="button" onclick="moveDown(this);" class="downBtn">
										</td>
									</tr>
								</c:if>
								<%
									i++;
								%>
						</c:forEach>
					</table>
				</div>
			</form>
			<form action="K_addRank" method="post">
				<table>
					<tr>
						<td>새 직급</td>
						<td><input type="text" name="addRank" required autofocus></td>
						<td><input type="submit" value="추가"></td>
						<td><input type="submit" value="저장" onclick="document.rankform.submit();"></td>
					</tr>
				</table>
			</form>
		</div>
	</article>
</section>