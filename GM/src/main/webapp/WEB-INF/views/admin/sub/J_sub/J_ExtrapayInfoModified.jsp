<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="#" method="post">
    <table>
        <tbody>
            <c:forEach var="dto" items="${dtos}">
                <tr>
                    <td>
                        <select name="type" id="type">
                            <option value="추가">추가</option>
                            <option value="삭감">삭감</option>
                        </select>
                    </td>
                    <td>
                        <select name="state" id="state">
                            <option value="지급">지급</option>
                            <option value="미지급">미지급</option>
                        </select>
                    </td>
                    <td><input type="text" id="cost" value="${dto.cost}"></td>
                    <td><input type="text" id="content" value="${dto.content}"></td>
                    <td><input type="button" value="수정완료" onclick="J_ExtrapayInfoModifiedComplete('${dto.num}')"></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</form>
