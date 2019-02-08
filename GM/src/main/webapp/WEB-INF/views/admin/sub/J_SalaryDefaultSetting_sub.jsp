<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.gm.vo.MemberVO" %>
<script type="text/javascript">
	function load(url) {
		//요청 : url 즉 news1.jsp, news2.jsp, news3.jsp
		//sendRequest(callback, url, method, params){}
		sendRequest(loadNews_callback, url, "post"); //url로 이동 -> 콜백함수로 리턴
	}
	/*
	 콜백함수
	 -서버로부터 응답이 오면 동작할 함수(시스템이 자동으로 호출한다.)
	 -콜백함수명은 sendRequest(콜백함수명)과 일치해야 한다.
	 -loadNews_callback : 콜백함수, result = 출력위치
	 */
	function loadNews_callback() {
		var result = document.getElementById("result");
		if (httpRequest.readyState == 4) { // 4 : completed : 전체 데이터가 취득 완료된 상태
			if (httpRequest.status == 200) { // 200 : 정상종료
				//result.innerHTML = "정상종료";
				result.innerHTML = httpRequest.responseText;
			} else {
				result.innerHTML = "에러발생";
			}
		} else {
			result.innerHTML = "상태 :" + httpRequest.readyStatus;
		}
	}
	
</script>
<section>
    <article>
        <div class="content_header">
            <h2>급여기본정보관리</h2>
        </div>
        <div class="content">
            <div class="search-wrap">
                <div class="form-group">
                    <form action="J_SalaryDefaultSetting" method="post" name="searchform">
                    	<span>사업장 :</span>
                    	<c:forEach var="dto" items="${dtoss}">
							<span name="search_title" id="search_title">${dto.c_name}</span>
						</c:forEach>
						<span>
							<select name="search_title">
								<!-- 성명,사원번호,부서: 일반사용자 disabled 자신의 사원번호 -->
								<option value="allList">전체보기</option>
								<option value="name">성명</option>
								<option value="depart">부서</option>
								<option value="id">사원아이디</option>
							</select>
						</span>
						<span>
							<input type="text" name="search_content" placeholder="검색 내용">
						</span>
						<span>
							<input type="submit" value="검색">
						</span>
					</form>
                </div>
            </div>
            <h3>기본정보</h3>
            <div class="salary_info">
            	<table>
            		<colgroup>
            			<col width="5%" />
            			<col width="5%" />
            			<col width="5%" />
            			<col width="5%" />
            			<col width="5%" />
            			<col width="5%" />
            			<col width="50%" />
            		</colgroup>
            		<thead>
            			<tr>
	                        <th>
	                        	사원번호
	                        </th>
	                        <th>
	                        	성명
	                        </th>
	                        <th>
	                        	직급
	                        </th>
	                        <th>
	                        	부서
	                        </th>
	                        <th>
	                        	입사일자
	                        </th>
	                        <th>
	                        	휴대폰
	                        </th>
	                        <th>
	                            E-MAIL
	                        </th>
	                    </tr>
            		</thead>
					<tbody>
						<c:if test="${cnt > 0}">
							<c:forEach var="dto" items="${dtos}">
								<tr>
									<td onclick="load('J_info?id=${dto.id}')" style="cursor: pointer;">${dto.id}</td>
									<td>${dto.name}</td>
									<td>${dto.rank}</td>
									<td>${dto.j_name}</td>
									<td>${dto.enterday}</td>
									<td>${dto.tel}</td>
									<td>${dto.email_in}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
                    <!-- 게시글이 없으면 -->
                    <c:if test="${cnt == 0}">
                        <tr>
                            <td colspan="7">게시글이 없습니다. 글을 작성해주세여.</td>
                        </tr>
                    </c:if>
                </table>
            </div>
            <div class="paging">
				<c:if test="${cnt > 0}">
				    <c:if test="${startPage > pageBlock}">
				        <a href="J_SalaryDefaultSetting">[◀◀]</a>
				        <a href="J_SalaryDefaultSetting?pageNum=${startPage - pageBlock}">[◀]</a>
				    </c:if>
				
				    <c:forEach var="i" begin="${startPage}" end="${endPage}">
				        <c:if test="${i == currentPage}">
				            <span><b>[${i}]</b></span>
				        </c:if>
				
				        <c:if test="${i != currentPage}">
				            <a href="J_SalaryDefaultSetting?pageNum=${i}">[${i}]</a>
				        </c:if>
				    </c:forEach>
				
				    <c:if test="${pageCount > endPage}">
				        <a href="J_SalaryDefaultSetting?pageNum=${startPage + pageBlock}">[▶]</a>
				        <a href="J_SalaryDefaultSetting?pageNum=${pageCount}">[▶▶]</a>
				    </c:if>
				</c:if>
            </div>
            <div class="subtitle">
                <h3>상세정보(급여기본)</h3>
            </div>
            <div id="result">
                <table>
                    <tr>
                        <td>사원번호</td>
                        <td></td>
                        <td>부서</td>
                        <td></td>
                        <td>직급</td>
                        <td></td>
                        <td>성명</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>주민번호(앞)</td>
                        <td></td>
                        <td>성별</td>
                        <td></td>
                        <td>핸드폰</td>
                        <td></td>
                        <td>국적</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>입사일자</td>
                        <td></td>
                        <td>연차</td>
                        <td></td>
                        <td colspan="2">E-MAIL</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2">*연봉</td>
                        <td></td>
                        <td colspan="2">*계좌번호</td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </div>
    </article>
</section>