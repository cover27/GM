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
    <form action="J_infoUpdate" method="post" name="infoform">
        <table>
            <c:forEach var="dto" items="${dtos}">
                <tr>
                    <th>사원번호</th>
                    <td>${dto.id}</td>
                    <th>부서</th>
                    <td>${j_name}</td>
                    <th>직급</th>
                    <td>${r_name}</td>
                    <th>성명</th>
                    <td>${dto.name}</td>
                </tr>
                <tr>
                    <th>주민번호(앞)</th>
                    <td>${dto.jumin1}</td>
                    <th>성별</th>
                    <td>${dto.gender}</td>
                    <th>핸드폰</th>
                    <td>${dto.tel}</td>
                    <th>국적</th>
                    <td>${dto.nation}</td>
                </tr>
                <tr>
                    <th>입사일자</th>
                    <td>${dto.enterday}</td>
                    <th>연차</th>
                    <td>${dto.year}년차</td>
                    <th>E-MAIL</th>
                    <td colspan="3" class="left_align">${dto.email_in}</td>
                </tr>
                <tr>
                    <th>*연봉</th>
                    <td colspan="3" class="left_align"><input type="text" name="salary" value="${dto.salary}"></td>
                    <th>*계좌번호</th>
                    <td colspan="3" class="left_align"><input type="text" name="account_number" value="${dto.account_number}"></td>
                </tr>
                <input type=hidden name="id" value="${dto.id}">
            </c:forEach>
        </table>
        <div class="btnset">
            <input type="submit" value="수정">
        </div>
        <div class="clear"></div>
    </form>
</body>
</html>
