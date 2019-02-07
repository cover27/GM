<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="K_infoUpdate" method="post" name="infoform">

		<table cellpadding="0" cellspacing="0" class="obj row20px"
			style="width: 1197px; table-layout: fixed;" text-align="center">
				<tr>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">사원번호</td>
						<td>${dto.id}</td>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">부서</td>
						<td>
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
						</td>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">직급</td>
						<td>
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
						</td>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">성명</td>
						<td>${dto.name}</td>
				</tr>
				
				
				<tr>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">생년월일</td>
						<td>${dto.jumin1}</td>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">성별</td>
						<td>
							<c:if test="${dto.gender == 1}">
								남성
							</c:if>
							<c:if test="${dto.gender == 2}">
								여성
							</c:if>
						</td>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">핸드폰</td>
						<td>${dto.tel}</td>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">재직구분</td>
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
					<td style="text-align: center; cursor: default; background-color: #cccccc;">입사일자</td>
						<td>
							<input type="date" name="enterday" value="${dto.enterday }">
						</td>
					<td style="text-align: center; cursor: default; background-color: #cccccc;">퇴직일자</td>
						<td>${dto.retireday}</td>
					<td style="text-align: center; cursor: default; background-color: #cccccc;" colspan="2">E-MAIL</td>
						<td>${dto.email_in}</td>
				</tr>
				
		</table>
		<input type="hidden" name="checkRank" value="${bf_grade }">
		<input type=hidden name="id" value="${dto.id}">
		<input type="submit" value="저장">
		<input type="button" value="퇴사자 등록" onclick='window.location="<c:url value='/admin/K_registRetirement?id=${dto.id }' />";'>
	</form>
</body>
</html>