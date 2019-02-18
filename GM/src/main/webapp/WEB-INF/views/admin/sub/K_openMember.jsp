<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>

<body>
    <form action="K_infoUpdate" method="post" name="infoform">
        <table>
            <tr>
                <th>사원번호</th>
                <td>${dto.id}</td>
                <th>부서</th>
                <td>
                    <c:if test="${dto.del == 1 }">
                        ${company }
                    </c:if>
                    <c:if test="${dto.del == 0 }">
                        <select name="depart">
                            <c:if test="${dto.depart <= 410000000 }">
                                <option value='${dto.depart }'>${company }</option>
                            </c:if>
                            <c:if test="${dto.depart > 410000000 }">
                                <option value='${dto.depart }' selected>${company }</option>
                            </c:if>
                            <c:forEach var="depart" items="${groupsList }">
                                <c:if test="${bf_groups == depart.getG_name() }">
                                    <option value='${depart.getGroupId() }' selected>▶${depart.getG_name() }</option>
                                </c:if>
                                <c:if test="${bf_groups != depart.getG_name() }">
                                    <option value='${depart.getGroupId() }'>▶${depart.getG_name() }</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </c:if>
                </td>
                <th>직급</th>
                <td>
                    <c:if test="${dto.del == 1 }">
                        ${bf_grade }
                    </c:if>
                    <c:if test="${dto.del == 0 }">
                        <select name="rank" required>
                            <c:if test="${bf_grade == 'unknown' }">
                                <option value="">미부여</option>
                            </c:if>
                            <c:forEach var="rank" items="${gradeList }">
                                <c:if test="${bf_grade == rank.getR_name() }">
                                    <option value='${rank.getRank() }' selected>${rank.getR_name() }</option>
                                </c:if>
                                <c:if test="${bf_grade != rank.getR_name() }">
                                    <option value='${rank.getRank() }'>${rank.getR_name() }</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </c:if>
                </td>
                <th>성명</th>
                <td>${dto.name}</td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td>${dto.jumin1}</td>
                <th>성별</th>
                <td>
                    <c:if test="${dto.gender == 1}">
                      	  남성
                    </c:if>
                    <c:if test="${dto.gender == 2}">
                       	 여성
                    </c:if>
                </td>
                <th>핸드폰</th>
                <td>${dto.tel}</td>
                <th>재직구분</th>
                <td>
                    <c:if test="${dto.wrkdvd == 3 }">
                    	퇴직
                    </c:if>
                    <c:if test="${dto.wrkdvd != 3 }">
                        <select name="wrkdvd">
                            <c:if test="${dto.wrkdvd == 1 }">
                                <option value="1" selected>재직</option>
                            </c:if>
                            <c:if test="${dto.wrkdvd != 1 }">
                                <option value="1">재직</option>
                            </c:if>
                            <c:if test="${dto.wrkdvd == 2 }">
                                <option value="2" selected>휴직</option>
                            </c:if>
                            <c:if test="${dto.wrkdvd != 2 }">
                                <option value="2">휴직</option>
                            </c:if>
                        </select>
                    </c:if>
                </td>
            </tr>
            <tr>
                <th>입사일자</th>
                <td>
                    <c:if test="${dto.del == 1 }">
                        ${dto.enterday }
                    </c:if>
                    <c:if test="${dto.del == 0 }">
                        <input type="date" name="enterday" value="${dto.enterday }">
                    </c:if>
                </td>
                <th>퇴직일자</th>
                <td>${dto.retireday}</td>
                <th>E-MAIL</th>
                <td colspan="3">${dto.email_in}</td>
            </tr>
        </table>
        <input type="hidden" name="checkRank" value="${bf_grade }">
        <input type=hidden name="id" value="${dto.id}">
        <c:if test="${dto.del == 0 }">
        	<div class="btnset">
	        	<input type="submit" value="저장">
	            <input type="button" value="퇴사자 등록" onclick='window.location="<c:url value='/admin/K_registRetirement?id=${dto.id }' />";'>
        	</div>
        </c:if>
    </form>
</body>

</html>