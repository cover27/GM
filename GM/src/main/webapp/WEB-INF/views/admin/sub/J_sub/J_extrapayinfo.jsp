<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<script>
    //추가 버튼
    $(document).on("click","button[name=addStaff]",function(){
         
        var addStaffText =  '<tr name="trStaff">'+
            '       <td><select name="type"><option value="상여금">상여금</option><option value="삭감">삭감</option></select></td>'+
            '       <td><select name="state"><option value="지급">지급</option><option value="미지급">미지급</option></select></td>'+
            '       <td><input type="text" name="cost" placeholder="금액" required ></td>'+
            '       <td><input type="text" name="content" placeholder="사유" required ></td>'+
            '       <td><button class="btn btn-default" name="delStaff">삭제</button></td>'+
            '       button class="btn btn-default" name="delStaff">삭제</button>'+
            '</tr>';
        var trHtml = $( "tr[name=trStaff]:last" ); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
        trHtml.after(addStaffText); //마지막 trStaff명 뒤에 붙인다.
    });
    //삭제 버튼
    $(document).on("click","button[name=delStaff]",function(){
        var trHtml = $(this).parent().parent();
        trHtml.remove(); //tr 테그 삭제
    });
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<button name="addStaff">행 추가</button>
	<form action="J_extrapayinfoUpdate" method="post">
		<table border="1">
			<thead>
				<tr>
					<td style="text-align: center; background-color: #cccccc;">상여금/삭감</td>
					<td style="text-align: center; background-color: #cccccc;">지급/공제(상태)</td>
					<td style="text-align: center; background-color: #cccccc;">금액</td>
					<td style="text-align: center; background-color: #cccccc;" >사유</td>
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
</body>
</html>