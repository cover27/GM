<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section>
	<article>
		<div class="content_header">
			<h2>모든 메모</h2>
		</div>


		<div style="overflow-y: scroll; height:400px;">	<!-- 스크롤바 -->
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
					<th></th>
					<th style="width:5%">메모장번호</th>
					<th style="width:2%">아이디</th>
					<th style="width:10%">메모장 이름</th>
					<th style="width:10%">메모장등급</th>
					<th style="width:15%">삭제구분</th>
				</tr>
				
				
				<!-- 구성원이 있으면 -->
				<c:forEach var='dto' items='${list }'>
					<tr>
				    	<td><input type="checkbox" name="check" value="v"></td>
					
						<td>	<!-- ( = list.name 꼴 ) -->
							${dto.num}
						</td>
						
						<td>
							${dto.id}
						</td>
						
						<td>
							${dto.name}
						</td>
						
						<td>
							${dto.m_rank}
						</td>
						
						<td>
							${dto.del}
						</td>
						
					</tr>
				</c:forEach>
			</table>
		</div>	
				<!-- 페이지 컨트롤 -->
			<table style="width:1000px" align="center">
				<tr>
					<th align="center">
						<!-- 멤버가 있으면 -->
						<c:if test="${cnt > 0}">
							<!-- 처음[◀◀] / 이전블록[◀]  -->
							<c:if test="${startPage > pageBlock}">
								<a href="<c:url value='/pages/E_memoList'/>">[◀◀]</a>
								<a href="<c:url value='/pages/E_memoList?pageNum=${endPage - pageBlock}'/>">[◀]</a>
							</c:if>
							
							<!-- 블록 내의 페이지 번호 -->
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i==currentPage}">
									<span><b>[${i}]</b></span>
								</c:if>
								<c:if test="${i!=currentPage}">
									<a href="<c:url value='/pages/E_memoList?pageNum=${i}'/>">[${i}]</a>
								</c:if>
							</c:forEach>
							
							<!-- 다음블록 [▶]  /  마지막 [▶▶]  -->
							<c:if test="${pageCount > endPage}">
								<a href="<c:url value='/pages/E_memoList?pageNum=${startPage + pageBlock}'/>">[▶]</a>
								<a href="<c:url value='/pages/E_memoList?pageNum=${pageCount}'/>">[▶▶]</a>
							</c:if>
						</c:if>
					</th>
				</tr>
				
				<tr>
	                <th colspan="2">
	                    <input class="inputButton" type="submit" value="등록" onclick="<c:url value='/pages/E_memoList?pageNum=${i}'/>">
	                    <input class="inputButton" type="submit" value="이동" onclick="<c:url value='/pages/E_memoList?pageNum=${i}'/>">
	                    <input class="inputButton" type="reset" value="삭제"/>
	                </th>
		        </tr>
			
			</table>


	</article>
</section>