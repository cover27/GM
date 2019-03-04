<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section>
	<article>
		<div class="content_header">
			<h2>자주 연락하는 사람 목록</h2>
		</div>
		
			<table style="width:1500px; align=center; border:2px;">
				<tr>
					<th colspan="6" align="left" style="height:25px">
						전체 자주 연락하는 사람 명수&nbsp;&nbsp;  / ${cnt} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</th>
				</tr>
				<tr>
					<td>아이디</td>
					<td>이름</td>
					<td>핸드폰</td>
					<td>이메일</td>
					<td>삭제<td>
				</tr>
				<!-- 구성원이 있으면 -->
				<c:forEach var='mf_dtos' items='${mf_dtos}'>
					<tr>
							<td>
								${mf_dtos.id}
							</td>
							
							<td>
								<c:forEach var="mem_dtos" items="${mem_dtos}">
									<c:if test="${mf_dtos.id == mem_dtos.id}">
										${mem_dtos.name}
									</c:if>
								</c:forEach>
							</td>
							
							<td>
								<c:forEach var="mem_dtos" items="${mem_dtos}">
									<c:if test="${mf_dtos.id == mem_dtos.id}">
										${mem_dtos.tel}
									</c:if>
								</c:forEach>
							</td>
								<td>
								<c:forEach var="mem_dtos" items="${mem_dtos}">
									<c:if test="${mf_dtos.id == mem_dtos.id}">
										${mem_dtos.email_in}
									</c:if>
								</c:forEach>
							</td>
							
							<td>
								<input type="button" class="inputButton" value="맴버 삭제" onclick="window.location='<c:url value="/pages/E_deleteMemberPro?id=${mf_dtos.id}&pageNum=${pageNum}&number=${number}"/>'">
							</td>
						</tr>
				</c:forEach>
			</table>
		</div>	
				<!-- 페이지 컨트롤 -->
			<table style="width:1000px" align="center">
				<tr>
					<td align="center">
						<!-- 멤버가 있으면 -->
						<c:if test="${memcnt > 0}">
							<!-- 처음[◀◀] / 이전블록[◀]  -->
							<c:if test="${startPage > pageBlock}">
								<a href="<c:url value='/pages/E_departMemberList'/>">[◀◀]</a>
								<a href="<c:url value='/pages/E_departMemberList?pageNum=${endPage - pageBlock}'/>">[◀]</a>
							</c:if>
							
							<!-- 블록 내의 페이지 번호 -->
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i==currentPage}">
									<span><b>[${i}]</b></span>
								</c:if>
								<c:if test="${i!=currentPage}">
									<a href="<c:url value='/pages/E_departMemberList?pageNum=${i}'/>">[${i}]</a>
								</c:if>
							</c:forEach>
							
							<!-- 다음블록 [▶]  /  마지막 [▶▶]  -->
							<c:if test="${pageCount > endPage}">
								<a href="<c:url value='/pages/E_departMemberList?pageNum=${startPage + pageBlock}'/>">[▶]</a>
								<a href="<c:url value='/pages/E_departMemberList?pageNum=${pageCount}'/>">[▶▶]</a>
							</c:if>
						</c:if>
					</td>
				</tr>
			</table>
		</article>