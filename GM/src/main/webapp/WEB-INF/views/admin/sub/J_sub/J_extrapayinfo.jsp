<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<button name="addStaff" onclick="addhang();">행 추가</button>
	<form action="J_extrapayinfoUpdate" method="post">
		<table border="1">
			<thead>
				<tr>
					<td style="text-align: center; background-color: #cccccc;">상여금/삭감</td>
					<td style="text-align: center; background-color: #cccccc;">지급/공제(상태)</td>
					<td style="text-align: center; background-color: #cccccc;">금액</td>
					<td style="text-align: center; background-color: #cccccc;">사유</td>
					<td style="text-align: center; background-color: #cccccc;">삭제</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${cnt > 0}">
					<c:forEach var="dto" items="${dtos}">
						<tr name="trStaff">
							<td>${dto.type}</td>
							<td>${dto.state}</td>
							<td>${dto.cost}</td>
							<td>${dto.content}</td>
							<td><input type="button" value="삭제" onclick="deleteInfo('${dto.num}')"></td>
						</tr>
						<input type=hidden name="id" value="${dto.id}">
					</c:forEach>
				</c:if>
				
				<c:if test="${cnt == 0}">
				<tr name="trStaff">
					<td><select name="type">
							<option value="상여금">상여금</option>
							<option value="삭감">삭감</option>
					</select></td>
					<td><select name="state">
							<option value="지급">지급</option>
							<option value="미지급">미지급</option>
					</select></td>
					<td><input type="text" name="cost" placeholder="금액" required ></td>
					<td><input type="text" name="content" placeholder="사유" required ></td>
					<td><button class="btn btn-default" name="delStaff">삭제</button></td>
				</tr>
				</c:if>
			</tbody>
		</table>
		<input type=hidden name="id" value="${id}">
		<input type="submit" value="저장">
	</form>
