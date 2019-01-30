<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section>
	<article>
		<div class="content_header">
			<h2>전체 구성원 목록</h2>
		</div>
<%-- 		EL 태그 - 서비스단 작업요망
		<table style="width:1000px" align="center">
			<tr>
				<th colspan="6" align="center" style="height:25px">
					전체 구성원  ${cnt} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="writeForm?pageNum=${pageNum}"> 개인 그룹에 추가 </a>
				</th>
			</tr>
			
			<tr>
				<th style="width:5%">☆</th><!-- 체크시 "자주 연락하는 사람" 목록에 추가 -->
				<th style="width:15%">이름</th>
				<th style="width:5%">성별</th>
				<th style="width:5%">국적</th>
				<th style="width:5%">소속그룹명</th>
				<th style="width:15%">휴대전화번호</th>
				<th style="width:15%">회사이메일</th>
				<th style="width:15%">외부이메일</th>
				<th style="width:10%">등록일</th>
			</tr>
			
			<!-- 구성원이 있으면 -->
			<c:if test="${cnt>0}">
				<c:forEach var="dto" items="${dtos}">
					<tr>
						<td>
							${dto.☆}
						</td>
						
						<td>
							${dto.name}
						</td>
						
						<td>
							${dto.gender}
						</td>
						
						<td>
							${dto.nation}
						</td>
						
						<td>
							${dto.depart}
						</td>
						
						<td>
							${dto.tel}
						</td>
						
						<td>
							${dto.email_in}
						</td>
						
						<td>
							${dto.email_out}
						</td>
						
						<td>
							<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.enterday}"/>
						</td>

					</tr>

				</c:forEach>
			</c:if>	
	
			<!-- 멤버가 없으면 -->
			<c:if test="${cnt==0}">
				<tr>
					<td colspan="6" align="center">
						멤버가 없습니다. 멤버를 등록해주세요!!
					</td>
				</tr>
			</c:if>
		</table>
		
		<!-- 페이지 컨트롤 -->
		<div style="overflow-y: scroll; height:400px;">		<!-- 상하 스크롤바 -->
		<table style="width:1000px" align="center">
			<tr>
				<th align="center">
					<!-- 멤버가 있으면 -->
					<c:if test="${cnt > 0}">
						<!-- 처음[◀◀] / 이전블록[◀]  -->
						<c:if test="${startPage > pageBlock}">
							<a href="/pages/organizationList">[◀◀]</a>
							<a href="/pages/organizationList?pageNum=${endPage - pageBlock}">[◀]</a>
						</c:if>
						
						<!-- 블록 내의 페이지 번호 -->
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i==currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i!=currentPage}">
								<a href="/pages/organizationList?pageNum=${i}">[${i}]</a>
							</c:if>
						</c:forEach>
						
						<!-- 다음블록 [▶]  /  마지막 [▶▶]  -->
						<c:if test="${pageCount > endPage}">
							<a href="/pages/organizationList?pageNum=${startPage + pageBlock}">[▶]</a>
							<a href="/pages/organizationList?pageNum=${pageCount}">[▶▶]</a>
						</c:if>
						
					</c:if>
				</th>
			</tr>
		</table>
		</div>			 --%>


	</article>
</section>