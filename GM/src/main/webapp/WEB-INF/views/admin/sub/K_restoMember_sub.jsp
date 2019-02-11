<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.gm.vo.MemberVO" %>
<section>
	<%
		int companyCode = ((MemberVO)request.getSession().getAttribute("loginInfo")).getCompany();
	%>
	<article>
		<div class="content_header">
			<h2>인사정보 재등록</h2>
		</div>
		<br>
		<form action="K_restoMember" method="post">
			<table>
				<tr>
					<th>이름 : </th>
					<td><input type="text" name="name" value="${name }"></td>
					<td><input type="submit" value="검색"></td>
				</tr>
			</table>
		</form>
		<form action="K_restoMember_pro" name="restoform" method="post">
			<div style="overflow-y: scroll; height: 200px;">
				<table>
					<tr>
						<td>선택</td>
						<td>아이디</td>
						<td>성명</td>
						<td>휴대전화번호</td>
						<td>E-MAIL</td>
						<td>생년월일</td>
					</tr>
					<c:if test="${cnt > 0}">
						<c:forEach var="dto" items="${retireList}">
							<tr>
								<td><input type="radio" name="check" value="${dto.id}" required></td>
								<td>${dto.id}</td>
								<td>${dto.name}</td>
								<td>${dto.tel}</td>
								<td>${dto.email_in}</td>
								<td>${dto.jumin1}</td>
							</tr>
						</c:forEach>
					</c:if>
					<!-- 게시글이 없으면 -->
					<c:if test="${cnt == 0}">
						<tr>
							<td colspan="7" align="center">게시글이 없습니다. 글을 작성해주세여.</td>
						</tr>
					</c:if>
				</table>
			</div>
			<div>
				<table>
					<!-- 페이지 컨트롤 -->
					<tr>
						<th colspan="7" align="center">
							<!-- 게시글이 있으면 --> <c:if test="${cnt >0}">
								<!-- 처음[◀◀] / 이전블록[◀]-->
								<c:if test="${startPage > pageBlock}">
									<a href="K_restoMember">[PageDown x2]</a>
									<a
										href="K_restoMember?pageNum=${startPage - pageBlock}">[PageDown]</a>
								</c:if>
	
	
								<!-- 블록내의 페이지 번호 -->
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i == currentPage}">
										<span><b> [${i}] </b></span>
									</c:if>
									<c:if test="${i != currentPage}">
										<a href="K_restoMember?pageNum=${i}">[${i}]</a>
									</c:if>
								</c:forEach>
								<!-- 다음 블록[▶] /마지막[▶▶] -->
								<c:if test="${pageCount > endPage}">
									<a
										href="K_restoMember?pageNum=${startPage + pageBlock}">[▶]</a>
									<a href="K_restoMember?pageNum=${pageCount}">[▶▶]</a>
								</c:if>
							</c:if>
						</th>
					</tr>
					<tr>
						<th>부서설정</th>
						<td>
							<select name="depart">
								<option value='<%=companyCode%>' selected>${company }</option>
								<c:forEach var="depart" items="${groupsList }">
									<option value='${depart.groupId }'>▶${depart.g_name }</option>
								</c:forEach>
							</select>
						</td>
						<th>직급설정</th>
						<td>
							<select name="rank">
								<c:forEach var="rank" items="${gradeList }">
									<option value='${rank.rank }'>▶${rank.r_name }</option>
								</c:forEach>
							</select>
						</td>
						<th>
							<input type="submit" value="복구">
						</th>
					</tr>
				</table>
			</div>
		</form>
	</article>
</section>