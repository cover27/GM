<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	
	<form action="J_extrapayinfoUpdate" method="post">
		<table>
		    <tbody>
		        <c:if test="${cnt > 0}">
		            <c:forEach var="dto" items="${dtos}">
		                <tr name="trStaff">
		                    <td>${dto.type}</td>
		                    <td>${dto.state}</td>
		                    <td>${dto.cost}</td>
		                    <td>${dto.content}</td>
		                    <td>
		                        <input type="button" value="삭제" onclick="deleteInfo('${dto.num}')">
		                        <input type="button" value="수정" onclick="J_ExtrapayInfoModified('${dto.num}')" style="background:#d3292c;">
		                    </td>
		                </tr>
		                <input type=hidden name="id" value="${dto.id}">
		            </c:forEach>
		        </c:if>
		
		        <c:if test="${cnt == 0}">
		            <script type="text/javascript">
		                alert("급여정보 설정이 되어 있지 않습니다.");
		
		            </script>
		            <tr name="trStaff">
		                <td><select name="type">
		                        <option value="추가">추가</option>
		                        <option value="삭감">삭감</option>
		                    </select></td>
		                <td><select name="state">
		                        <option value="지급">지급</option>
		                        <option value="미지급">미지급</option>
		                    </select></td>
		                <td><input type="text" name="cost" placeholder="금액" required autofocus></td>
		                <td><input type="text" name="content" placeholder="사유" required></td>
		                <td></td>
		            </tr>
		        </c:if>
		    </tbody>
		</table>

		<input type=hidden name="id" value="${id}">
		<div class="J_BasicAllowanceManagement_btnset">
			<div class="fright">
				<input type="button" value="행 추가" name="addStaff" onclick="addhang()">
				<input type="hidden" value="${contents}" name="contents">
				<input type="submit" value="저장">
			</div>
			<div class="clear"></div>
		</div>
	</form>
