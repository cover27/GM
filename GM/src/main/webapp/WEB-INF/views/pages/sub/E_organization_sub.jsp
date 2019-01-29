<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section>
	<article>
		<div class="content_header">
			<h2>전체 구성원 목록</h2>
		</div>


		<table style="width:1000px" align="center">
			<tr>
				<th colspan="6" align="center" style="height:25px">
					전체  ${cnt} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="writeForm?pageNum=${pageNum}"> 개인 그룹에 추가 </a>
				</th>
			</tr>
			
			<tr>
				<th style="width:15%">이미지</th>
				<th style="width:25%">이름</th>
				<th style="width:10%">소속그룹명</th>
				<th style="width:15%">휴대폰번호</th>
				<th style="width:5%">이메일</th>
			</tr>
			
			<!-- 메모가 있으면 -->
			<c:if test="${cnt>0}">
			
				<c:forEach var="dto" items="${dtos}">
					<tr>
						<td>
							${number}
							<c:set var="number" value="${number - 1}"/>
							(${dto.ref} / ${dto.ref_step} / ${dto.ref_level})
						</td>
						
						<td>
							${dto.writer}
						</td>
						
						<td>
							<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.reg_date}"/>
						</td>
						
						<td>
							${dto.readCnt}
						</td>
						
						<td>
							${dto.ip}
						</td>
					</tr>
	
				</c:forEach>
			</c:if>
	
			<!-- 메모가 없으면 -->
			<c:if test="${cnt==0}">
				<tr>
					<td colspan="6" align="center">
						메모가 없습니다. 메모 작성해주세요!!
					</td>
				</tr>
			</c:if>
		</table>
		
		<!-- 페이지 컨트롤 -->
		<table style="width:1000px" align="center">
			<tr>
				<th align="center">
					<!-- 게시글이 있으면 -->
					<c:if test="${cnt > 0}">
						<!-- 처음[◀◀] / 이전블록[◀]  -->
						<c:if test="${startPage > pageBlock}">
							<a href="organizationList">[◀◀]</a>
							<a href="organizationList?pageNum=${endPage - pageBlock}">[◀]</a>
						</c:if>
						
						<!-- 블록 내의 페이지 번호 -->
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i==currentPage}">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i!=currentPage}">
								<a href="organizationList?pageNum=${i}">[${i}]</a>
							</c:if>
						</c:forEach>
						
						<!-- 다음블록 [▶]  /  마지막 [▶▶]  -->
						<c:if test="${pageCount > endPage}">
							<a href="organizationList?pageNum=${startPage + pageBlock}">[▶]</a>
							<a href="organizationList?pageNum=${pageCount}">[▶▶]</a>
						</c:if>
						
					</c:if>
				</th>
			</tr>
		</table>

		
	</article>
</section>