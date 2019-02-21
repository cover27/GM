<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function approve(num){
		var url="P_payApprove?num="+num;
		window.open(url, "confirm", "menubar=no, width=600, height=300");
	}
</script>
<section>
	<article>
		<div class="content_header">
			<h2>결재상세</h2>
		</div>
		<br>
		<table border="1">
			<tr>
				<td>
					<table border="1">
						<tr>
							<c:forEach var="war" items="${groupInfo }">
								<c:if test="${war.rank_mem > 0 }">
									<c:if test="${war.rank_mem == 1 }">
										<th>기안</th>
									</c:if>
									<c:if test="${war.rank_mem > 1 }">
										<th>결재</th>
									</c:if>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="war" items="${groupInfo }">
								<c:if test="${war.rank_mem > 0 }">
									<th>
										${war.name }&nbsp;${war.r_name }<br>
										<c:forEach var="war2" items="${paymentInfo }">
											<c:if test="${war.id == war2.id }">
												<c:if test="${war2.agree == 1 }">
													${war2.result }<br>${war2.reg_date }
												</c:if>
												<c:if test="${war2.agree == 0 }">
													-
												</c:if>
											</c:if>
										</c:forEach>
									</th>
								</c:if>
							</c:forEach>								
						</tr>
						<tr>
							<c:forEach var="war" items="${groupInfo }">
								<c:if test="${war.rank_mem == 0 }">
									<th>합의</th>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="war" items="${groupInfo }">
								<c:if test="${war.rank_mem == 0 }">
									<th>
										${war.name }&nbsp;${war.r_name }<br>
										<c:forEach var="war2" items="${paymentInfo }">
											<c:if test="${war.id == war2.id }">
												<c:if test="${war2.agree == 1 }">
													${war2.result }<br>${war2.reg_date }
												</c:if>
												<c:if test="${war2.agree == 0 }">
													-
												</c:if>
											</c:if>
										</c:forEach>
									</th>
								</c:if>
							</c:forEach>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br><hr><br>
		<table>
			<tr>
				<th>제목</th>
				<td>${eachPayment.subject }</td>
			</tr>
			<tr>
				<th>기안자</th>
				<td>${eachPayment.id }</td>
				<th>상태</th>
				<td>${eachPayment.state }</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${eachPayment.reg_date }</td>
				<th>만료일</th>
				<td>${eachPayment.deadline }</td>
			</tr>
			<tr>
				<td>${eachPayment.content }</td>
			</tr>
		</table>
		<br>
		<table>
			<c:forEach var="dto" items="${paymentInfo }">
				<c:if test="${dto.id == id }">
					<c:if test="${dto.agree == 0 }">
						<c:if test="${dto.rank == 0 }">
							<tr>
								<td>
									<input type="button" value="합의">
									<input type="button" value="반려">
								</td>
							</tr>
						</c:if>
						<c:if test="${dto.rank != 0 }">
							<tr>
								<td>
									<input type="button" value="결재" onclick="approve('${num}');">
									<input type="button" value="반려">
								</td>
							</tr>
						</c:if>
					</c:if>
				</c:if>
			</c:forEach>
		</table>
	</article>
</section>