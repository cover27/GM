<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
	<article>
		<div class="content_header">
			<h2>사용자 조직도 관리</h2>
		</div>
		<br>
		<table>
			<c:forEach var="depart" items="${groupsList }">
				<tr>
					<th>${depart.g_name }</th>
				</tr>
			</c:forEach>
			<c:forEach var="dto" items="${mgiList }">
				<c:if test="${dto.leader == 1 }">
					<tr style="background-color : grey;">
						<th>${dto.name}</th>
						<th>${dto.departName}</th>
						<th>${dto.rankName}</th>
						<th>${dto.tel}</th>
						<th>${dto.email}</th>
					</tr>
				</c:if>
				<c:if test="${dto.leader == 0 }">
					<tr>
						<th>${dto.name}</th>
						<th>${dto.departName}</th>
						<th>${dto.rankName}</th>
						<th>${dto.tel}</th>
						<th>${dto.email}</th>
					</tr>
				</c:if>
				
			</c:forEach>
		</table>
		
	</article>
</section>