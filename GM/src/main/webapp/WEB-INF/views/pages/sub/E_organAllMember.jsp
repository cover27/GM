<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section>
	<article>
		<div class="content_header">
			<h2>전체 구성원 목록</h2>
		</div>
		
		<div>
			
			<table style="width:1500px" align="center">
				<tr>
				<!--<th>
						<select>
							<option>10</option>
							<option>20</option>
							<option>30</option>
							<option>40</option>
							<option>50</option>
						</select>
					</th> -->
					<th colspan="6" align="left" style="height:25px">
						전체&nbsp;&nbsp;  / ${cnt} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</th>
				</tr>
				<tr>
					<th style="width:2%"></th>
					<th style="width:2%"></th>
					<th style="width:5%">이름</th>
					<th style="width:2%">성별</th>
					<th style="width:10%">국적</th>
					<th style="width:10%">소속그룹명</th>
					<th style="width:15%">휴대전화번호</th>
					<th style="width:15%">회사이메일</th><!-- 메일주소 클릭시 해당 메일로 메일쓰기 창 오픈 -->
					<th style="width:15%">외부이메일</th>
					<th style="width:20%">등록일</th>
				</tr>
					
				<div style="overflow-y: scroll; height:400px;">	<!-- 스크롤바 -->
				
					<!-- 구성원이 있으면 -->
					<c:forEach var='dto' items='${list }'>
						<tr>
							<!-- 체크박스 버튼 ▣  -->				 <!-- 체크 그룹 -->
					    	<td><input type="checkbox" name="check" value="nemo"></td>
					    	<!-- 자주 연락하는 사람 등록버튼 ☆ -->
					    	<td><input type="checkbox" name="check" value="star"></td>
						
							<td>	<!-- ( = list.name 꼴 ) -->
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
			</table>
			</div>
			
			<div>
							<!-- 페이지 컨트롤 -->
				<table style="width:1000px" align="center">
					<tr>
						<th align="center">
							<!-- 멤버가 있으면 -->
							<c:if test="${cnt > 0}">
								<!-- 처음[◀◀] / 이전블록[◀]  -->
								<c:if test="${startPage > pageBlock}">
									<a href="<c:url value='/pages/E_organizationList'/>">[◀◀]</a>
									<a href="<c:url value='/pages/E_organizationList?pageNum=${endPage - pageBlock}'/>">[◀]</a>
								</c:if>
								
								<!-- 블록 내의 페이지 번호 -->
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i==currentPage}">
										<span><b>[${i}]</b></span>
									</c:if>
									<c:if test="${i!=currentPage}">
										<a href="<c:url value='/pages/E_organizationList?pageNum=${i}'/>">[${i}]</a>
									</c:if>
								</c:forEach>
								
								<!-- 다음블록 [▶]  /  마지막 [▶▶]  -->
								<c:if test="${pageCount > endPage}">
									<a href="<c:url value='/pages/E_organizationList?pageNum=${startPage + pageBlock}'/>">[▶]</a>
									<a href="<c:url value='/pages/E_organizationList?pageNum=${pageCount}'/>">[▶▶]</a>
								</c:if>
								
							</c:if>
							
						</th>
					</tr>
					
				</table>
			</div>
			
				<ul>
					<li>
	              		<input type="submit" value="개인 그룹에 추가" onclick="<c:url value='/pages/E_organizationList?pageNum=${i}'/>">
	            	</li>
	            </ul>
	        
		</div>

	</article>
</section>