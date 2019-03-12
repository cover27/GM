<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/views/setting.jsp"%> --%>
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
            <h2>인사정보등록</h2>
        </div>
        <div class="content">
            <div class="search-wrap">
                <div class="form-group">
                    <form action="<c:url value='/admin/K_resistMemberInfo'/>" method="post" name="searchform">
                    	<div class="form-group">
	                        <span class="bold5px">사업장 :</span>
	                        <span>
	                            <c:forEach var="dto" items="${dtos}" begin="0" end="0">
	                                <span name="search_title" id="search_title" class="bold5px">
	                                	${dto.j_name}
	                                </span>
	                            </c:forEach>
	                        </span>
	                        <span class="ml50">
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
	                        <span class="ml50">
	                        	<label><input type='checkbox' name="retire" style="position: relative; top: 2px;">
	                        		<span class="ml3">퇴사자</span>
	                        	</label>
	                        </span>
		                </div>
                    </form>
                </div>
            </div>
            <h3>기본정보</h3>
            <div class="table_head">
            	<table>
            		<colgroup>
            			<col width="180px" />
            			<col width="180px" />
            			<col width="180px" />
            			<col width="180px" />
            			<col width="180px" />
            			<col width="180px" />
            			<col width="*" />
            		</colgroup>
	            	<thead>
		            	<tr>
		            		<th>사원번호</th>
		            		<th>성명</th>
		            		<th>직급</th>
		            		<th>부서</th>
		            		<th>입사일자</th>
		            		<th>휴대폰</th>
		            		<th>E-MAIL</th>
						</tr>
	            	</thead>
            	</table>
            </div>
            <div class="table_body" style="height:386px;">
				<table>
					<colgroup>
            			<col width="180px" />
            			<col width="180px" />
            			<col width="180px" />
            			<col width="180px" />
            			<col width="180px" />
            			<col width="180px" />
            			<col width="*" />
            		</colgroup>
					<c:if test="${cnt > 0}">
						<c:forEach var="dto" items="${dtos}">
							<tbody>
								<tr style="cursor: pointer;">
									<td onclick="load('K_getMemberInfo?id=${dto.id}')">${dto.id}</td>
									<td onclick="load('K_getMemberInfo?id=${dto.id}')">${dto.name}</td>
									<td onclick="load('K_getMemberInfo?id=${dto.id}')">${dto.r_name}</td>
									<td onclick="load('K_getMemberInfo?id=${dto.id}')">${dto.j_name}</td>
									<td onclick="load('K_getMemberInfo?id=${dto.id}')">${dto.enterday}</td>
									<td onclick="load('K_getMemberInfo?id=${dto.id}')">${dto.tel}</td>
									<td onclick="load('K_getMemberInfo?id=${dto.id}')">${dto.email_in}</td>
								</tr>
							</tbody>
						</c:forEach>
					</c:if>
					<!-- 게시글이 없으면 -->
					<c:if test="${cnt == 0}">
						<tr>
							<td colspan="7" align="center">소속인원이 없습니다.</td>
						</tr>
					</c:if>
				</table>
			</div>
            <%-- 
            <div>
                <div>
                    <table>
                        <!-- 페이지 컨트롤 -->
                        <tr>
                            <th colspan="7" align="center">
                                <!-- 게시글이 있으면 -->
                                <c:if test="${cnt >0}">
                                    <!-- 처음[◀◀] / 이전블록[◀]-->
                                    <c:if test="${startPage > pageBlock}">
                                        <a href="K_resistMemberInfo">[PageDown x2]</a>
                                        <a href="K_resistMemberInfo?pageNum=${startPage - pageBlock}">[PageDown]</a>
                                    </c:if>


                                    <!-- 블록내의 페이지 번호 -->
                                    <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                        <c:if test="${i == currentPage}">
                                            <span><b> [${i}] </b></span>
                                        </c:if>
                                        <c:if test="${i != currentPage}">
                                            <a href="K_resistMemberInfo?pageNum=${i}">[${i}]</a>
                                        </c:if>
                                    </c:forEach>
                                    <!-- 다음 블록[▶] /마지막[▶▶] -->
                                    <c:if test="${pageCount > endPage}">
                                        <a href="K_resistMemberInfo?pageNum=${startPage + pageBlock}">[▶]</a>
                                        <a href="K_resistMemberInfo?pageNum=${pageCount}">[▶▶]</a>
                                    </c:if>
                                </c:if>
                            </th>
                        </tr>
                    </table>
                </div>
            </div>
 			--%>

            <div class="subtitle mt60">
                <h3>상세정보(급여기본)</h3>
            </div>
            <div id="result">
                <table>
                    <tr>
                        <th>사원번호</th>
                        <td></td>
                        <th>부서</th>
                        <td></td>
                        <th>직급</th>
                        <td></td>
                        <th>성명</th>
                        <td></td>
                    </tr>


                    <tr>
                        <th>생년월일</th>
                        <td></td>
                        <th>성별</th>
                        <td></td>
                        <th>핸드폰</th>
                        <td></td>
                        <th>재직구분</th>
                        <td></td>
                    </tr>


                    <tr>
                        <th>입사일자</th>
                        <td></td>
                        <th>퇴직일자</th>
                        <td></td>
                        <th>E-MAIL</th>
                        <td colspan="3"></td>
                    </tr>
                </table>
            </div>
        </div>
    </article>
</section>
