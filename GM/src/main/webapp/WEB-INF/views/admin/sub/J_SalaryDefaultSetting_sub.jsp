<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.gm.vo.MemberVO" %>
<script type="text/javascript">
    /* 클릭한 요소의 색깔을 변경 */
    $(function() {
        $(".select").click(function() {
            var selector = '.selected';
            $(selector).removeClass('selected');
            $(this).siblings().addClass("selected")
            $(this).addClass("selected")
        })
    });

    function J_info(id, j_name, r_name) {
        // alert(id);
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/J_info', //컨트롤러/basic1_sub로 가라
            type: 'POST',
            data: {
                'id': id,
                'j_name': j_name,
                'r_name': r_name
            }, //전송할 데이터
            success: function(result) { //콜백함수 - 정상적으로 처리되었을 때의 결과가 result에 들어간다.
                //변수명이 반드시 .html(result)일 필요는 없으나 위 콜백함수의 변수명result와 일치해야 한다.
                $('#result').html(result);
            },
            error: function() {
                alert('오류');
            }
        });
    };
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
                        <span class="bold5px">사업장 :</span>
                        <span>
                            <c:forEach var="dto" items="${dtoss}">
                                <span name="search_title" id="search_title" class="bold5px">${dto.c_name}</span>
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
                    </form>
                </div>
            </div>
            <h3>기본정보</h3>
            <div class="table_top">
            	<table>
            		<thead>
                        <tr>
                            <th style="width: 157px">사원번호</th>
							<th style="width: 157px">성명</th>
							<th style="width: 157px">직급</th>
							<th style="width: 157px">부서</th>
							<th style="width: 157px">입사일자</th>
							<th style="width: 236px">휴대폰</th>
							<th class="scrollbar_bro">E-MAIL</th>
							<th style="width: 5px"></th>
                        </tr>
                    </thead>
            	</table>
            </div>
            <div class="salary_info">
                <table>
                    <colgroup>
                        <col width="10%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col width="15%" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
                        <c:if test="${cnt > 0}">
                            <c:forEach var="dto" items="${dtos}">
                                <tr>
                                    <td onclick="J_info('${dto.id}','${dto.j_name}','${dto.r_name}')" class="select">${dto.id}</td>
                                    <td onclick="J_info('${dto.id}','${dto.j_name}','${dto.r_name}')" class="select">${dto.name}</td>
                                    <td onclick="J_info('${dto.id}','${dto.j_name}','${dto.r_name}')" class="select">${dto.r_name}</td>
                                    <td onclick="J_info('${dto.id}','${dto.j_name}','${dto.r_name}')" class="select">${dto.j_name}</td>
                                    <td onclick="J_info('${dto.id}','${dto.j_name}','${dto.r_name}')" class="select">${dto.enterday}</td>
                                    <td onclick="J_info('${dto.id}','${dto.j_name}','${dto.r_name}')" class="select">${dto.tel}</td>
                                    <td onclick="J_info('${dto.id}','${dto.j_name}','${dto.r_name}')" class="select left_align">${dto.email_in}</td>
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
            <div class="subtitle mt60">
                <h3>상세정보(급여기본)</h3>
            </div>
            <div id="result" class="salary_info_result">
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
                        <th>주민번호(앞)</th>
                        <td></td>
                        <th>성별</th>
                        <td></td>
                        <th>핸드폰</th>
                        <td></td>
                        <th>국적</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>입사일자</th>
                        <td></td>
                        <th>연차</th>
                        <td></td>
                        <th>E-MAIL</th>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <th>*연봉</th>
                        <td colspan="3"></td>
                        <th>*계좌번호</th>
                        <td colspan="3"></td>
                    </tr>
                </table>
            </div>
        </div>
    </article>
</section>