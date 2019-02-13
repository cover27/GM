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
                            <option value="�߰�">�߰�</option>
                            <option value="�谨">�谨</option>
                        </select>
                    </td>
                    <td>
                        <select name="state" id="state">
                            <option value="����">����</option>
                            <option value="������">������</option>
                        </select>
                    </td>
                    <td><input type="text" id="cost" value="${dto.cost}"></td>
                    <td><input type="text" id="content" value="${dto.content}"></td>
                    <td><input type="button" value="�����Ϸ�" onclick="J_ExtrapayInfoModifiedComplete('${dto.num}')"></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</form>
